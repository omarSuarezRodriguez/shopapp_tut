import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriasTablero extends StatefulWidget {
  @override
  _CategoriasTableroState createState() => _CategoriasTableroState();
}

class _CategoriasTableroState extends State<CategoriasTablero> {
  // Cantidad categorias
  String cantCategorias;

  String collectionName = "categorias";

  getUsers() {
    return Firestore.instance
        .collection(collectionName)
        .orderBy('name')
        .snapshots();
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Nro Documentos: ${snapshot.data.documents.length}");
          return Text(
            "${snapshot.data.documents.length}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0xffff3a5a), fontSize: 55.0),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

//  final databaseReference = Firestore.instance.collection("categorias");
//
//  String cantidad = databaseReference.getDocuments();
//
//  Future totalLikes(postID) async {
//    var respectsQuery = Firestore.instance
//        .collection('respects')
//        .where('postID', isEqualTo: postID);
//    respectsQuery.getDocuments().then((data) {
//      var totalEquals = data.documents.length;
//      return totalEquals;
//    });
//  }

//  Future total() async {
//    var respectsQuery = Firestore.instance.collection('respects');
//    var querySnapshot = await respectsQuery.getDocuments();
//    var totalEquals = querySnapshot.documents.length;
//    cantCategorias = totalEquals.toString();
//    return totalEquals;
//  }
//
//  @override
//  void initState() {
//    // TODO: implement initState
//    total();
//    super.initState();
//  }
//  String data(BuildContext context) {
//    StreamBuilder<QuerySnapshot>(
//      stream: getUsers(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Text('Error ${snapshot.error}');
//        }
//        if (snapshot.hasData) {
//          cantidad = snapshot.data.documents.length.toString();
//          print("Nro Documentos: ${snapshot.data.documents.length}");
////          return buildList(context, snapshot.data.documents);
//        }
//        return cantidad;
////        return CircularProgressIndicator();
//      },
//    );
//  }

//  Widget buildBody(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: getUsers(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Text('Error ${snapshot.error}');
//        }
//        if (snapshot.hasData) {
//          cantidad = snapshot.data.documents.length.toString();
//          print("Nro Documentos: ${snapshot.data.documents.length}");
////          return buildList(context, snapshot.data.documents);
//        }
////        return null;
//        return CircularProgressIndicator();
//      },
//    );
//  }

//  @override
//  void initState() {
//    // TODO: implement initState
//    buildBody(context);
//    super.initState();
//  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/productos');
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ListTile(
              title: FlatButton.icon(
                color: Colors.black,
                icon: Icon(
                  Icons.dashboard,
                  color: Colors.teal,
                ),
                label: Text(
                  "Categorías",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
              subtitle: buildBody(context),
//              Text(
////                "${countDocuments(context)}",
//////                countDocuments(context),
//////                "\$countDocuments()",
////                "2",
//
//                cantCategorias,
////                buildBody.toString(),
//                cantidad,
//                textAlign: TextAlign.center,
//                style: TextStyle(color: Color(0xffff3a5a), fontSize: 55.0),
//              ),
            ),
          ),
        ),
      ),
    );
  }
}
