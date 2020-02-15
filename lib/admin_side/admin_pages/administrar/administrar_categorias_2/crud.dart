import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';
import 'package:toast/toast.dart';

class FireBaseFireStoreDemoDos extends StatefulWidget {
  FireBaseFireStoreDemoDos() : super();

//  final String title = "CloudFireStore Demo";

  @override
  FireBaseFireStoreDemoDosState createState() =>
      FireBaseFireStoreDemoDosState();
}

class FireBaseFireStoreDemoDosState extends State<FireBaseFireStoreDemoDos> {
  //
  var category;
  bool showTextField = false;
  TextEditingController controller = TextEditingController();

//  final _text = TextEditingController();
  String collectionName = "cate";
  bool isEditing = false;
  User curUser;

//  bool _validate = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  getUsers() {
    return Firestore.instance
        .collection(collectionName)
        .orderBy('name')
        .snapshots();
  }

  addUser() {
    User user = User(name: controller.text);
    try {
      Firestore.instance.runTransaction(
        (Transaction transaction) async {
          await Firestore.instance
              .collection(collectionName)
              .document()
              .setData(user.toJson());
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }

  add() {
    if (isEditing) {
      // Update
      update(curUser, controller.text);
      setState(() {
        isEditing = false;
      });
    } else {
      addUser();
    }
    controller.text = '';
  }

  update(User user, String newName) {
    try {
      Firestore.instance.runTransaction((transaction) async {
        await transaction.update(user.reference, {'name': newName});
      });
    } catch (e) {
      print(e.toString());
    }
  }

  delete(User user) {
    // set up the buttons
    Widget cancelButton = FlatButton(
      child: Text("Si"),
      onPressed: () {
        Firestore.instance.runTransaction(
          (Transaction transaction) async {
            await transaction.delete(user.reference);
          },
        );
        Navigator.pop(context);
      },
    );
    Widget continueButton = FlatButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Eliminar"),
      content: Text("¿Desea eliminar la categoría?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Widget buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getUsers(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error ${snapshot.error}');
        }
        if (snapshot.hasData) {
          print("Documents ${snapshot.data.documents.length}");
          return buildList(context, snapshot.data.documents);
        }
        return CircularProgressIndicator();
      },
    );
  }

  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
    return ListView(
      children: snapshot.map((data) => buildListItem(context, data)).toList(),
    );
  }

  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
    final user = User.fromSnapshot(data);
    return Padding(
      key: ValueKey(user.name),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(user.name),
          trailing: IconButton(
            icon: Icon(
              Icons.delete,
              color: Color(0xffff3a5a),
            ),
            onPressed: () {
              // delete
              delete(user);
            },
          ),
          onTap: () {
            // update
            setUpdateUI(user);
          },
        ),
      ),
    );
  }

  setUpdateUI(User user) {
    controller.text = user.name;
    setState(() {
      showTextField = true;
      isEditing = true;
      curUser = user;
    });
  }

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

  // Mostrar un alert Dialog
  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Sin conexión"),
          content: new Text(
              "Debe estar conectado a internet para poder agregar cliente"
              " nuevo"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Cerrar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  button() {
    return SizedBox(
      width: double.infinity,
      child: OutlineButton(
        child: Text(isEditing ? "Actualizar" : "Agregar"),
        onPressed: () {
          // AQUIIIIIIIIIIIII

          // SI HAY INTERNET, AGREGUE, Si NO NO !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//          if(!controller.) {
//
//          }

          setState(() {
            if (controller.text.isNotEmpty) {
              check().then((intenet) {
                if (intenet != null && intenet) {
                  // Internet Present Case
                  // AGREGAR!!!!!!!!!!!!!!!!!
                  add();
                  Toast.show("Categoría Añadida", context,
                      gravity: Toast.BOTTOM,
                      backgroundColor: Colors.lightGreen);
                  setState(() {
                    showTextField = false;
                  });
                } else {
                  _showDialog();
                }
              });
            } else {
              print("Hola");
              _showDialog();
            }

//            _text.text.isEmpty ? _validate = true : _validate = false;
          });

//          check().then((intenet) {
//            if (intenet != null && intenet) {
//              // Internet Present Case
//              add();
//              setState(() {
//                showTextField = false;
//              });
//            } else {
//              _showDialog();
//            }
//          });

//          add();
//          setState(() {
//            showTextField = false;
//          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffff3a5a),
        title: Text("Categorías"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    // ============= HomePageAdmin =============
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepageadmin', (_) => false);
                  },
                  child: ListTile(
                    title: Text('Tablero'),
                    // Icono Home
                    leading: Icon(
                      FontAwesomeIcons.home,
                      color: Color(0xffff3a5a),
                    ),
                  ),
                ),
              ),
            ],
          ),
//          IconButton(
//            icon: Icon(
//              Icons.add_circle,
//              color: Color(0xff00E676),
//            ),
//            onPressed: () {
//              setState(() {
//                showTextField = !showTextField;
//              });
//            },
//          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            showTextField
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        autofocus: true,
                        controller: controller,
                        decoration:
                            InputDecoration(labelText: "Nombre de Categoría"),
//                            hintText: "Nombre de la categoría"),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      button(),
                    ],
                  )
                : Container(),
            SizedBox(
              height: 15,
            ),
            Text(
              "Listado Categorías",
              style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w900,
                  color: Color(0xffff3a5a)),
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: buildBody(context),
            ),

            // Combo Box con categorías
            StreamBuilder(
                stream: Firestore.instance
                    .collection('cate')
                    .orderBy('name')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
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
                                value: document.data['name'].toString(),
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
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            showTextField = !showTextField;
          });
        },
        label: Text(
          'Agregar',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        icon: Icon(
          Icons.add_circle,
          color: Colors.white,
        ),
        backgroundColor: Color(0xff00E676),
      ),
    );
  }
}
