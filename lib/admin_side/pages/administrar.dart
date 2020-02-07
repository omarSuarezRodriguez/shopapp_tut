//import 'package:flutter/material.dart';
//
//class SecondPage extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Container(
//      child: new Center(
//        child: new Text('Second Page',
//          style: new TextStyle(fontSize: 25.0, color: Colors.teal),
//        ),
//      ),
//    );
//  }
//}
//
//

























import 'package:flutter/material.dart';

class AdministrarPageAdmin extends StatefulWidget {
  @override
  _AdministrarPageAdminState createState() => _AdministrarPageAdminState();
}

class _AdministrarPageAdminState extends State<AdministrarPageAdmin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Administrar"),
        backgroundColor: Colors.red,
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_circle, color: Colors.red),
            title: Text("Agregar Producto"),
            onTap: () {
              Navigator.pushNamed(context, '/agregarproducto');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.add, color: Colors.blue),
            title: Text("Agregar Clientes"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.library_books, color: Colors.green),
            title: Text("Cambiar Contraseña"),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app, color: Colors.redAccent),
            title: Text("Cerrar Sesión"),
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/login', (_) => false);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
