import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminProductos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Con esta configuración podemos implementar boton para atras en AppBar
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffff3a5a),
        title: Text("Productos"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    // ============= HomePageAdmin =============
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepageadmin', (_) => false);
                  },
                  child: ListTile(
                    title: Text('Tablero'),
                    // Icono Home
                    leading: Icon(
                      FontAwesomeIcons.home,
                      color: Color(0xffff3a5a),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Text("En Desarrollo"),
      ),
    );
  }
}
