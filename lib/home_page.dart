import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:page_transition/page_transition.dart';

//import 'package:t';
//import 'package:';

// My Own imports
import 'package:shopapp_tut/components/horizontal_listview.dart';
import 'package:shopapp_tut/components/products.dart';
import 'package:shopapp_tut/pages/productos_recientes.dart';
import 'package:shopapp_tut/pages/quienes_somos.dart';
import 'package:shopapp_tut/pages/categorias.dart';
import 'package:shopapp_tut/pages/comprar.dart';

//void main() {
//  runApp(MaterialApp(
//    debugShowCheckedModeBanner: false, //Desactivar Banner
//    home: SafeArea(
//      top: true,
//      bottom: true,
//      left: true,
//      right: true,
//      child: HomePage(),
//    ),
//  ));
//}

class HomePage extends StatefulWidget {
  // Título de ventana
  HomePage({this.title = 'YUKA'});

  final String title;

  // Final título de ventana app
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
//  Products productos = new Products();

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
//          AssetImage('images/w4.jpeg'),
//          AssetImage('images/m2.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn,
        dotBgColor: Colors.transparent,
//        dotColor: Colors.redAccent,
        dotIncreasedColor: Colors.redAccent,
        dotSize: 5.5,
        indicatorBgPadding: 4.0,
//        dotVerticalPadding: -14,
        autoplayDuration: Duration(milliseconds: 6000),
        // Duración c/u
        animationDuration: Duration(milliseconds: 800), // Duración animación
      ),
    );
    // Fin Widget Image Carousel

    //Scaffold
    return Scaffold(
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
              "YUKA TiendApp",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
//        title: Text('YUKA TiendApp'),

        actions: <Widget>[
          // Icono de buscar
          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),

          // Icono de comprar
          IconButton(
              icon: Icon(FontAwesomeIcons.shoppingCart),
              onPressed: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ProfileTwoPage()));

                Navigator.push(
                  context,
                  // Quienes somos
                  MaterialPageRoute(builder: (context) => ProfileTwoPage()),
                );
              }),
        ],
      ),
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
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ProductosRecientes()));

                Navigator.push(
                  context,
                  // Quienes somos
                  MaterialPageRoute(builder: (context) => ProductosRecientes()),
                );
              },
              child: ListTile(
                title: Text('Productos Recientes'),
                // Icono de Categorias
//                leading: Icon(
//                  FontAwesomeIcons.boxes,
//                  color: Colors.redAccent,
//                ),
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
//                leading: Icon(
//                  Icons.favorite_border,
//                  color: Colors.red,
//                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Ajustes'),
//                leading: Icon(
//                  FontAwesomeIcons.dev,
//                  color: Colors.redAccent,
//                ),
                leading: Icon(Icons.settings),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Mis Datos Principales'),
                // Icono de Categorias
//                leading: Icon(
//                  FontAwesomeIcons.boxes,
//                  color: Colors.redAccent,
//                ),
                leading: Icon(
                  Icons.person_outline,
                  color: Colors.indigo,
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ChewieDemo()));

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
      body: ListView(
        children: <Widget>[
          // Image Carousel begins here
          image_carousel,

          // Padding Categorias Text Widget
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FlatButton(
              onPressed: () {
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
                  MaterialPageRoute(builder: (context) => ProductosRecientes()),
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
    );
  }
}
//
////    AnnotatedRegion<SystemUiOverlayStyle>(
////      value: SystemUiOverlayStyle(
////        statusBarColor: Colors.red, // transparent status bar
//////        systemNavigationBarColor: Colors.black, // navigation bar color
//////        statusBarIconBrightness: Brightness.light, // status bar icons' color
//////        systemNavigationBarIconBrightness: Brightness.light, //navigation bar icons' color
////        statusBarBrightness: Brightness.light,
////      ),
////      child: ,
////    ),
