import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductosTablero extends StatefulWidget {
  @override
  _ProductosTableroState createState() => _ProductosTableroState();
}

class _ProductosTableroState extends State<ProductosTablero> {
  // Cantidad categorias
  String cantCategorias;

  String collectionName = "productos";

  getUsers() {
    return Firestore.instance
        .collection(collectionName)
//        .orderBy('name')
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
                  Icons.local_offer,
                  color: Color(0xffff3a5a),
                ),
                label: Text(
                  "Productos",
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                ),
              ),
              subtitle: buildBody(context),
            ),
          ),
        ),
      ),
    );
  }
}
