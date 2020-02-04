//
//
//  CONSERVAR
//
//   Widget onBackPressed - Cuando se da click atrás pregunta si cerrar o no
//
//  Metodo para mostrar showDialog que cierra la App
//
//  Future<bool> _onBackPressed() {
//    return showDialog(
//        context: context,
//        builder: (BuildContext context) {
//          return AlertDialog(
//            title: Text('Salir'),
//            content: Text('¿Desea salir?'),
//            actions: <Widget>[
//              FlatButton(
//                child: Text('Si'),
//                onPressed: () {
//                  exit(0);
//                },
//              ),
//              FlatButton(
//                child: Text('No'),
//                onPressed: () {
//                  Navigator.of(context).pop(false);
//                },
//              ),
//            ],
//          );
//        });
//  }
//
//