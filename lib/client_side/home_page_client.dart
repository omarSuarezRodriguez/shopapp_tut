import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

//
// My Own imports
import 'client_components/horizontal_listview.dart';
import 'client_components/products.dart';
import 'client_pages/productos_recientes.dart';
import 'client_pages/quienes_somos.dart';
import 'client_pages/categorias.dart';
import 'client_pages/comprar.dart';

import 'client_models/movie_model.dart';

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
  // Page Controller
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  // Widget para cerrar App
  Future<bool> _onBackPressed() {
    exit(0);
  }

  // ==============  PRUEBA ================
  // Selector de imagen para carta HD
  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
//            builder: (_) => MovieScreen(movie: movies[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 5.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 30.0,
              bottom: 40.0,
              child: Container(
                width: 250.0,
                child: Text(
                  "Sisas",
//                  movies[index].title.toUpperCase(),
                  style: TextStyle(
//                    backgroundColor: Color(0xffff3a5a),
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget build
  @override
  Widget build(BuildContext context) {
    //Color de status bar
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffff3a5a), // navigation bar color
      statusBarColor: Color(0xffff3a5a), // status bar color
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
        dotIncreasedColor: Color(0xffff3a5a),
        dotSize: 5.5,
        indicatorBgPadding: 4.0,
        autoplayDuration: Duration(milliseconds: 6000),
        // Duración por imagen
        animationDuration: Duration(milliseconds: 800), // Duración animación
      ),
    );
    // Fin Widget Image Carousel

    // Scaffold
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        // AppBar
        appBar: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              // Icono Drawer Menu
              icon: Icon(FontAwesomeIcons.bars),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
//          elevation: 0.1,
          backgroundColor: Color(0xffff3a5a),
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
//            IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),

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
                  color: Color(0xffff3a5a),
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
                    color: Color(0xffff3a5a),
                  ),
                ),
              ),

//            InkWell(
//              onTap: () {
//                Navigator.pushNamed(context, '/favoritos');
//              },
//              child: ListTile(
//                title: Text('Favoritos'),
//                leading: Icon(
//                  FontAwesomeIcons.heart,
//                  color: Colors.redAccent,
//                ),
//              ),
//            ),

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
//            InkWell(
//              onTap: () {
//                Navigator.pushNamed(context, '/categorias');
//              },
//              child: ListTile(
//                title: Text('Categorías'),
//                // Icono de Categorias
////                leading: Icon(
////                  FontAwesomeIcons.boxes,
////                  color: Colors.redAccent,
////                ),
//                leading: Icon(
//                  Icons.dashboard,
//                  color: Colors.lightBlueAccent,
//                ),
//              ),
//            ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/productos');
                },
                child: ListTile(
                  title: Text('Productos'),
                  leading: Icon(
                    Icons.local_offer,
//                  FontAwesomeIcons.history,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
//            InkWell(
//              onTap: () {},
//              child: ListTile(
//                title: Text('My Account'),
//                leading: Icon(
//                  FontAwesomeIcons.userAlt,
//                  color: Colors.redAccent,
//                ),
//              ),
//            ),
//            InkWell(
//              onTap: () {
//                Navigator.pushNamed(context, '/pedidos');
//              },
//              child: ListTile(
//                title: Text('Mis Pedidos'),
//                leading: Icon(
//                  FontAwesomeIcons.shoppingBag,
//                  color: Colors.greenAccent,
//                ),
//              ),
//            ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/comprar');
                },
                child: ListTile(
                  title: Text('Comprar'),
                  leading: Icon(
                    FontAwesomeIcons.shoppingCart,
                    color: Colors.greenAccent,
                  ),
                ),
              ),

              Divider(),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/datos');
                },
                child: ListTile(
                  title: Text('Mis Datos Principales'),
                  leading: Icon(
                    FontAwesomeIcons.user,
                    color: Colors.indigoAccent,
                  ),
                ),
              ),
//              InkWell(
//                onTap: () {
//                  Navigator.pushNamed(context, '/ajustes');
//                },
//                child: ListTile(
//                  title: Text('Ajustes'),
//                  leading: Icon(
//                    FontAwesomeIcons.cog,
//                  ),
//                ),
//              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/quienessomos');

//                Navigator.push(
//                  context,
//                  // Quienes somos
//                  MaterialPageRoute(builder: (context) => ChewieDemo()),
//                );
                },
                child: ListTile(
                  title: Text('Quienes Somos'),
                  leading: Icon(FontAwesomeIcons.solidQuestionCircle,
                      color: Colors.lightGreen),
                ),
              ),
              Divider(),
              InkWell(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (_) => false);

//                Navigator.push(
//                  context,
//                  // Quienes somos
//                  MaterialPageRoute(builder: (context) => ChewieDemo()),
//                );
                },
                child: ListTile(
                  title: Text('Cerrar Sesión'),
                  leading: Icon(Icons.exit_to_app,
//                leading: Icon(FontAwesomeIcons.solidQuestionCircle,
                      color: Colors.redAccent),
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

              // =========== PRUEBA =========
              Container(
                height: 200.0,
                width: double.infinity,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: movies.length,
                  itemBuilder: (BuildContext context, int index) {
                    return _movieSelector(index);
                  },
                ),
              ),

              SizedBox(
                height: 30.0,
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
                    Navigator.pushNamed(context, '/productosrecientes');

//                  Navigator.push(
//                    context,
//                    // Quienes somos
//                    MaterialPageRoute(
//                        builder: (context) => ProductosRecientes()),
//                  );

//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ProductosRecientes()));
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
              Productazos(),
//              Container(
//                height: 320.0,
//                child: Productazos(),
//              ),
            ],
          ),
        ),
      ),
    );
  } // End of Widget build

} // End of Class _HomePageState
