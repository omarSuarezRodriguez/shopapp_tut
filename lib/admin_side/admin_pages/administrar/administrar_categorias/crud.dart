import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';
import 'package:toast/toast.dart';
import 'user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../admin_widgets/widgets.dart';

class FireBaseFireStoreDemo extends StatefulWidget {
  FireBaseFireStoreDemo() : super();

//  final String title = "CloudFireStore Demo";

  @override
  FireBaseFireStoreDemoState createState() => FireBaseFireStoreDemoState();
}

class FireBaseFireStoreDemoState extends State<FireBaseFireStoreDemo> {
  //
  bool showTextField = false;
  TextEditingController controller = TextEditingController();
  String collectionName = "categorias";
  bool isEditing = false;
  User curUser;
  final focus = FocusNode();
  FocusNode f1 = FocusNode();

  // Para verificar que el TextFormField no esté vacio
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
        check().then((intenet) {
          if (intenet != null && intenet) {
            // Internet Present Case
            // AGREGAR!!!!!!!!!!!!!!!!!
            Firestore.instance.runTransaction(
              (Transaction transaction) async {
                await transaction.delete(user.reference);
              },
            );
            Navigator.pop(context);
            Toast.show("Categoría Eliminada", context,
                gravity: Toast.BOTTOM,
                duration: Toast.LENGTH_LONG,
                backgroundColor: Color(0xff4CAF50));
//            setState(() {
//              showTextField = false;
//            });
          } else {
            Navigator.pop(context);
            mostrarDialog(
                context,
                "Sin Conexión",
                "Debe tener conexión a internet para modificar la información.",
                "Cerrar",
                "",
                null,
                null);
//                  _showDialog();
          }
        });
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
          print("Nro Documentos: ${snapshot.data.documents.length}");
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

  // PARA QUE SE MUESTRE EL BOTON DE AGREGAR Y DE CANCELAR,
  // ESTO SE MUESTRA AL DAR CLICK EN AGREGAR
  button() {
    return SizedBox(
      width: double.infinity,
      child: Row(
//        mainAxisAlignment: MainAxisAlignment.start,
//        scrollDirection: Axis.vertical,
        children: <Widget>[
          OutlineButton(
//            shape:
//                RoundedRectangleBorder(side: BorderSide(color: Colors.green)),
//            highlightedBorderColor: Colors.green,
//            color: Colors.green,
//            highlightedBorderColor: Colors.green,
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

                      // Comprobar si isEditing es true o false
                      // Para mostrar toast si es añadida o modificada
                      if (isEditing) {
                        // CUANDO VA A AGREGAR EL EDITADO
                        add();
                        Toast.show("Categoria Modificada", context,
                            gravity: Toast.BOTTOM,
                            duration: Toast.LENGTH_LONG,
                            backgroundColor: Color(0xff4CAF50));
                        setState(() {
                          showTextField = false;
                        });
                      } else {
                        // CUANDO VA A AGREGAR UNO NUEVO
                        add();
                        Toast.show("Categoria Añadida", context,
                            gravity: Toast.BOTTOM,
                            duration: Toast.LENGTH_LONG,
                            backgroundColor: Color(0xff4CAF50));
                        setState(() {
                          showTextField = false;
                        });
                      }

//                      isEditing = false;
//                      Toast.show(
//                          isEditing
//                              ? "Categoría Añadida"
//                              : "Categoria Modificada",
//                          context,
//                          gravity: Toast.BOTTOM,
//                          duration: Toast.LENGTH_LONG,
//                          backgroundColor: Color(0xff4CAF50));
//                      setState(() {
//                        showTextField = false;
//                      });
                    } else {
                      mostrarDialog(
                          context,
                          "Sin Conexión",
                          "Debe tener conexión a internet para modificar la información.",
                          "Cerrar",
                          "",
                          null,
                          null);
//                      mostrarDialog(
//                          context,
//                          "Sin Conexión",
//                          "Debe tener conexión a internet para modificar la información.",
//                          "Cerrar",
//                          "",
//                          null,
//                          null);
//                  _showDialog();
                    }
                  });
                } else {
//              print("Hola");
                  mostrarDialog(context, "Error",
                      "Ingrese los datos por favor.", "Cerrar", "", null, null);
//              _showDialog();
                }
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
          ),
          OutlineButton(
            child: Text("Cancelar"),
            onPressed: () {
              setState(() {
                isEditing = false;
                showTextField = false;
                controller.text = "";
              });
            },
          ),
        ],
      ),
    );
  }

  // Cuando le damos OK al teclado
  clickOkTeclado() {
    setState(() {
      if (controller.text.isNotEmpty) {
        check().then((intenet) {
          if (intenet != null && intenet) {
            // Internet Present Case
            // AGREGAR!!!!!!!!!!!!!!!!!
            add();
            Toast.show("Cliente Añadido", context,
                gravity: Toast.BOTTOM, backgroundColor: Color(0xff4CAF50));
            setState(() {
              showTextField = false;
            });
          } else {
            mostrarDialog(
                context,
                "Sin Conexión",
                "Debe tener conexión a internet para modificar la información.",
                "Cerrar",
                "",
                null,
                null);
//                  _showDialog();
          }
        });
      } else {
        mostrarDialog(context, "Error", "Ingrese los datos por favor.",
            "Cerrar", "", null, null);
        f1.requestFocus();
      }
    });
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
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(bottom: 33.0, left: 17, right: 17, top: 17),
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
                        focusNode: f1,
                        onFieldSubmitted: (v) {
                          // Iniciar sesión
                          clickOkTeclado();
                        },
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: "Nombre Categoría",
//                          hintText: "Nombre de la categoría",
                        ),
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
          ],
        ),
      ),
      // Me muestra y no me muestra el floating action button dependiendo de
      // la propiedad visible
      floatingActionButton: Visibility(
        child: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              showTextField = !showTextField;
            });
          },
          label: Text(
            'Agregar',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0),
          ),
          icon: Icon(
            Icons.add_circle,
            color: Colors.white,
          ),
          backgroundColor: Color(0xff00E676),
        ),
        visible: !showTextField, // set it to false
      ),
    );
  }
}
