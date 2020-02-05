import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final myController = TextEditingController();

  File _image;

  @override
  Widget build(BuildContext context) {
    Future getImage() async {
      var image = await ImagePicker.pickImage(source: ImageSource.gallery);

      setState(() {
        _image = image;
        print('Image Path $_image');
      });
    }

//    Future uploadDatabase(BuildContext context) async {
//      final db = Firestore.instance;
//      DocumentReference ref =
//      await db.collection('productoss').add({'url': '$url'});
//    }

    Future uploadPic(BuildContext context) async {
      var perra = "Polka";

      // Categoria donde se guarda
      var categoria = myController.text;

      // Hora actual
      var now = new DateTime.now();

      // Para generar un nombre aleatorio
      var imageName = Uuid().v1();

      // Ubicacion de la imagen
      var imagePath = "/fotos/$categoria/$now.jpg";

      String fileName = basename(_image.path);

      // Referencia a Database en coleccion productos
//      var db = FirebaseDatabase.instance.reference().child("productos");

      // Referencia al Storage
      StorageReference firebaseStorageRef =
      FirebaseStorage.instance.ref().child(imagePath);

      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;

      //
      // Link de descarga de la imagen
      var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
      var url = downUrl.toString();

      // mostramos el link
      print("Download URL : $url");

      setState(() async {
        // Guardamos en database
//        final databaseReference = Firestore.instance;

//        Firestore.instance
//            .collection("wallpapers")
//            .document()
//            .setData({'url': '$url'});

        // Guardamos en database

//        final databaseReference = Firestore.instance;
//        DocumentReference ref =
//        await databaseReference.collection("productos").add({'url': '$url'});


//        Firestore.instance.collection('productos').add({'url' : '$url'});

        final db = Firestore.instance;
        DocumentReference ref =
        await db.collection('productos').add({'url': '$url'});


        print("Profile Picture uploaded");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('Producto Agregado Correctamente')));
//        Navigator.pop(context);
      });

//      final db = Firestore.instance;
//      DocumentReference ref =
//      await db.collection('productos').add({'url': '$url'});



//      Firestore.instance.runTransaction((transaction) async {
//        await transaction
//            .set(Firestore.instance.collection("productos").document(), {
//          'url': '$url',
//        });
//      });

//      // Guardamos en database
//      final databaseReference = Firestore.instance;
//      DocumentReference ref =
//          await databaseReference.collection("productos").add({'url': '$url'});

//      final databaseReference = Firestore.instance;
//      DocumentReference ref = await databaseReference.collection("productos")
//          .add({
//        'url': '$url'
//      });

//      Firestore.instance.runTransaction((transaction) async {
//        await transaction.set(Firestore.instance.collection("productos").document(), {
//          'url': '$url',
//        });
//      });
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text('Agregar Producto'),
      ),
      body: Builder(
        builder: (context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      radius: 100,
                      backgroundColor: Colors.red,
                      child: ClipOval(
                        child: new SizedBox(
                          width: 180.0,
                          height: 180.0,
                          child: (_image != null)
                              ? Image.file(
                            _image,
                            fit: BoxFit.fill,
                          )
                              : Image.network(
                            "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 60.0),
                    child: IconButton(
                      icon: Icon(
                        FontAwesomeIcons.camera,
                        size: 30.0,
                      ),
                      onPressed: () {
                        getImage();
                      },
                    ),
                  ),
                ],
              ),
//              TextField(
//                controller: myController,
//              ),
              SizedBox(
                height: 20.0,
              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Align(
//                    alignment: Alignment.centerLeft,
//                    child: Container(
//                      child: Column(
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('Username',
//                                style: TextStyle(
//                                    color: Colors.blueGrey, fontSize: 8.0)),
//                          ),
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('Michelle James',
//                                style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 9.0,
//                                    fontWeight: FontWeight.bold)),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Align(
//                    alignment: Alignment.centerRight,
//                    child: Container(
//                      child: Icon(
//                        FontAwesomeIcons.pen,
//                        color: Color(0xff476cfb),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Align(
//                    alignment: Alignment.centerLeft,
//                    child: Container(
//                      child: Column(
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('Birthday',
//                                style: TextStyle(
//                                    color: Colors.blueGrey, fontSize: 8.0)),
//                          ),
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('1st April, 2000',
//                                style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 9.0,
//                                    fontWeight: FontWeight.bold)),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Align(
//                    alignment: Alignment.centerRight,
//                    child: Container(
//                      child: Icon(
//                        FontAwesomeIcons.pen,
//                        color: Color(0xff476cfb),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Align(
//                    alignment: Alignment.centerLeft,
//                    child: Container(
//                      child: Column(
//                        children: <Widget>[
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('Location',
//                                style: TextStyle(
//                                    color: Colors.blueGrey, fontSize: 8.0)),
//                          ),
//                          Align(
//                            alignment: Alignment.centerLeft,
//                            child: Text('Paris, France',
//                                style: TextStyle(
//                                    color: Colors.black,
//                                    fontSize: 9.0,
//                                    fontWeight: FontWeight.bold)),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                  Align(
//                    alignment: Alignment.centerRight,
//                    child: Container(
//                      child: Icon(
//                        FontAwesomeIcons.pen,
//                        color: Color(0xff476cfb),
//                      ),
//                    ),
//                  ),
//                ],
//              ),
//              Container(
//                margin: EdgeInsets.all(20.0),
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.start,
//                  children: <Widget>[
//                    Text('Email',
//                        style:
//                        TextStyle(color: Colors.blueGrey, fontSize: 8.0)),
//                    SizedBox(width: 20.0),
//                    Text('michelle123@gmail.com',
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 9.0,
//                            fontWeight: FontWeight.bold)),
//                  ],
//                ),
//              ),
//              SizedBox(
//                height: 20.0,
//              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//                  RaisedButton(
//                    color: Colors.red,
//                    onPressed: () {
//                      Navigator.of(context).pop();
//                    },
//                    elevation: 4.0,
//                    splashColor: Colors.blueGrey,
//                    child: Text(s
//                      'Cancel',
//                      style: TextStyle(color: Colors.white, fontSize: 8.0),
//                    ),
//                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      uploadPic(context);
//                      uploadDatabase(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Agregar',
                      style: TextStyle(color: Colors.white, fontSize: 8.0),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
