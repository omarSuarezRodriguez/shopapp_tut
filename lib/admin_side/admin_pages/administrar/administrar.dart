import 'package:flutter/material.dart';
import 'upload.dart';



// ==================================
// ==================================
// =========== Administrar ==========

class Administrar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.add_circle, color: Color(0xffff3a5a)),
            title: Text("Agregar Producto"),
            onTap: () {
              //
              Navigator.pushNamed(context, '/agregarproducto');
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => UploadPage()),
//              );
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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Cerrar Sesión'),
                      content: Text('¿Desea cerrar sesión?'),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Si'),
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/login', (_) => false);
                          },
                        ),
                        FlatButton(
                          child: Text('No'),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                      ],
                    );
                  });
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}

// ==================================
// ==================================
