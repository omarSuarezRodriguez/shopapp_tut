// HomePageAdmin
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/services.dart';

// My own imports
import 'admin_pages/tablero/tablero.dart';
import 'admin_pages/administrar/administrar.dart';

class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin>
    with SingleTickerProviderStateMixin {
  TabController controller;

  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Salir'),
            content: Text('¿Desea salir?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Si'),
                onPressed: () {
                  exit(0);
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
  }

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
      systemNavigationBarColor: Color(0xffff3a5a), // navigation bar color
      statusBarColor: Color(0xffff3a5a), // status bar color
    ));

    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xffff3a5a),
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
      ),
    );
  }
}


