import 'package:flutter/material.dart';

//import 'pages/inicio/inicio_page.dart';
//import 'pages/publicar/publicar_page.dart';
//import 'pages/messenger/messenger_page.dart';
//import 'pages/micuenta/micuenta_page.dart';
import 'package:flutter/services.dart';
import 'package:shopapp_tut/admin_side/pages/administrar.dart';
import 'package:shopapp_tut/admin_side/pages/inicio.dart';

//void main() => runApp(HomePageAdmin());
//
//class HomePageAdmin extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return HomePageAdminState();
//  }
//}
//
//class HomePageAdminState extends State<HomePageAdmin> {
//  @override
//  Widget build(BuildContext context) {
//    //Color de barra de estado
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
//      statusBarColor: Colors.white, //or set color with: Color(0xFF0000FF)
//    ));
//    return MaterialApp(
//      title: 'Administrar YUKA',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: SafeArea(
//        //Método para evitar el uso de areas de pantalla del SO
//        //Activar o desactivar SafeArea dependiendo del lado
//        top: true,
//        bottom: true,
//        left: true,
//        right: true,
//        child: Home(), //Todo el home en esta clase
//      ),
//    );
//  }
//}

//
//
//  ==============   HomePageAdmin =============
//
//TODO el Home de la app aquí, clase HomePage
class HomePageAdmin extends StatefulWidget {
  @override
  _HomePageAdminState createState() => _HomePageAdminState();
}

class _HomePageAdminState extends State<HomePageAdmin> {
  int _selectedPage = 0;
  final _pageOptions = [
    //Clases donde están las pages
    AdministrarPage(),
    InicioPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
//        appBar: AppBar(
//          title: Text('Bottom Nav Bar'),
//        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          //Arreglar visualización bottomnavbar
          selectedItemColor: Colors.redAccent,
//          unselectedItemColor: Colors.blueAccent,
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("Inicio"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text("Administrar"),
            ),
          ],
        ),
      ),
    );
  }
}
