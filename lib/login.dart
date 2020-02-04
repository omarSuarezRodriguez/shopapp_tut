import 'package:flutter/material.dart';
import 'dart:async';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

//import 'Home.dart';
import 'package:flutter/services.dart';
import "admin_side/home_page_admin.dart";
import 'package:shopapp_tut/home_page.dart';

//void main() => runApp(MyApp());

//class Login extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Login',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: LoginPage(),
//    );
//  }
//}

class LoginPage extends StatefulWidget {
  static final String path = "lib/src/pages/login/login.dart";

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controlUsuario = new TextEditingController();
  TextEditingController controlContrasena = new TextEditingController();
  final focus = FocusNode();

  Future<List> obtenerUsuario() async {
    var url = "https://provitalplus.com.co/obtenerUsuario.php";
    final response = await http.post(url, body: {
      "usuario": controlUsuario.text,
      "contrasena": controlContrasena.text
    });

    if (controlUsuario.text.toString() == "admin" &&
        controlContrasena.text.toString() == "yuka") {
      Navigator.pushNamed(context, '/homepageadmin');
      Toast.show("LOGIN CORRECTO", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }

//    if (response.body == "CORRECTO") {
////      Navigator.pushReplacementNamed(context,'/Home');
////      Navigator.push(
////        context,
////        MaterialPageRoute(builder: (context) => App()),
////      );
////      HomePage();
//      Toast.show("LOGIN CORRECTO", context,
//          duration: Toast.LENGTH_LONG,
//          gravity: Toast.CENTER,
//          backgroundColor: Colors.green,
//          textColor: Colors.white);
//    } else if (response.body == "ERROR") {
//      Toast.show("LOGIN INCORRECTO", context,
//          duration: Toast.LENGTH_LONG,
//          gravity: Toast.CENTER,
//          backgroundColor: Colors.red,
//          textColor: Colors.white);
//    }
  }

  void iniciarSesion() {
    String usuario = controlUsuario.toString();

    // SI NO ES NINGUN LOGIN, INCORRECTO
    if (controlUsuario.text != "admin" || controlContrasena.text != "yuka") {
      if (controlUsuario.text != "cliente" ||
          controlContrasena.text != "cliente") {
        Toast.show("LOGIN INCORRECTO", context,
            duration: Toast.LENGTH_SHORT,
            gravity: Toast.CENTER,
            backgroundColor: Colors.red,
            textColor: Colors.white);
      }
    }

    // LOGIN ADMIN
    if (controlUsuario.text == "admin" && controlContrasena.text == "yuka") {
      Navigator.pushNamedAndRemoveUntil(
          context, '/homepageadmin', (_) => false);

//      Navigator.pushNamed(context, '/homepageadmin');
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => HomePageAdmin()),
//      );
      Toast.show("LOGIN CORRECTO", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }

    // LOGIN CLIENTE
    if (controlUsuario.text == "cliente" &&
        controlContrasena.text == "cliente") {
      Navigator.pushNamedAndRemoveUntil(context, '/homepage', (_) => false);

//      Navigator.pushNamed(context, '/homepageadmin');
//      Navigator.push(
//        context,
//        MaterialPageRoute(builder: (context) => HomePage()),
//      );
      Toast.show("LOGIN CORRECTO", context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          backgroundColor: Colors.green,
          textColor: Colors.white);
    }

//    // SI NO ES NINGUN LOGIN, INCORRECTO
//    if (controlUsuario.text != "admin" && controlContrasena.text != "yuka") {
//      if (controlUsuario.text != "cliente" &&
//          controlContrasena.text != "cliente") {
//        Toast.show("LOGIN INCORRECTO", context,
//            duration: Toast.LENGTH_SHORT,
//            gravity: Toast.CENTER,
//            backgroundColor: Colors.red,
//            textColor: Colors.white);
//      }
//    }

    // SI NO ES NINGUN LOGIN, INCORRECTO
//    if ((controlUsuario.text != "admin" && controlContrasena.text != "yuka") |
//        (controlUsuario.text != "cliente" &&
//            controlContrasena.text != "cliente")) {
//      Toast.show("LOGIN INCORRECTO", context,
//          duration: Toast.LENGTH_LONG,
//          gravity: Toast.CENTER,
//          backgroundColor: Colors.red,
//          textColor: Colors.white);
//    }

//    print(usuario);
  }

  @override
  Widget build(BuildContext context) {
    //Color de status bar
//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

//    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
//      statusBarColor: Colors.red, //or set color with: Color(0xFF0000FF)
////      statusBarColor: Colors.redAccent, //or set color with: Color(0xFF0000FF)
////      systemNavigationBarColor: Colors.red,
//    ));

    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: WaveClipper2(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x22ff3a5a), Color(0x22fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper3(),
                  child: Container(
                    child: Column(),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0x44ff3a5a), Color(0x44fe494d)])),
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper1(),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "YUKA",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 40),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 60,
                        ),
                      ],
                    ),
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffff3a5a), Color(0xfffe494d)])),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 23,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
//                autofocus: true,
                  onFieldSubmitted: (v) {
                    FocusScope.of(context).requestFocus(focus);
                  },
                  textInputAction: TextInputAction.next,
                  controller: controlUsuario,
                  onChanged: (String value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                      hintText: "Usuario",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.person,
                          color: Colors.red,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Material(
                elevation: 2.0,
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: TextFormField(
                  focusNode: focus,
                  onFieldSubmitted: (v) {
                    // Iniciar sesión
                    iniciarSesion();
                  },
                  controller: controlContrasena,
                  obscureText: true,
                  //Para ocultar texto
                  onChanged: (String value) {},
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                      hintText: "Contraseña",
                      prefixIcon: Material(
                        elevation: 0,
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        child: Icon(
                          Icons.lock,
                          color: Colors.red,
                        ),
                      ),
                      border: InputBorder.none,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 13)),
                ),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 32),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      color: Color(0xffff3a5a)),
                  child: FlatButton(
                    child: Text(
                      "Iniciar Sesión",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    onPressed: () {
                      iniciarSesion();
//                    obtenerUsuario();
                    },
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                "¿Has olvidado tu contraseña?",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ),
            ),
//          SizedBox(height: 40,),
//          Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//              Text("Don't have an Account ? ", style: TextStyle(color:Colors.black,fontSize: 12 ,fontWeight: FontWeight.normal),),
//              Text("Sign Up ", style: TextStyle(color:Colors.red, fontWeight: FontWeight.w500,fontSize: 12, decoration: TextDecoration.underline )),
//
//            ],
//          )
          ],
        ),
      ),
    );
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
