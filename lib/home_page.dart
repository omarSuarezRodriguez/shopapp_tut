import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';

// My Own imports
import 'package:shopapp_tut/components/horizontal_listview.dart';
import 'package:shopapp_tut/components/products.dart';
import 'package:shopapp_tut/pages/quienes_somos.dart';
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
  @override
  Widget build(BuildContext context) {
    //Color de status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
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
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text('YUKA TiendApp'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search, color: Colors.white), onPressed: () {}),
          IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
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
            //header
            UserAccountsDrawerHeader(
              accountName: Text('YUKA'),
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
                leading: Icon(
                  Icons.home,
                  color: Colors.redAccent,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Categorías'),
                leading: Icon(Icons.dashboard),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Favoritos'),
                leading: Icon(Icons.favorite_border, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue),
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
      body: ListView(
        children: <Widget>[
          // Image Carousel begins here
          image_carousel,

          // Padding Categorias Widget
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Categorías',
              style: TextStyle(
//                fontSize: 20.0, // Tamaño de letra
//                fontWeight: FontWeight.bold, // Texto negrita, bold
                  ),
            ),
          ),

          // Horizontal ListView Begins
          HorizontalList(),

          // Padding Productos Recientes Widget
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Productos Recientes',
              style: TextStyle(
//                fontSize: 20.0, // Tamaño de letra
//                fontWeight: FontWeight.bold, // Texto negrita, bold
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
