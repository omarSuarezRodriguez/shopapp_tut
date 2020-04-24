import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'fullscreen_image_details.dart';

import 'fullscreen_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class WallScreen extends StatefulWidget {
  @override
  _WallScreenState createState() => _WallScreenState();
}

class _WallScreenState extends State<WallScreen> {
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> wallpaperList;
  final CollectionReference collectionReference =
      Firestore.instance.collection("productos");
  // Para referenciar una subcoleccion dentro de otra coleccion
//  final CollectionReference collectionReference =
//      Firestore.instance.collection("prod").document("Mari").collection("Mari");
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3a5a),
        title: Text("Productos"),

        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

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
                      color: Colors.greenAccent,
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
