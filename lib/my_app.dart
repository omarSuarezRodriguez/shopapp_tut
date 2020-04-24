import 'package:flutter/material.dart';
import 'package:shopapp_tut/admin_side/admin_pages/tablero/tablero_productos/tablero_productos_listado.dart';
import 'dart:async';

//
// == PRUEBAS ==
import 'admin_side/admin_pages/tablero/tablero_categorias/tablero_categorias_listado.dart';
import 'client_side/client_pages/cliente_categorias_listado.dart';
import 'firebase_crud/firestore_crud.dart';
import 'firestore_crud_mobile_programmer/crud.dart';
import 'upload_multiple_image/upload_multiple_image_page.dart';

// My Own Imports
import 'login.dart';

// Admin side imports
import 'admin_side/home_page_admin.dart';
import 'admin_side/admin_pages/administrar/administrar_productos/admin_productos.dart';
import 'admin_side/admin_pages/administrar/administrar_categorias/admin_categorias.dart';
import 'admin_side/admin_pages/administrar/administrar_clientes/admin_clientes.dart';
import 'admin_side/admin_pages/administrar/administrar_contrasenas/admin_contrasenas.dart';
import 'admin_side/admin_pages/tablero/tablero_clientes/tablero_clientes_listado.dart';
import 'admin_side/admin_widgets/agregar_producto.dart';

// Client side imports
import 'client_side/home_page_client.dart';
import 'client_side/client_pages/favoritos.dart';
import 'client_side/client_pages/categorias.dart';
import 'client_side/client_pages/comprar.dart';
import 'client_side/client_pages/product_details.dart';
import 'client_side/client_pages/productos_recientes.dart';
import 'client_side/client_pages/quienes_somos.dart';
import 'client_side/client_pages/cart.dart';
import 'client_side/client_pages/pedidos.dart';
import 'client_side/client_pages/datos.dart';
import 'client_side/client_pages/ajustes.dart';
import 'client_side/client_widgets/productos.dart';

//
// Classes here
//
// MyApp() -> Clase/Widget principal de la App
// LogoScreen() -> clase/widget del logo de la app, redirige al login

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

      //
      //
      //
      //

      // ===========================================================
      // ======================== < RUTAS > ========================
      // ===========================================================

      // Ruta Inicial - MAIN
      initialRoute: '/',

      // routes
      routes: {
        // ========== < MAIN > ==========
        // Main y logo inicial animación
        // When navigating to the "/" route, build the FirstScreen widget.
//        '/': (context) => SafeArea(child: FirestoreCRUDPage()),
        '/': (context) => SafeArea(child: LogoScreen()),
        // ========= < /MAIN > ==========

        // ========== < Login > ==========
        // Original
        '/login': (context) => SafeArea(child: LoginPage()),

        // Subir imagenes
//        '/login': (context) => SafeArea(child: UploadMultipleImageDemo()),

        // CRUD para guardar cosas de 1 dato en firestore
//        '/login': (context) => SafeArea(child: FireBaseFireStoreDemo()),
        // ========= < /Login > ==========

        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //

        // ===========================================
        // ========== < ADMIN side Routes > ==========
        // ===========================================

        // HOMEPAGE
        '/homepageadmin': (context) => SafeArea(child: HomePageAdmin()),

        // ======= < Tablero > =======
        // ===========================

        // Listado Categorías
        '/tablerocategoriaslistado': (context) => SafeArea(child: TableroCategoriasListado()),

        // Listado Clientes
        '/tableroclienteslistado': (context) =>
            SafeArea(child: TableroClientesListado()),

        // ====== < /Tablero > =======
        // ===========================

        // LISTADO GENERAL PRODUCTOS
        '/productosadminside': (context) => SafeArea(child: WallScreenAdminSide()),
        //
        //
        //
        //

        // ===== < Administrar > =====
        // ===========================

        // Administrar Productos, ruta de Productos en admin_side Administrar
        '/adminproductos': (context) => SafeArea(child: AdminProductos()),

        // Administrar Productos, ruta de Productos en admin_side Administrar
        '/admincategorias': (context) => SafeArea(child: AdminCategorias()),

        // Administrar Productos, ruta de Productos en admin_side Administrar
        '/adminclientes': (context) => SafeArea(child: AdminClientes()),

        // Administrar Productos, ruta de Productos en admin_side Administrar
        '/admincontrasenas': (context) => SafeArea(child: AdminContrasenas()),

        // AGREGAR PRODUCTO
        '/agregarproducto': (context) => SafeArea(child: ProfilePage()),

        // ==== < /Administrar > =====
        // ===========================

        // ===========================================
        // ========= < /ADMIN side Routes > ==========
        // ===========================================

        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //

        //============================================
        // ========== < USER side Routes > ===========
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
        '/categoriasclientes': (context) => SafeArea(child: TableroCategoriasListadoCliente()),

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

        //============================================
        // ========= < /USER side Routes > ===========
        //============================================

        // ===========================================================
        // ======================= < /RUTAS > ========================
        // ===========================================================

        //
        //
        //
        //
      },
    );
  }
}

//
//
// ===============================================
// =============== < LOGO SCREEN > ===============
// ===============================================
// Esta clase es donde nos redirige hacia el resto de la app, es el logo
class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    super.initState();
    // Logo de la empresa - Image splash Screen
    Future.delayed(
      Duration(milliseconds: 1400), // Show logo for 1400 milliseconds
      () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
      },
    );
  } // End of initState

  @override
  Widget build(BuildContext context) {
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
// ===============================================
// ============== < /LOGO SCREEN > ===============
// ===============================================
