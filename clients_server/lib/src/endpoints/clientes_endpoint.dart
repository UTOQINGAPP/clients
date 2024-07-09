import 'package:serverpod/server.dart';

import '../generated/protocol.dart';

class ClientesEndpoint extends Endpoint {
  Future<void> create(Session session, Cliente cliente) async {
    await Cliente.db.insertRow(session, cliente);
  }

  Future<void> delete(Session session, Cliente cliente) async {
    await Cliente.db.deleteRow(session, cliente);
  }

  Future<void> alter(Session session, Cliente cliente) async {
    await Cliente.db.updateRow(session, cliente);
  }

  Future<List<Cliente>> getAll(Session session) async {
    // Ordenando por la columna id siempre obtenemos los clientes en el mismo orden
    // y no en el orden en que fueron actualizados.
    return await Cliente.db.find(
      session,
      orderBy: (table) => table.id,
    );
  }

  Future<List<Cliente>> getLimiter(Session session,
      {int page = 1, int pageSize = 10}) async {
    // El offset es el número de elementos que se deben omitir antes de comenzar a contar los resultados de la página actual.
    int offset = (page - 1) * pageSize;
    // Ordenando por la columna id siempre obtenemos los clientes en el mismo orden
    // y no en el orden en que fueron actualizados.
    return await Cliente.db.find(
      session,
      limit: pageSize,
      offset: offset,
      orderBy: (table) => table.id,
    );
  }

  Future<int> getTotalPages(Session session, {int pageSize = 10}) async {
    return (await Cliente.db.count(session) / pageSize).ceil();
  }

  Future<Cliente?> getSearch(Session session, {required int id}) async {
    return await Cliente.db.findById(session, id);
  }
}
