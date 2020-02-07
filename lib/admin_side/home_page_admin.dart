// HomePageAdmin
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin>
    with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.red, // navigation bar color
      statusBarColor: Colors.red, // status bar color
    ));

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          "YUKA TiendApp Panel",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
//          indicatorColor: Colors.white,
          controller: controller,
          tabs: <Widget>[
            Tab(
//              icon: Icon(Icons.dashboard),
              icon: Icon(FontAwesomeIcons.home),
              text: "Tablero",
            ),
            Tab(
              icon: Icon(FontAwesomeIcons.cog),
              text: "Administrar",
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[
          Tablero(),
          Administrar(),
        ],
      ),
    );
  }
}

// ==================================
// ==================================
// ============= Tablero ============

class Tablero extends StatelessWidget {
  MaterialColor active = Colors.red;
  MaterialColor notActive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                // ======= RECUADRO PRODUCTOS =======
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.track_changes,
                            color: Colors.blue,
                          ),
                          label: Text(
                            "Productos",
                            style: TextStyle(color: Colors.black),
//                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          '30',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),

                // ========== RECUADRO CATEGORIAS ==============

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.category,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Categorías",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),

                // ============= RECUADRO CLIENTES ==============

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.people_outline,
                            color: Colors.indigo,
                          ),
                          label: Text(
                            "Clientes",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        subtitle: Text(
                          '50',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: active, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ==================================
// ==================================

//
//
//
//
//
//
//
//

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

// ==================================
// ==================================
