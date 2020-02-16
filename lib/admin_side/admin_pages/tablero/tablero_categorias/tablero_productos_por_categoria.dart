import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'fullscreen_image_details.dart';

import '../../../../client_side/client_widgets/fullscreen_image_details.dart';
import '../../../../client_side/client_widgets/fullscreen_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallScreenCategoria extends StatefulWidget {


//  final String nombre_categoria;//if you have multiple values add here
//  WallScreenCategoria(this.nombre_categoria, {Key key}): super(key: key);
//  String nombre_categoria;
//  WallScreenCategoria(this.nombre_categoria);


  // Con esto recibimos los valores del otro Widget/Page
//  var nombre_categoria;
//
//  WallScreenCategoria({this.nombre_categoria});
  // Hasta aquí se reciben los valores del otro Widget/Page



  String nombre_categoria;
  WallScreenCategoria(this.nombre_categoria);
  @override
  State<StatefulWidget> createState() {
    return _WallScreenCategoriaState(this.nombre_categoria);
  }




//  @override
//  _WallScreenCategoriaState createState() => _WallScreenCategoriaState();
//  @override
//  State<StatefulWidget> createState() {
//    return _WallScreenCategoriaState(this.nombre_categoria);
//  }
}

class _WallScreenCategoriaState extends State<WallScreenCategoria> {

  final String nombre_categoria;
  _WallScreenCategoriaState(this.nombre_categoria);
//  final nombre_categoria_final = widget.nombre_categoria;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpaperList;

//  final CollectionReference collectionReference =
//  Firestore.instance.collection("productos");
  // Para referenciar una subcoleccion dentro de otra coleccion

//  static String nombre = nombre_categoria;

//  final CollectionReference collectionReference =
//      Firestore.instance.collection("prod").where('', isEqualTo: nombre)

  final CollectionReference collectionReference =
  Firestore.instance.collection("prod").document("Barisol").collection("Barisol");
//
//
//  Future findBarcode() async {
////    String searchBarcode = await BarcodeScanner.scan();
//
//    String idOfBarcodeValue;
//    Stream<Query> stream = Firestore.instance
//        .collection('prod').document('${nombre_categoria}').where('barcode', isEqualTo: '${searchBarcode}').snapshots();
//    await for (Query q in stream) {
//      idOfBarcodeValue = q.documents[0].documentID;
//    }
//
//    print(idOfBarcodeValue);
//    // if the stream had no results, this will be null
//    // if the stream has one or more results, this will be the last result
//    return idOfBarcodeValue;
//  }


//
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subscription = collectionReference.snapshots().listen((datasnapshot) {
      setState(() {
        wallpaperList = datasnapshot.documents;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

//    final CollectionReference collectionReference =
//    Firestore.instance.collection("prod").document("${widget.nombre_categoria}").collection(widget.nombre_categoria);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3a5a),
        title: Text("Productos"),

        // ================ Acciones AppBar ================
        actions: <Widget>[
          // ========== Icono Lista AppBar ==========
          PopupMenuButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            itemBuilder: (context) => [
              // ========== Catalogo ==========
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (_) => false);
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
              ),

              // ========== COMPRAR ==========
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/comprar');
                  },
                  child: ListTile(
                    title: Text('Comprar'),
                    // Icono Home
                    leading: Icon(
                      FontAwesomeIcons.shoppingCart,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: wallpaperList != null
          ? new StaggeredGridView.countBuilder(
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 4,
              itemCount: wallpaperList.length,
              itemBuilder: (context, i) {
                String imgPath = wallpaperList[i].data['url'];
                return Material(
                  elevation: 8.0,
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) =>
                                FullScreenImagePageDetails(imgPath))),
                    child: Hero(
                      tag: imgPath,
                      child: FadeInImage(
                        image: NetworkImage(imgPath),
                        fit: BoxFit.cover,
                        placeholder: AssetImage("images/logo.png"),
                      ),
                    ),
                  ),
                );
              },
              staggeredTileBuilder: (i) =>
                  StaggeredTile.count(2, i.isEven ? 2 : 3),
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
