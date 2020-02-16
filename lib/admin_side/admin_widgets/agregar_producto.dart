import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import 'package:path/path.dart';
import 'package:shopapp_tut/admin_side/admin_widgets/widgets.dart';
import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';
import 'package:toast/toast.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // Checar si hay internet o no
  Future<bool> check() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  var category;
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
//      var categoria = myController.text;

      // Hora actual
      var now = new DateTime.now();

//       Para generar un nombre aleatorio
//      var imageName = Uuid().v1();

      // Ubicacion de la imagen
      var imagePath = "/productos_por_categoria/$category/$now.jpg";

//      String fileName = basename(_image.path);

      // Referencia a Database en coleccion productos
//      var db = FirebaseDatabase.instance.reference().child("productos");

      // Referencia al Storage
//      StorageReference firebaseStorageRef =
//          FirebaseStorage.instance.ref().child(imagePath);

//      // Referencia al Analytics
//      FirebaseAnalytics analytics = FirebaseAnalytics();

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

//      print("Profile Picture uploaded");
//      Scaffold.of(context).showSnackBar(
//          SnackBar(content: Text('Producto Agregado Correctamente')));

      setState(() async {
        // Guardamos en database

        final db = Firestore.instance;
        DocumentReference ref = await db
            .collection('prod')
            .document(category)
            .collection(category)
            .add({'url': '$url'});

        DocumentReference ref_2 =
            await db.collection('productos').add({'url': '$url'});

//        DocumentReference ref =
//            await db.collection('prod').add({'url': '$url'});
//
        print("Profile Picture uploaded");

        Toast.show("Producto Agregado Correctamente", context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM,
            backgroundColor: Color(0xff4CAF50));

//        Scaffold.of(context).showSnackBar(
//            SnackBar(content: Text('Producto Agregado Correctamente')));

//
//
//        final db = Firestore.instance;
//        DocumentReference ref = await db
//            .collection('/productos_por_categoria/$category/')
//            .add({'url': '$url'});
//
//        print("Profile Picture uploaded");
//        Toast.show("Imagen Añadida", context,
//            gravity: Toast.BOTTOM, backgroundColor: Color(0xff4CAF50));
////        Scaffold.of(context).showSnackBar(
////            SnackBar(content: Text('Producto Agregado Correctamente')));
////        Navigator.pop(context);
      });
    }

    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.red,
