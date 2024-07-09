import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showClienteDialog({
  required BuildContext context,
  String names = '',
  int phone = -1,
  String email = '',
  String address = '',
  required ValueChanged<(String, int, String, String)> onSaved,
}) {
  showCupertinoDialog(
    context: context,
    builder: (context) => ClienteDialog(
      onSaved: onSaved,
      names: names,
      phone: phone,
      email: email,
      address: address,
    ),
  );
}

class ClienteDialog extends StatefulWidget {
  const ClienteDialog({
    required this.onSaved,
    super.key,
    required this.names,
    required this.phone,
    required this.email,
    required this.address,
  });

  final String names;
  final int phone;
  final String email;
  final String address;
  final ValueChanged<(String, int, String, String)> onSaved;

  @override
  ClienteDialogState createState() => ClienteDialogState();
}

class ClienteDialogState extends State<ClienteDialog> {
  final TextEditingController controllerNames = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerAddress = TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerNames.text = widget.names;
    controllerPhone.text = widget.phone == -1 ? '' : widget.phone.toString();
    controllerEmail.text = widget.email;
    controllerAddress.text = widget.address;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CupertinoTextFormFieldRow(
              prefix: const Text(
                'Nombres:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              placeholder: 'Ingrese el nombre completo del cliente',
              controller: controllerNames,
            ),
            CupertinoTextFormFieldRow(
              prefix: const Text(
                'Teléfono:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              placeholder: 'Ingrese el teléfono del cliente',
              controller: controllerPhone,
            ),
            CupertinoTextFormFieldRow(
              prefix: const Text(
                'Correo Electrónico:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              placeholder: 'Ingrese el correo electrónico del cliente',
              controller: controllerEmail,
            ),
            CupertinoTextFormFieldRow(
              prefix: const Text(
                'Dirección:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              placeholder: 'Ingrese la dirección del cliente',
              controller: controllerAddress,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CupertinoActionSheetAction(
                    onPressed: () {
                      widget.onSaved((
                        controllerNames.text,
                        int.parse(controllerPhone.text),
                        controllerEmail.text,
                        controllerAddress.text
                      ));
                      Navigator.of(context).pop();
                    },
                    child: const Text('Guardar')),
                CupertinoActionSheetAction(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
