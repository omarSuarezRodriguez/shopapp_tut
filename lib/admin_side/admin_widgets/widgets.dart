import 'package:flutter/material.dart';

//  // Mostrar un alert Dialog
//// SUPER CHETADO
//// SI EL button_2 es diferente de "" , usamos doble boton, si no solo 1
//// EL resto de parametros se podrían pasar en null
void mostrarDialog(BuildContext context, String title, String body,
    String button_1, String button_2, Function func_1, Function func_2) {
  AlertDialog dialog;
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog

      if (button_2 == "") {
        dialog = AlertDialog(
          title: Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: Text(button_1),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      } else {
        dialog = AlertDialog(
          title: Text(title),
          content: new Text(body),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              child: Text(button_1),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: new Text(button_2),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
      return dialog;
    },
  );
}