//        leading: IconButton(
//            icon: Icon(FontAwesomeIcons.arrowLeft),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        title: Text('Agregar Producto'),
//      ),
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
                      backgroundColor: Color(0xffff3a5a),
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
              Column(
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

                  // Combo Box con categorías
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Categoría: ",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      StreamBuilder(
                          stream: Firestore.instance
                              .collection('categorias')
                              .orderBy('name')
                              .snapshots(),
                          builder:
                              (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData)
                              Center(
                                child: const CupertinoActivityIndicator(),
                              );
                            return DropdownButton<String>(
                              value: category,
                              isDense: true,
                              hint: Text('Seleccione categoría'),
                              onChanged: (newValue) {
                                setState(() {
                                  category = newValue;
                                });
                              },
                              items: snapshot.data != null
                                  ? snapshot.data.documents
                                      .map((DocumentSnapshot document) {
                                      return new DropdownMenuItem<String>(
                                          value:
                                              document.data['name'].toString(),
                                          child: new Container(
//                                  height: 100.0,
                                            //color: primaryColor,
                                            child: new Text(
                                              document.data['name'].toString(),
                                            ),
                                          ));
                                    }).toList()
                                  : DropdownMenuItem(
                                      value: 'null',
                                      child: new Container(
                                        height: 100.0,
                                        child: new Text('null'),
                                      ),
                                    ),
                            );
                          }),
                    ],
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                    color: Color(0xff00E676),
                    onPressed: () {
                      if (category != null) {
                        // Quiere decir que el usuario seleccionó categoría

                        if (_image != null) {
                          // Quiere decir que el usuario si seleccionó imagen

                          check().then((intenet) {
                            if (intenet != null && intenet) {
                              // QUIERE DECIR QUE HAY INTERNET
                              // Internet Present Case

                              // Subir foto
                              print(category.toString());
                              uploadPic(context);
                              _image == null;
                              category == null;
//                            Toast.show("Foto Subida", context,
//                                gravity: Toast.BOTTOM, backgroundColor: Color(0xff4CAF50));

                            } else {
                              // NO HAY INTERNET
                              mostrarDialog(
                                  context,
                                  "Sin Conexión",
                                  "Debe tener conexión a internet para modificar la información.",
                                  "Cerrar",
                                  "",
                                  null,
                                  null);
                            }
                          });

                          print("Hola");
                        } else {
                          // El usuario no seleccionó la imagen
                          mostrarDialog(
                              context,
                              "Error",
                              "Seleccione la imagen por favor",
                              "Cerrar",
                              "",
                              null,
                              null);
                          print("Chao");
                        }
                      } else {
                        // El usuario no seleccionó categoría
                        mostrarDialog(
                            context,
                            "Error",
                            "Seleccione la categoría por favor",
                            "Cerrar",
                            "",
                            null,
                            null);
                      }

//                      // Subir foto
//                      uploadPic(context);
                    },
                    elevation: 4.0,
                    splashColor: Colors.blueGrey,
                    child: Text(
                      'Agregar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
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

//import 'dart:io';
//import 'package:flutter/material.dart';
//import 'package:image_cropper/image_cropper.dart';
//import 'package:image_picker/image_picker.dart';
//
//
//class ProfilePage extends StatefulWidget {
//  @override
//  _ProfilePageState createState() => _ProfilePageState();
//}
//
//class _ProfilePageState extends State<ProfilePage> {
//  File _selectedFile;
//  bool _inProcess = false;
//
//  Widget getImageWidget() {
//    if (_selectedFile != null) {
//      return Image.file(
//        _selectedFile,
//        width: 250,
//        height: 250,
//        fit: BoxFit.cover,
//      );
//    } else {
//      return Image.asset(
//        "assets/placeholder.jpg",
//        width: 250,
//        height: 250,
//        fit: BoxFit.cover,
//      );
//    }
//  }
//
//  getImage(ImageSource source) async {
//    this.setState((){
//      _inProcess = true;
//    });
//    File image = await ImagePicker.pickImage(source: source);
//    if(image != null){
//      File cropped = await ImageCropper.cropImage(
//          sourcePath: image.path,
//          aspectRatio: CropAspectRatio(
//              ratioX: 1, ratioY: 1),
//          compressQuality: 100,
//          maxWidth: 700,
//          maxHeight: 700,
//          compressFormat: ImageCompressFormat.jpg,
//          androidUiSettings: AndroidUiSettings(
//            toolbarColor: Colors.deepOrange,
//            toolbarTitle: "RPS Cropper",
//            statusBarColor: Colors.deepOrange.shade900,
//            backgroundColor: Colors.white,
//          )
//      );
//
//      this.setState((){
//        _selectedFile = cropped;
//        _inProcess = false;
//      });
//    } else {
//      this.setState((){
//        _inProcess = false;
//      });
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        body: Stack(
//          children: <Widget>[
//            Column(
//              mainAxisAlignment: MainAxisAlignment.center,
//              children: <Widget>[
//                getImageWidget(),
//                Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                  children: <Widget>[
//                    MaterialButton(
//                        color: Colors.green,
//                        child: Text(
//                          "Camera",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          getImage(ImageSource.camera);
//                        }),
//                    MaterialButton(
//                        color: Colors.deepOrange,
//                        child: Text(
//                          "Device",
//                          style: TextStyle(color: Colors.white),
//                        ),
//                        onPressed: () {
//                          getImage(ImageSource.gallery);
//                        })
//                  ],
//                )
//              ],
//            ),
//            (_inProcess)?Container(
//              color: Colors.white,
//              height: MediaQuery.of(context).size.height * 0.95,
//              child: Center(
//                child: CircularProgressIndicator(),
//              ),
//            ):Center()
//          ],
//        )
//    );
//  }
//}

//import 'dart:io';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_cropper/image_cropper.dart';
//import 'package:flutter_image_compress/flutter_image_compress.dart';
//import 'package:flutter/material.dart';
//
//class ProfilePage extends StatefulWidget {
//  @override
//  _ProfilePageState createState() => _ProfilePageState();
//}
//
//class _ProfilePageState extends State<ProfilePage> {
//  File _image;
//
//  getImageFile(ImageSource source) async {
//    //Clicking or Picking from Gallery
//
//    var image = await ImagePicker.pickImage(source: source);
//
//    //Cropping the image
//
//    File croppedFile = await ImageCropper.cropImage(
//      sourcePath: image.path,
////      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
////      maxWidth: 512,
////      maxHeight: 512,
//    );
//
//    //Compress the image
//
//    var result = await FlutterImageCompress.compressAndGetFile(
//      croppedFile.path,
//      croppedFile.path,
//      quality: 50,
//    );
//
//    setState(() {
//      _image = result;
//      print(_image.lengthSync());
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print(_image?.lengthSync());
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Click | Pick | Crop | Compress"),
//      ),
//      body: Center(
//        child: _image == null
//            ? Text("Image")
//            : Image.file(
//          _image,
//          height: 200,
//          width: 200,
//        ),
//      ),
//      floatingActionButton: Row(
//        mainAxisAlignment: MainAxisAlignment.end,
//        children: <Widget>[
//          FloatingActionButton.extended(
//            label: Text("Camera"),
//            onPressed: () => getImageFile(ImageSource.camera),
//            heroTag: UniqueKey(),
//            icon: Icon(Icons.camera),
//          ),
//          SizedBox(
//            width: 20,
//          ),
//          FloatingActionButton.extended(
//            label: Text("Gallery"),
//            onPressed: () => getImageFile(ImageSource.gallery),
//            heroTag: UniqueKey(),
//            icon: Icon(Icons.photo_library),
//          )
//        ],
//      ),
//    );
//  }
//}
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
//
//
//
//
//
//
//
//
////import 'package:flutter/material.dart';
////import 'dart:io';
////import 'package:flutter/widgets.dart';
////
////import 'package:firebase_storage/firebase_storage.dart';
////import 'package:image_cropper/image_cropper.dart';
////import 'package:image_picker/image_picker.dart';
////
////class ImageCapture extends StatefulWidget {
////  @override
////  _ImageCaptureState createState() => _ImageCaptureState();
////}
////
////class _ImageCaptureState extends State<ImageCapture> {
////  //
////  // Active image file
////  File _imageFile;
////
////  //
////  // Select and image via gallery or camera
////  Future<void> _pickImage(ImageSource source) async {
////    File selected = await ImagePicker.pickImage(source: source);
////
////    setState(() {
////
////    });
////  }
////
////  //
////  // Cropper Plugin
////  Future<void> _cropImage() async {
////    File cropped = await ImageCropper.cropImage(
////      sourcePath: _imageFile.path,
////
////      toolbarColor: Colors.purple,
////      toolbarWidgetColor: Colors.white,
////      toolbarTitle: 'Crop It'
////    );
////
////    setState(() {
////      _imageFile = cropped ?? _imageFile;
////    });
////
////  }
////
////
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold();
////  }
////}
////
//////import 'package:flutter/material.dart';
//////import 'dart:async';
//////import 'dart:io';
//////
//////import 'package:image_cropper/image_cropper.dart';
//////import 'package:image_picker/image_picker.dart';
//////
//////
//////
//////class ProfilePage extends StatefulWidget {
//////  final String title;
//////
//////  ProfilePage({this.title});
//////
//////  @override
//////  _ProfilePageState createState() => _ProfilePageState();
//////}
//////
//////enum AppState {
//////  free,
//////  picked,
//////  cropped,
//////}
//////
//////class _ProfilePageState extends State<ProfilePage> {
//////  AppState state;
//////  File imageFile;
//////
//////  @override
//////  void initState() {
//////    super.initState();
//////    state = AppState.free;
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return Scaffold(
//////      appBar: AppBar(
//////        title: Text(widget.title),
//////      ),
//////      body: Center(
//////        child: imageFile != null ? Image.file(imageFile) : Container(),
//////      ),
//////      floatingActionButton: FloatingActionButton(
//////        backgroundColor: Colors.deepOrange,
//////        onPressed: () {
//////          if (state == AppState.free)
//////            _pickImage();
//////          else if (state == AppState.picked)
//////            _cropImage();
//////          else if (state == AppState.cropped) _clearImage();
//////        },
//////        child: _buildButtonIcon(),
//////      ),
//////    );
//////  }
//////
//////  Widget _buildButtonIcon() {
//////    if (state == AppState.free)
//////      return Icon(Icons.add);
//////    else if (state == AppState.picked)
//////      return Icon(Icons.crop);
//////    else if (state == AppState.cropped)
//////      return Icon(Icons.clear);
//////    else
//////      return Container();
//////  }
//////
//////  Future<Null> _pickImage() async {
//////    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
//////    if (imageFile != null) {
//////      setState(() {
//////        state = AppState.picked;
//////      });
//////    }
//////  }
//////
//////  Future<Null> _cropImage() async {
//////    File croppedFile = await ImageCropper.cropImage(
//////        sourcePath: imageFile.path,
//////        aspectRatioPresets: Platform.isAndroid
//////            ? [
//////          CropAspectRatioPreset.square,
//////          CropAspectRatioPreset.ratio3x2,
//////          CropAspectRatioPreset.original,
//////          CropAspectRatioPreset.ratio4x3,
//////          CropAspectRatioPreset.ratio16x9
//////        ]
//////            : [
//////          CropAspectRatioPreset.original,
//////          CropAspectRatioPreset.square,
//////          CropAspectRatioPreset.ratio3x2,
//////          CropAspectRatioPreset.ratio4x3,
//////          CropAspectRatioPreset.ratio5x3,
//////          CropAspectRatioPreset.ratio5x4,
//////          CropAspectRatioPreset.ratio7x5,
//////          CropAspectRatioPreset.ratio16x9
//////        ],
//////        androidUiSettings: AndroidUiSettings(
//////            toolbarTitle: 'Cropper',
//////            toolbarColor: Colors.deepOrange,
//////            toolbarWidgetColor: Colors.white,
//////            initAspectRatio: CropAspectRatioPreset.original,
//////            lockAspectRatio: false),
//////        iosUiSettings: IOSUiSettings(
//////          title: 'Cropper',
//////        )
//////    );
//////    if (croppedFile != null) {
//////      imageFile = croppedFile;
//////      setState(() {
//////        state = AppState.cropped;
//////      });
//////    }
//////  }
//////
//////  void _clearImage() {
//////    imageFile = null;
//////    setState(() {
//////      state = AppState.free;
//////    });
//////  }
//////}
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////
//////import 'dart:io';
//////import 'package:image_picker/image_picker.dart';
//////import 'package:image_cropper/image_cropper.dart';
//////import 'package:flutter_image_compress/flutter_image_compress.dart';
//////import 'package:flutter/material.dart';
//////
//////class ProfilePage extends StatefulWidget {
//////  @override
//////  _ProfilePageState createState() => _ProfilePageState();
//////}
//////
//////class _ProfilePageState extends State<ProfilePage> {
//////  File _image;
//////
//////  getImageFile(ImageSource source) async {
//////    //Clicking or Picking from Gallery
//////
//////    var image = await ImagePicker.pickImage(source: source);
//////
//////    //Cropping the image
//////
//////    File croppedFile = await ImageCropper.cropImage(
//////      sourcePath: image.path,
//////      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
//////      maxWidth: 512,
//////      maxHeight: 512,
//////    );
//////
//////    //Compress the image
//////
//////    var result = await FlutterImageCompress.compressAndGetFile(
//////      croppedFile.path,
//////      croppedFile.path,
//////      quality: 50,
//////    );
//////
//////    setState(() {
//////      _image = result;
//////      print(_image.lengthSync());
//////    });
//////  }
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    print(_image?.lengthSync());
//////    return Scaffold(
//////      appBar: AppBar(
//////        title: Text("Click | Pick | Crop | Compress"),
//////      ),
//////      body: Center(
//////        child: _image == null
//////            ? Text("Image")
//////            : Image.file(
//////                _image,
//////                height: 200,
//////                width: 200,
//////              ),
//////      ),
//////      floatingActionButton: Row(
//////        mainAxisAlignment: MainAxisAlignment.end,
//////        children: <Widget>[
//////          FloatingActionButton.extended(
//////            label: Text("Camera"),
//////            onPressed: () => getImageFile(ImageSource.camera),
//////            heroTag: UniqueKey(),
//////            icon: Icon(Icons.camera),
//////          ),
//////          SizedBox(
//////            width: 20,
//////          ),
//////          FloatingActionButton.extended(
//////            label: Text("Gallery"),
//////            onPressed: () => getImageFile(ImageSource.gallery),
//////            heroTag: UniqueKey(),
//////            icon: Icon(Icons.photo_library),
//////          )
//////        ],
//////      ),
//////    );
//////  }
//////}
////////

//import 'package:flutter/material.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'dart:io';
//import 'package:path/path.dart';
//import 'package:uuid/uuid.dart';
//import 'package:firebase_database/firebase_database.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//
//class ProfilePage extends StatefulWidget {
//  @override
//  _ProfilePageState createState() => _ProfilePageState();
//}
//
//class _ProfilePageState extends State<ProfilePage> {
//  final myController = TextEditingController();
//
//  File _image;
//
//  @override
//  Widget build(BuildContext context) {
//    Future getImage() async {
//      var image = await ImagePicker.pickImage(source: ImageSource.gallery);
//
//      setState(() {
//        _image = image;
//        print('Image Path $_image');
//      });
//    }
//
////    Future uploadDatabase(BuildContext context) async {
////      final db = Firestore.instance;
////      DocumentReference ref =
////      await db.collection('productoss').add({'url': '$url'});
////    }
//
//    Future uploadPic(BuildContext context) async {
//      var perra = "Polka";
//
//      // Categoria donde se guarda
//      var categoria = myController.text;
//
//      // Hora actual
//      var now = new DateTime.now();
//
//      // Para generar un nombre aleatorio
//      var imageName = Uuid().v1();
//
//      // Ubicacion de la imagen
//      var imagePath = "/fotos/$categoria/$now.jpg";
//
//      String fileName = basename(_image.path);
//
//      // Referencia a Database en coleccion productos
////      var db = FirebaseDatabase.instance.reference().child("productos");
//
//      // Referencia al Storage
//      StorageReference firebaseStorageRef =
//          FirebaseStorage.instance.ref().child(imagePath);
//
//      // Referencia al Analytics
//      FirebaseAnalytics analytics = FirebaseAnalytics();
//
////      StorageReference firebaseStorageRef =
////      FirebaseStorage.instance.ref().child(imagePath);
//
//      StorageUploadTask uploadTask = firebaseStorageRef.putFile(_image);
//      StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//
//      //
//      // Link de descarga de la imagen
//      var downUrl = await (await uploadTask.onComplete).ref.getDownloadURL();
//      var url = downUrl.toString();
//
//      // mostramos el link
//      print("Download URL : $url");
//
//      setState(() async {
//        // Guardamos en database
////        final databaseReference = Firestore.instance;
//
////        Firestore.instance
////            .collection("wallpapers")
////            .document()
////            .setData({'url': '$url'});
//
//        // Guardamos en database
//
////        final databaseReference = Firestore.instance;
////        DocumentReference ref =
////        await databaseReference.collection("productos").add({'url': '$url'});
//
////        Firestore.instance.collection('productos').add({'url' : '$url'});
//
////        final db = Firestore.instance;
////        DocumentReference ref =
////            await db.collection('prod').document(now.toString()).collection(category).add({'url': '$url'});
//////        DocumentReference ref =
//////            await db.collection('prod').add({'url': '$url'});
//////
////        print("Profile Picture uploaded");
////        Scaffold.of(context).showSnackBar(
////            SnackBar(content: Text('Producto Agregado Correctamente')));
////        Navigator.pop(context);
//      });
//
////      final db = Firestore.instance;
////      DocumentReference ref =
////      await db.collection('productos').add({'url': '$url'});
//
////      Firestore.instance.runTransaction((transaction) async {
////        await transaction
////            .set(Firestore.instance.collection("productos").document(), {
////          'url': '$url',
////        });
////      });
//
////      // Guardamos en database
////      final databaseReference = Firestore.instance;
////      DocumentReference ref =
////          await databaseReference.collection("productos").add({'url': '$url'});
//
////      final databaseReference = Firestore.instance;
////      DocumentReference ref = await databaseReference.collection("productos")
////          .add({
////        'url': '$url'
////      });
//
////      Firestore.instance.runTransaction((transaction) async {
////        await transaction.set(Firestore.instance.collection("productos").document(), {
////          'url': '$url',
////        });
////      });
//    }
//
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.red,
//        leading: IconButton(
//            icon: Icon(FontAwesomeIcons.arrowLeft),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        title: Text('Agregar Producto'),
//      ),
//      body: Builder(
//        builder: (context) => Container(
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            children: <Widget>[
//              SizedBox(
//                height: 20.0,
//              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Align(
//                    alignment: Alignment.center,
//                    child: CircleAvatar(
//                      radius: 100,
//                      backgroundColor: Colors.red,
//                      child: ClipOval(
//                        child: new SizedBox(
//                          width: 180.0,
//                          height: 180.0,
//                          child: (_image != null)
//                              ? Image.file(
//                                  _image,
//                                  fit: BoxFit.fill,
//                                )
//                              : Image.network(
//                                  "https://images.unsplash.com/photo-1502164980785-f8aa41d53611?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
//                                  fit: BoxFit.fill,
//                                ),
//                        ),
//                      ),
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(top: 60.0),
//                    child: IconButton(
//                      icon: Icon(
//                        FontAwesomeIcons.camera,
//                        size: 30.0,
//                      ),
//                      onPressed: () {
//                        getImage();
//                      },
//                    ),
//                  ),
//                ],
//              ),
////              TextField(
////                controller: myController,
////              ),
//              SizedBox(
//                height: 20.0,
//              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                children: <Widget>[
////                  Align(
////                    alignment: Alignment.centerLeft,
////                    child: Container(
////                      child: Column(
////                        children: <Widget>[
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('Username',
////                                style: TextStyle(
////                                    color: Colors.blueGrey, fontSize: 8.0)),
////                          ),
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('Michelle James',
////                                style: TextStyle(
////                                    color: Colors.black,
////                                    fontSize: 9.0,
////                                    fontWeight: FontWeight.bold)),
////                          ),
////                        ],
////                      ),
////                    ),
////                  ),
////                  Align(
////                    alignment: Alignment.centerRight,
////                    child: Container(
////                      child: Icon(
////                        FontAwesomeIcons.pen,
////                        color: Color(0xff476cfb),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////              SizedBox(
////                height: 20.0,
////              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                children: <Widget>[
////                  Align(
////                    alignment: Alignment.centerLeft,
////                    child: Container(
////                      child: Column(
////                        children: <Widget>[
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('Birthday',
////                                style: TextStyle(
////                                    color: Colors.blueGrey, fontSize: 8.0)),
////                          ),
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('1st April, 2000',
////                                style: TextStyle(
////                                    color: Colors.black,
////                                    fontSize: 9.0,
////                                    fontWeight: FontWeight.bold)),
////                          ),
////                        ],
////                      ),
////                    ),
////                  ),
////                  Align(
////                    alignment: Alignment.centerRight,
////                    child: Container(
////                      child: Icon(
////                        FontAwesomeIcons.pen,
////                        color: Color(0xff476cfb),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////              SizedBox(
////                height: 20.0,
////              ),
////              Row(
////                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                children: <Widget>[
////                  Align(
////                    alignment: Alignment.centerLeft,
////                    child: Container(
////                      child: Column(
////                        children: <Widget>[
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('Location',
////                                style: TextStyle(
////                                    color: Colors.blueGrey, fontSize: 8.0)),
////                          ),
////                          Align(
////                            alignment: Alignment.centerLeft,
////                            child: Text('Paris, France',
////                                style: TextStyle(
////                                    color: Colors.black,
////                                    fontSize: 9.0,
////                                    fontWeight: FontWeight.bold)),
////                          ),
////                        ],
////                      ),
////                    ),
////                  ),
////                  Align(
////                    alignment: Alignment.centerRight,
////                    child: Container(
////                      child: Icon(
////                        FontAwesomeIcons.pen,
////                        color: Color(0xff476cfb),
////                      ),
////                    ),
////                  ),
////                ],
////              ),
////              Container(
////                margin: EdgeInsets.all(20.0),
////                child: Row(
////                  mainAxisAlignment: MainAxisAlignment.start,
////                  children: <Widget>[
////                    Text('Email',
////                        style:
////                        TextStyle(color: Colors.blueGrey, fontSize: 8.0)),
////                    SizedBox(width: 20.0),
////                    Text('michelle123@gmail.com',
////                        style: TextStyle(
////                            color: Colors.black,
////                            fontSize: 9.0,
////                            fontWeight: FontWeight.bold)),
////                  ],
////                ),
////              ),
////              SizedBox(
////                height: 20.0,
////              ),
//              Row(
//                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
////                  RaisedButton(
////                    color: Colors.red,
////                    onPressed: () {
////                      Navigator.of(context).pop();
////                    },
////                    elevation: 4.0,
////                    splashColor: Colors.blueGrey,
////                    child: Text(s
////                      'Cancel',
////                      style: TextStyle(color: Colors.white, fontSize: 8.0),
////                    ),
////                  ),
//                  RaisedButton(
//                    color: Colors.red,
//                    onPressed: () {
//                      uploadPic(context);
////                      uploadDatabase(context);
//                    },
//                    elevation: 4.0,
//                    splashColor: Colors.blueGrey,
//                    child: Text(
//                      'Agregar',
//                      style: TextStyle(color: Colors.white, fontSize: 8.0),
//                    ),
//                  ),
//                ],
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
////import 'dart:io';
////import 'package:flutter/material.dart';
////import 'package:image_cropper/image_cropper.dart';
////import 'package:image_picker/image_picker.dart';
////
////
////class ProfilePage extends StatefulWidget {
////  @override
////  _ProfilePageState createState() => _ProfilePageState();
////}
////
////class _ProfilePageState extends State<ProfilePage> {
////  File _selectedFile;
////  bool _inProcess = false;
////
////  Widget getImageWidget() {
////    if (_selectedFile != null) {
////      return Image.file(
////        _selectedFile,
////        width: 250,
////        height: 250,
////        fit: BoxFit.cover,
////      );
////    } else {
////      return Image.asset(
////        "assets/placeholder.jpg",
////        width: 250,
////        height: 250,
////        fit: BoxFit.cover,
////      );
////    }
////  }
////
////  getImage(ImageSource source) async {
////    this.setState((){
////      _inProcess = true;
////    });
////    File image = await ImagePicker.pickImage(source: source);
////    if(image != null){
////      File cropped = await ImageCropper.cropImage(
////          sourcePath: image.path,
////          aspectRatio: CropAspectRatio(
////              ratioX: 1, ratioY: 1),
////          compressQuality: 100,
////          maxWidth: 700,
////          maxHeight: 700,
////          compressFormat: ImageCompressFormat.jpg,
////          androidUiSettings: AndroidUiSettings(
////            toolbarColor: Colors.deepOrange,
////            toolbarTitle: "RPS Cropper",
////            statusBarColor: Colors.deepOrange.shade900,
////            backgroundColor: Colors.white,
////          )
////      );
////
////      this.setState((){
////        _selectedFile = cropped;
////        _inProcess = false;
////      });
////    } else {
////      this.setState((){
////        _inProcess = false;
////      });
////    }
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////        body: Stack(
////          children: <Widget>[
////            Column(
////              mainAxisAlignment: MainAxisAlignment.center,
////              children: <Widget>[
////                getImageWidget(),
////                Row(
////                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
////                  children: <Widget>[
////                    MaterialButton(
////                        color: Colors.green,
////                        child: Text(
////                          "Camera",
////                          style: TextStyle(color: Colors.white),
////                        ),
////                        onPressed: () {
////                          getImage(ImageSource.camera);
////                        }),
////                    MaterialButton(
////                        color: Colors.deepOrange,
////                        child: Text(
////                          "Device",
////                          style: TextStyle(color: Colors.white),
////                        ),
////                        onPressed: () {
////                          getImage(ImageSource.gallery);
////                        })
////                  ],
////                )
////              ],
////            ),
////            (_inProcess)?Container(
////              color: Colors.white,
////              height: MediaQuery.of(context).size.height * 0.95,
////              child: Center(
////                child: CircularProgressIndicator(),
////              ),
////            ):Center()
////          ],
////        )
////    );
////  }
////}
//
////import 'dart:io';
////import 'package:image_picker/image_picker.dart';
////import 'package:image_cropper/image_cropper.dart';
////import 'package:flutter_image_compress/flutter_image_compress.dart';
////import 'package:flutter/material.dart';
////
////class ProfilePage extends StatefulWidget {
////  @override
////  _ProfilePageState createState() => _ProfilePageState();
////}
////
////class _ProfilePageState extends State<ProfilePage> {
////  File _image;
////
////  getImageFile(ImageSource source) async {
////    //Clicking or Picking from Gallery
////
////    var image = await ImagePicker.pickImage(source: source);
////
////    //Cropping the image
////
////    File croppedFile = await ImageCropper.cropImage(
////      sourcePath: image.path,
//////      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
//////      maxWidth: 512,
//////      maxHeight: 512,
////    );
////
////    //Compress the image
////
////    var result = await FlutterImageCompress.compressAndGetFile(
////      croppedFile.path,
////      croppedFile.path,
////      quality: 50,
////    );
////
////    setState(() {
////      _image = result;
////      print(_image.lengthSync());
////    });
////  }
////
////  @override
////  Widget build(BuildContext context) {
////    print(_image?.lengthSync());
////    return Scaffold(
////      appBar: AppBar(
////        title: Text("Click | Pick | Crop | Compress"),
////      ),
////      body: Center(
////        child: _image == null
////            ? Text("Image")
////            : Image.file(
////          _image,
////          height: 200,
////          width: 200,
////        ),
////      ),
////      floatingActionButton: Row(
////        mainAxisAlignment: MainAxisAlignment.end,
////        children: <Widget>[
////          FloatingActionButton.extended(
////            label: Text("Camera"),
////            onPressed: () => getImageFile(ImageSource.camera),
////            heroTag: UniqueKey(),
////            icon: Icon(Icons.camera),
////          ),
////          SizedBox(
////            width: 20,
////          ),
////          FloatingActionButton.extended(
////            label: Text("Gallery"),
////            onPressed: () => getImageFile(ImageSource.gallery),
////            heroTag: UniqueKey(),
////            icon: Icon(Icons.photo_library),
////          )
////        ],
////      ),
////    );
////  }
////}
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
////
//////import 'package:flutter/material.dart';
//////import 'dart:io';
//////import 'package:flutter/widgets.dart';
//////
//////import 'package:firebase_storage/firebase_storage.dart';
//////import 'package:image_cropper/image_cropper.dart';
//////import 'package:image_picker/image_picker.dart';
//////
//////class ImageCapture extends StatefulWidget {
//////  @override
//////  _ImageCaptureState createState() => _ImageCaptureState();
//////}
//////
//////class _ImageCaptureState extends State<ImageCapture> {
//////  //
//////  // Active image file
//////  File _imageFile;
//////
//////  //
//////  // Select and image via gallery or camera
//////  Future<void> _pickImage(ImageSource source) async {
//////    File selected = await ImagePicker.pickImage(source: source);
//////
//////    setState(() {
//////
//////    });
//////  }
//////
//////  //
//////  // Cropper Plugin
//////  Future<void> _cropImage() async {
//////    File cropped = await ImageCropper.cropImage(
//////      sourcePath: _imageFile.path,
//////
//////      toolbarColor: Colors.purple,
//////      toolbarWidgetColor: Colors.white,
//////      toolbarTitle: 'Crop It'
//////    );
//////
//////    setState(() {
//////      _imageFile = cropped ?? _imageFile;
//////    });
//////
//////  }
//////
//////
//////
//////  @override
//////  Widget build(BuildContext context) {
//////    return Scaffold();
//////  }
//////}
//////
////////import 'package:flutter/material.dart';
////////import 'dart:async';
////////import 'dart:io';
////////
////////import 'package:image_cropper/image_cropper.dart';
////////import 'package:image_picker/image_picker.dart';
////////
////////
////////
////////class ProfilePage extends StatefulWidget {
////////  final String title;
////////
////////  ProfilePage({this.title});
////////
////////  @override
////////  _ProfilePageState createState() => _ProfilePageState();
////////}
////////
////////enum AppState {
////////  free,
////////  picked,
////////  cropped,
////////}
////////
////////class _ProfilePageState extends State<ProfilePage> {
////////  AppState state;
////////  File imageFile;
////////
////////  @override
////////  void initState() {
////////    super.initState();
////////    state = AppState.free;
////////  }
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    return Scaffold(
////////      appBar: AppBar(
////////        title: Text(widget.title),
////////      ),
////////      body: Center(
////////        child: imageFile != null ? Image.file(imageFile) : Container(),
////////      ),
////////      floatingActionButton: FloatingActionButton(
////////        backgroundColor: Colors.deepOrange,
////////        onPressed: () {
////////          if (state == AppState.free)
////////            _pickImage();
////////          else if (state == AppState.picked)
////////            _cropImage();
////////          else if (state == AppState.cropped) _clearImage();
////////        },
////////        child: _buildButtonIcon(),
////////      ),
////////    );
////////  }
////////
////////  Widget _buildButtonIcon() {
////////    if (state == AppState.free)
////////      return Icon(Icons.add);
////////    else if (state == AppState.picked)
////////      return Icon(Icons.crop);
////////    else if (state == AppState.cropped)
////////      return Icon(Icons.clear);
////////    else
////////      return Container();
////////  }
////////
////////  Future<Null> _pickImage() async {
////////    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
////////    if (imageFile != null) {
////////      setState(() {
////////        state = AppState.picked;
////////      });
////////    }
////////  }
////////
////////  Future<Null> _cropImage() async {
////////    File croppedFile = await ImageCropper.cropImage(
////////        sourcePath: imageFile.path,
////////        aspectRatioPresets: Platform.isAndroid
////////            ? [
////////          CropAspectRatioPreset.square,
////////          CropAspectRatioPreset.ratio3x2,
////////          CropAspectRatioPreset.original,
////////          CropAspectRatioPreset.ratio4x3,
////////          CropAspectRatioPreset.ratio16x9
////////        ]
////////            : [
////////          CropAspectRatioPreset.original,
////////          CropAspectRatioPreset.square,
////////          CropAspectRatioPreset.ratio3x2,
////////          CropAspectRatioPreset.ratio4x3,
////////          CropAspectRatioPreset.ratio5x3,
////////          CropAspectRatioPreset.ratio5x4,
////////          CropAspectRatioPreset.ratio7x5,
////////          CropAspectRatioPreset.ratio16x9
////////        ],
////////        androidUiSettings: AndroidUiSettings(
////////            toolbarTitle: 'Cropper',
////////            toolbarColor: Colors.deepOrange,
////////            toolbarWidgetColor: Colors.white,
////////            initAspectRatio: CropAspectRatioPreset.original,
////////            lockAspectRatio: false),
////////        iosUiSettings: IOSUiSettings(
////////          title: 'Cropper',
////////        )
////////    );
////////    if (croppedFile != null) {
////////      imageFile = croppedFile;
////////      setState(() {
////////        state = AppState.cropped;
////////      });
////////    }
////////  }
////////
////////  void _clearImage() {
////////    imageFile = null;
////////    setState(() {
////////      state = AppState.free;
////////    });
////////  }
////////}
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////
////////import 'dart:io';
////////import 'package:image_picker/image_picker.dart';
////////import 'package:image_cropper/image_cropper.dart';
////////import 'package:flutter_image_compress/flutter_image_compress.dart';
////////import 'package:flutter/material.dart';
////////
////////class ProfilePage extends StatefulWidget {
////////  @override
////////  _ProfilePageState createState() => _ProfilePageState();
////////}
////////
////////class _ProfilePageState extends State<ProfilePage> {
////////  File _image;
////////
////////  getImageFile(ImageSource source) async {
////////    //Clicking or Picking from Gallery
////////
////////    var image = await ImagePicker.pickImage(source: source);
////////
////////    //Cropping the image
////////
////////    File croppedFile = await ImageCropper.cropImage(
////////      sourcePath: image.path,
////////      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
////////      maxWidth: 512,
////////      maxHeight: 512,
////////    );
////////
////////    //Compress the image
////////
////////    var result = await FlutterImageCompress.compressAndGetFile(
////////      croppedFile.path,
////////      croppedFile.path,
////////      quality: 50,
////////    );
////////
////////    setState(() {
////////      _image = result;
////////      print(_image.lengthSync());
////////    });
////////  }
////////
////////  @override
////////  Widget build(BuildContext context) {
////////    print(_image?.lengthSync());
////////    return Scaffold(
////////      appBar: AppBar(
////////        title: Text("Click | Pick | Crop | Compress"),
////////      ),
////////      body: Center(
////////        child: _image == null
////////            ? Text("Image")
////////            : Image.file(
////////                _image,
////////                height: 200,
////////                width: 200,
////////              ),
////////      ),
////////      floatingActionButton: Row(
////////        mainAxisAlignment: MainAxisAlignment.end,
////////        children: <Widget>[
////////          FloatingActionButton.extended(
////////            label: Text("Camera"),
////////            onPressed: () => getImageFile(ImageSource.camera),
////////            heroTag: UniqueKey(),
////////            icon: Icon(Icons.camera),
////////          ),
////////          SizedBox(
////////            width: 20,
////////          ),
////////          FloatingActionButton.extended(
////////            label: Text("Gallery"),
////////            onPressed: () => getImageFile(ImageSource.gallery),
////////            heroTag: UniqueKey(),
////////            icon: Icon(Icons.photo_library),
////////          )
////////        ],
////////      ),
////////    );
////////  }
////////}
//////////
