import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClientesTablero extends StatefulWidget {
  @override
  _ClientesTableroState createState() => _ClientesTableroState();
}

class _ClientesTableroState extends State<ClientesTablero> {
  // Cantidad categorias
  String cantCategorias;

  String collectionName = "clientes";

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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: Card(
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, '/tableroclienteslistado');
          },
          child: Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: ListTile(
              title: FlatButton.icon(
                color: Colors.black,
                icon: Icon(
                  Icons.face,
                  color: Colors.indigoAccent,
                ),
                label: Text(
                  "Clientes",
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
