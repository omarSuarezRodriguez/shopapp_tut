import 'package:flutter/material.dart';

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
            leading: Icon(Icons.local_offer, color: Color(0xffff3a5a)),
            title: Text("Productos"),
            onTap: () {
              // Administrar Productos
              Navigator.pushNamed(context, '/adminproductos');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.dashboard, color: Colors.teal),
            title: Text("Categorías"),
            onTap: () {
              // Administrar Categorias
              Navigator.pushNamed(context, '/admincategorias');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.face, color: Colors.indigoAccent),
            title: Text("Clientes"),
            onTap: () {
              // Administrar Clientes
              Navigator.pushNamed(context, '/adminclientes');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.library_books, color: Colors.lightGreen),
            title: Text("Contraseñas"),
            onTap: () {
              // Administrar Contraseñas
              Navigator.pushNamed(context, '/admincontrasenas');
            },
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
