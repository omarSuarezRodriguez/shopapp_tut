import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// My Own imports
import 'package:shopapp_tut/components/horizontal_listview.dart';
import 'package:shopapp_tut/components/products.dart';
import 'package:shopapp_tut/pages/productos_recientes.dart';
import 'package:shopapp_tut/pages/quienes_somos.dart';
import 'package:shopapp_tut/pages/categorias.dart';
import 'package:shopapp_tut/pages/comprar.dart';

//
// Classes Here
//
// HomePage
// _HomePageState

//
// Class HomePage
class HomePage extends StatefulWidget {
  // App title
  // (Change here and in main.dart)
  HomePage({this.title = 'YUKA TiendApp'});

  final String title;

  // End of App title

  @override
  _HomePageState createState() => _HomePageState();
} // End of class HomePage

//
// Class _HomePageState
class _HomePageState extends State<HomePage> {
  // Widget para cerrar App
  Future<bool> _onBackPressed() {
    exit(0);
  }

  // Widget build
  @override
  Widget build(BuildContext context) {
    //Color de status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
      systemNavigationBarColor: Colors.red,
    ));
    //Fin color status bar

    // Inicio WidgetImage Carousel
    Widget image_carousel = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('images/slider.png'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/c1.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        dotBgColor: Colors.transparent,
//        dotColor: Colors.redAccent,
        dotIncreasedColor: Colors.redAccent,
        dotSize: 5.5,
        indicatorBgPadding: 4.0,
        autoplayDuration: Duration(milliseconds: 6000),
        // Duración por imagen
        animationDuration: Duration(milliseconds: 800), // Duración animación
      ),
    );
    // Fin Widget Image Carousel

    // Scaffold
    return Scaffold(
      // AppBar
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            // Icono Drawer Menu
            icon: Icon(FontAwesomeIcons.bars),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title, // Título de App
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
        actions: <Widget>[
          // Icono de buscar
          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),

          // Icono de comprar
          IconButton(
              icon: Icon(FontAwesomeIcons.shoppingCart),
              onPressed: () {
                Navigator.push(
                  context,
                  // Quienes somos Page
                  MaterialPageRoute(builder: (context) => ProfileTwoPage()),
                );
              }),
        ],
      ),

      // Menu Drawer
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            //header Menu Drawer
            UserAccountsDrawerHeader(
              accountName: Text(
                "YUKA",
                style: TextStyle(color: Colors.white, fontSize: 18.0),
              ),
              accountEmail: Text('App Tienda Virtual'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  minRadius: 80,
                  backgroundColor: Colors.blueGrey,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/logo.jpg"),
                    minRadius: 70,
                  ),
//                  backgroundColor: Colors.grey,
//                  radius: ,
//                  child: Image.asset(
//                    'images/logo.jpg',
//                    width: 80.0,
//                    height: 70.0,
//                  ),
//                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.red,
              ),
            ),

            //body
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ListTile(
                title: Text('Catálogo'),
                // Icono Home
                leading: Icon(
                  FontAwesomeIcons.home,
                  color: Colors.redAccent,
                ),
              ),
            ),
//            InkWell(
//              onTap: () {},
//              child: ListTile(
//                title: Text('My Account'),
//                leading: Icon(Icons.person),
//              ),
//            ),
//            InkWell(
//              onTap: () {},
//              child: ListTile(
//                title: Text('My Orders'),
//                leading: Icon(Icons.shopping_basket),
//              ),
//            ),
            InkWell(
              onTap: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: Categorias()));

                Navigator.push(
                  context,
                  // Quienes somos
                  MaterialPageRoute(builder: (context) => Categorias()),
                );
              },
              child: ListTile(
                title: Text('Categorías'),
                // Icono de Categorias
//                leading: Icon(
//                  FontAwesomeIcons.boxes,
//                  color: Colors.redAccent,
//                ),
                leading: Icon(
                  Icons.dashboard,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  // Productos Recientes Page
                  MaterialPageRoute(builder: (context) => ProductosRecientes()),
                );
              },
              child: ListTile(
                title: Text('Productos Recientes'),
                leading: Icon(
                  FontAwesomeIcons.levelDownAlt,
                  color: Colors.lightBlueAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(
                  FontAwesomeIcons.heart,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Ajustes'),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Mis Datos Principales'),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.indigo,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  // Quienes somos
                  MaterialPageRoute(builder: (context) => ChewieDemo()),
                );
              },
              child: ListTile(
                title: Text('Quienes Somos'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),

      //body de la app, lo que va debajo de la AppBar, ListView
      // Metodo para cerrar app si se da click hacia atrás
      body: WillPopScope(
        onWillPop: _onBackPressed,
        child: ListView(
          children: <Widget>[
            // Image Carousel begins here
            image_carousel,

            // Padding Categorias Text Widget
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    // Quienes somos
                    MaterialPageRoute(builder: (context) => Categorias()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Categorías",
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
              ),
            ),

//          // Padding Categorias Widget
//          Padding(
//            padding: const EdgeInsets.all(13.0),
//            child: Text(
//              'Categorías',
//              style: TextStyle(
//                fontSize: 17.0, // Tamaño de letra
//                fontWeight: FontWeight.bold, // Texto negrita, bold
//              ),
//            ),
//          ),

            // Horizontal ListView Begins
            HorizontalList(),

            // Padding Productos Recientes Text Widget
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: FlatButton(
                onPressed: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ProductosRecientes()));

                  Navigator.push(
                    context,
                    // Quienes somos
                    MaterialPageRoute(
                        builder: (context) => ProductosRecientes()),
                  );
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Productos Recientes",
                    style: TextStyle(fontSize: 19.0),
                  ),
                ),
              ),
            ),

            // Grid View
            Container(
              height: 320.0,
              child: Products(),
            ),
          ],
        ),
      ),
    );
  } // End of Widget build

} // End of Class _HomePageState
