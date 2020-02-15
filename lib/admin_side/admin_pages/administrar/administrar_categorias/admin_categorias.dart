import 'package:flutter/material.dart';
import 'crud.dart';
import '../administrar_categorias_2/crud.dart';

class AdminCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FireBaseFireStoreDemo();
  }
}





//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'crud.dart';
//import '../administrar_categorias_2/crud.dart';
//
//class AdminCategorias extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//
//      ),
//      body: Center(
//        child: ListView(
//          children: <Widget>[
//            FlatButton(
//              child: Text("Firestore 1"),
//              onPressed: (){
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => FireBaseFireStoreDemo()),
//                );
//              },
//            ),
//            FlatButton(
//              child: Text("Firestore 2"),
//              onPressed: (){
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => FireBaseFireStoreDemoDos()),
//                );
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}

//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//class AdminCategorias extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        //Con esta configuración podemos implementar boton para atras en AppBar
//        automaticallyImplyLeading: true,
//        backgroundColor: Color(0xffff3a5a),
//        title: Text("Categorías"),
//        actions: <Widget>[
//          PopupMenuButton(
//            icon: Icon(FontAwesomeIcons.ellipsisV),
//            itemBuilder: (context) => [
//              PopupMenuItem(
//                child: InkWell(
//                  onTap: () {
//                    // ============= HomePageAdmin =============
//                    Navigator.pushNamedAndRemoveUntil(
//                        context, '/homepageadmin', (_) => false);
//                  },
//                  child: ListTile(
//                    title: Text('Tablero'),
//                    // Icono Home
//                    leading: Icon(
//                      FontAwesomeIcons.home,
//                      color: Color(0xffff3a5a),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//        ],
//      ),
//      body: Center(
//        child: Text("En Desarrollo"),
//      ),
//    );
//  }
//}
