import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'my_app.dart';

//
// Classes here
//
// main

//
//
// class Principal main
void main() {
  // Para el color de la status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xffff3a5a),
    systemNavigationBarColor: Color(0xffff3a5a),
//    statusBarBrightness: Brightness.dark,
//    statusBarIconBrightness: Brightness.light,
//    systemNavigationBarIconBrightness: Brightness.light,
  ));

  // Para correr la App
  runApp(
    MyApp(),
  );
}
