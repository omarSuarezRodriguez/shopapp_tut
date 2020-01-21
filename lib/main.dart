import 'package:flutter/material.dart';
import 'home_page.dart';
import 'dart:async';

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
    home: SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: MyApp(),
    ),
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
  TargetPlatform _platform;

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
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //Desactivar Banner
      title: widget.title,
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
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
    );
  }
} // End of _MyAppState
