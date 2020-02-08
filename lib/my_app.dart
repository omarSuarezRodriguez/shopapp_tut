import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

// My Own Imports
import 'login.dart';
import 'widgets/productos.dart';

// Admin side imports
import 'admin_side/home_page_admin.dart';
import 'admin_side/admin_widgets/agregar_producto.dart';

// Client side imports
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
//
// class MyApp
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  TargetPlatform _platform; // Target Platform
  // Widget build
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Título App
      title: "YUKA TiendApp",
      // Disable Banner - Desactivar
      debugShowCheckedModeBanner: false,

      // =======================================================
      // ======================   RUTAS   ======================
      // =======================================================

      // Ruta Inicial
      initialRoute: '/',

      // Rutas
      routes: {
        // ========== MAIN =========
        // Main y logo inicial animación
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => SafeArea(child: LogoScreen()),

        // ===== LOGIN ======
        '/login': (context) => SafeArea(child: LoginPage()),

        //============================================
        // ============ ADMIN side Routes ============
        //============================================

        //HOMEPAGE
        '/homepageadmin': (context) => SafeArea(child: HomePageAdmin()),

        // AGREGAR PRODUCTO
        '/agregarproducto': (context) => SafeArea(child: ProfilePage()),

        //=======================================
        //=======================================

        //
        //
        //
        //
        //

        //============================================
        // ============ USER side Routes ============
        //============================================
        // HOMEPAGE, el CATALOGO
        // When navigating to the "/homepage" route, build the HomePage widget.
        '/homepage': (context) => SafeArea(child: HomePage()),

        // When navigating to the "/favoritos" route, build the SecondScreen widget.
        '/favoritos': (context) => SafeArea(child: Favoritos()),

        // When navigating to the "/categorias" route, build the SecondScreen widget.
        '/categorias': (context) => SafeArea(child: Categorias()),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/comprar': (context) => SafeArea(child: ProfileTwoPage()),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/productdetails': (context) => SafeArea(child: ProductDetails()),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/productosrecientes': (context) =>
            SafeArea(child: ProductosRecientes()),

        // PRODUCTOS WALLFY
        '/productos': (context) => SafeArea(child: WallScreen()),

        // When navigating to the "/pedidos" route, build the SecondScreen widget.
        '/pedidos': (context) => SafeArea(child: Pedidos()),

        // MIS DATOS PRINCIPALES, PAGE
        '/datos': (context) => SafeArea(child: Datos()),

        // When navigating to the "/ajustes" route, build the SecondScreen widget.
        '/ajustes': (context) => SafeArea(child: Ajustes()),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/quienessomos': (context) => SafeArea(child: ChewieDemo()),

        // When navigating to the "/second" route, build the SecondScreen widget.
        '/cart': (context) => SafeArea(child: Cart()),

        //=======================================
        //=======================================
      },
    );
  }
}

//
//
// ===============================================
// ================= LOGO SCREEN =================
// ===============================================
// Esta clase es donde nos redirige hacia el resto de la app, es el logo
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  // initState
  @override
  void initState() {
    super.initState();
    // Logo Company - Image splash Screen
    Future.delayed(
      Duration(milliseconds: 1400), // Show logo for 1400 milliseconds
      () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
      },
    );
  } // End of initState

  @override
  Widget build(BuildContext context) {
    // SafeArea y dentro la App
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          'images/logo.jpg',
          height: 400,
          width: 400,
        ),
      ),
    );
  }
}
