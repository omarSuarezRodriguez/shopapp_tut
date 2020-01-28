import 'package:flutter/material.dart';
import 'dart:async';

// My Own Imports
import 'home_page.dart';
import 'pages/favoritos.dart';
import 'pages/categorias.dart';
import 'pages/comprar.dart';
import 'pages/product_details.dart';
import 'pages/productos_recientes.dart';
import 'pages/quienes_somos.dart';
import 'pages/cart.dart';
import 'pages/pedidos.dart';
import 'pages/datos.dart';
import 'pages/ajustes.dart';

//
// Classes here
//
// main
// MyApp
// _MyAppState

//
// Class Principal main
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false, // Disable Banner - Desactivar

    // home: SafeArea Evita el uso de espacio de la interfaz del S.O del movil
//    home: SafeArea(
//      top: true,
//      bottom: true,
//      left: true,
//      right: true,
//      child: MyApp(), // MyApp, TODO está aquí
//    ),

    // Ruta Inicial
    initialRoute: '/',

    // ====================== RUTAS =====================

    routes: {
      // MAIN
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => SafeArea(
            top: true,
            bottom: true,
            left: true,
            right: true,
            child: MyApp(), // MyApp, TODO está aquí
          ),

      // HOMEPAGE, el CATALOGO
      // When navigating to the "/homepage" route, build the HomePage widget.
      '/homepage': (context) => HomePage(),

      // When navigating to the "/favoritos" route, build the SecondScreen widget.
      '/favoritos': (context) => Favoritos(),

      // When navigating to the "/categorias" route, build the SecondScreen widget.
      '/categorias': (context) => Categorias(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      '/comprar': (context) => ProfileTwoPage(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      '/productdetails': (context) => ProductDetails(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      '/productosrecientes': (context) => ProductosRecientes(),

      // When navigating to the "/pedidos" route, build the SecondScreen widget.
      '/pedidos': (context) => Pedidos(),

      // MIS DATOS PRINCIPALES, PAGE
      '/datos': (context) => Datos(),

      // When navigating to the "/ajustes" route, build the SecondScreen widget.
      '/ajustes': (context) => Ajustes(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      '/quienessomos': (context) => ChewieDemo(),

      // When navigating to the "/second" route, build the SecondScreen widget.
      '/cart': (context) => Cart(),
    },
  ));
} // End of Class Principal main

//
// Class MyApp
class MyApp extends StatefulWidget {
  // App title
  // (Change here and in home_page.dart)
  MyApp({this.title = 'YUKA TiendApp'});

  final String title;

  // End of App title

  @override
  _MyAppState createState() => _MyAppState();
} // End of Class MyApp

//
// Class _MyAppState
class _MyAppState extends State<MyApp> {
  TargetPlatform _platform; // Target Platform

  // initState
  @override
  void initState() {
    super.initState();
    // Logo Company - Image splash Screen
    Future.delayed(
      Duration(milliseconds: 1400), // Show logo for 1400 milliseconds
      () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ),
        );
      },
    );
  } // End of initState

  // Widget build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Disable Banner
      title: widget.title,
      // App title
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      // home
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset(
            'images/logo.jpg',
            height: 400,
            width: 400,
          ),
        ),
      ),
      routes: {
        'homepage': (context) => HomePage(title: 'HomePage'),
      },
    );
  } // End of Widget build

} // End of _MyAppState
