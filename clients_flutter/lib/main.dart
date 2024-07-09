import 'package:clients_client/clients_client.dart';
import 'package:clients_flutter/cliente_dialog.dart';
import 'package:clients_flutter/loading_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://$localhost:8080/')
  ..connectivityMonitor = FlutterConnectivityMonitor();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sistemas Web',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Sistemas Web'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  List<Cliente>? _clientes;
  Exception? _connectionException;
  int page = 1;
  int pageSize = 10;
  int? totalPages;
  bool searchActive = false;
  TextEditingController searchController = TextEditingController();

  void _connectionFailed(dynamic exception) {
    setState(() {
      _clientes = null;
      _connectionException = exception;
    });
  }

  Future<void> _loadClientes({required int page, required int pageSize}) async {
    try {
      final clientes =
          await client.clientes.getLimiter(page: page, pageSize: pageSize);
      totalPages = await client.clientes.getTotalPages(pageSize: pageSize);
      setState(() {
        _clientes = clientes;
      });
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _createCliente(Cliente cliente) async {
    try {
      await client.clientes.create(cliente);
      await _loadClientes(page: page, pageSize: pageSize);
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _deleteCliente(Cliente cliente) async {
    try {
      await client.clientes.delete(cliente);
      await _loadClientes(page: page, pageSize: pageSize);
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _updateCliente(Cliente cliente) async {
    try {
      await client.clientes.alter(cliente);
      await _loadClientes(page: page, pageSize: pageSize);
    } catch (e) {
      _connectionFailed(e);
    }
  }

  Future<void> _searchCliente(String value) async {
    try {
      if (_clientes != null) {
        List<Cliente> clienteExiste = _clientes!.where((cliente) {
          return cliente.names.contains(value) ||
              cliente.phone.compareTo(int.tryParse(value) ?? -1) ==
                  int.tryParse(value) ||
              cliente.email.contains(value) ||
              cliente.address.contains(value) ||
              cliente.registered.toString() == value;
        }).toList();
        if (clienteExiste.isNotEmpty) {
          _clientes = clienteExiste;
          searchActive = true;
        }
      }
    } catch (e) {
      searchActive = false;

      _connectionFailed(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _loadClientes(page: page, pageSize: pageSize);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: false,
        elevation: 10,
        forceMaterialTransparency: true,
        shape: Border(
            bottom:
                BorderSide(width: 2, color: Theme.of(context).primaryColor)),
      ),
      bottomNavigationBar: Container(
        height: 20,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Sistemas Web',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const SizedBox(width: 2),
                const Text('© 2024 Diego Moreano Merino'),
              ],
            )),
      ),
      body: _clientes == null
          ? LoadingScreen(
              exception: _connectionException,
              onTryAgain: () => _loadClientes(page: page, pageSize: pageSize),
            )
          : Container(
              margin: const EdgeInsets.only(
                  top: 15, bottom: 15, right: 25, left: 25),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Mostrar'),
                              const SizedBox(width: 10),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black.withOpacity(.2),
                                      width: 1), // Borde del contenedor
                                  borderRadius: BorderRadius.circular(
                                      8), // Bordes redondeados
                                ),
                                child: DropdownButton<int>(
                                  underline: Container(),
                                  focusColor: Colors.transparent,
                                  alignment: AlignmentDirectional.centerEnd,
                                  isDense: true,
                                  value: pageSize,
                                  items: const [
                                    DropdownMenuItem(
                                      value: 5,
                                      child: Text('5'),
                                    ),
                                    DropdownMenuItem(
                                      value: 10,
                                      child: Text('10'),
                                    ),
                                    DropdownMenuItem(
                                      value: 20,
                                      child: Text('20'),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    pageSize = value!;
                                    _loadClientes(
                                        page: page, pageSize: pageSize);
                                    setState(() {});
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text('registros'),
                            ],
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 300,
                            child: CupertinoSearchTextField(
                              controller: searchController,
                              onSubmitted: (value) {
                                _searchCliente(value);
                                setState(() {});
                              },
                              onSuffixTap: () {
                                searchActive = false;
                                searchController.clear();
                                if (searchController.text.isEmpty) {
                                  _loadClientes(page: page, pageSize: pageSize);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          if (searchActive)
                            FilledButton.tonal(
                                onPressed: () {
                                  searchActive = false;
                                  searchController.clear();
                                  if (searchController.text.isEmpty) {
                                    _loadClientes(
                                        page: page, pageSize: pageSize);
                                  }
                                },
                                child: const Text('Cerrar busqueda')),
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                          onPressed: () {
                            showClienteDialog(
                              context: context,
                              onSaved: (data) {
                                var cliente = Cliente(
                                  names: data.$1,
                                  phone: data.$2,
                                  email: data.$3,
                                  address: data.$4,
                                  registered: DateTime.now(),
                                );
                                _clientes!.add(cliente);
                                _createCliente(cliente);
                              },
                            );
                          },
                          child: const Text('Nuevo cliente')),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          DataTable(
                            headingRowColor: MaterialStatePropertyAll(
                                Colors.black.withOpacity(.2)),
                            border: TableBorder.all(
                                color: Theme.of(context).disabledColor),
                            columns: const <DataColumn>[
                              DataColumn(
                                numeric: true,
                                label: Expanded(
                                  child: Text(
                                    'ID',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Nombres',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Teléfono',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Correo Electrónico',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Dirección',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Registro',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Expanded(
                                  child: Text(
                                    'Acciones',
                                    style:
                                        TextStyle(fontStyle: FontStyle.italic),
                                  ),
                                ),
                              ),
                            ],
                            rows: List<DataRow>.generate(
                              _clientes!.length,
                              (int index) {
                                return DataRow(
                                  cells: <DataCell>[
                                    DataCell(
                                        Text(_clientes![index].id.toString())),
                                    DataCell(Text(_clientes![index].names)),
                                    DataCell(Text(
                                        _clientes![index].phone.toString())),
                                    DataCell(Text(_clientes![index].email)),
                                    DataCell(Text(_clientes![index].address)),
                                    DataCell(Text(_clientes![index]
                                        .registered
                                        .toString())),
                                    DataCell(Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FloatingActionButton.small(
                                          heroTag: 'edit',
                                          backgroundColor:
                                              CupertinoColors.activeBlue,
                                          onPressed: () {
                                            var cliente = _clientes![index];
                                            showClienteDialog(
                                              context: context,
                                              names: cliente.names,
                                              phone: cliente.phone,
                                              email: cliente.email,
                                              address: cliente.address,
                                              onSaved: (data) {
                                                var clienteUpdate =
                                                    cliente.copyWith(
                                                  names: data.$1,
                                                  phone: data.$2,
                                                  email: data.$3,
                                                  address: data.$4,
                                                );
                                                _updateCliente(clienteUpdate);
                                                setState(() {});
                                              },
                                            );
                                          },
                                          child: const Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        const SizedBox(width: 10),
                                        FloatingActionButton.small(
                                          heroTag: 'delete',
                                          backgroundColor:
                                              CupertinoColors.destructiveRed,
                                          onPressed: () {
                                            var cliente = _clientes![index];

                                            setState(() {
                                              _clientes!.remove(cliente);
                                            });

                                            _deleteCliente(cliente);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    )),
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.arrow_back),
                                onPressed: page <= 1
                                    ? null
                                    : () {
                                        page -= 1;
                                        _loadClientes(
                                            page: page, pageSize: pageSize);
                                        setState(() {});
                                      },
                                disabledColor: Colors.grey,
                                // Desactivar el botón si estamos en la primera página
                                color: page == 1
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                              Text(
                                'Página $page de $totalPages',
                                style: const TextStyle(fontSize: 16.0),
                              ),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                onPressed: page >= totalPages!
                                    ? null
                                    : () {
                                        page += 1;
                                        _loadClientes(
                                            page: page, pageSize: pageSize);
                                        setState(() {});
                                      },
                                disabledColor: Colors.grey,
                                // Desactivar el botón si estamos en la última página
                                color: page == totalPages
                                    ? Colors.grey
                                    : Theme.of(context).primaryColor,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
