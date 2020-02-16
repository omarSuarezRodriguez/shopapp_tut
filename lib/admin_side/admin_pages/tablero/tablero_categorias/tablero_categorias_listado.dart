import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:toast/toast.dart';
import 'user.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../admin_widgets/widgets.dart';
import 'tablero_productos_por_categoria.dart';

class TableroCategoriasListado extends StatefulWidget {
//  TableroCategoriasListado() : super();

//  final nombre_cat;
//
//  TableroCategoriasListado({
//    this.nombre_cat,
//  });

//  final String title = "CloudFireStore Demo";

  @override
  TableroCategoriasListadoState createState() =>
      TableroCategoriasListadoState();
}

class TableroCategoriasListadoState extends State<TableroCategoriasListado> {
  //
  bool showTextField = false;
  TextEditingController controller = TextEditingController();
  String collectionName = "categorias";
  bool isEditing = false;
  User curUser;
  FocusNode f1 = FocusNode();

  var nombre_cat;

  TableroCategoriasListadoState({
    this.nombre_cat,
  });




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
      padding: EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlueAccent),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: ListTile(
          title: Text(user.name),
//          trailing: IconButton(
//            icon: Icon(
//              Icons.delete,
//              color: Color(0xffff3a5a),
//            ),
////            onPressed: () {
////              // delete
////              delete(user);
////            },
//          ),
          onTap: () {
            // AL DARLE CLIC A UNA CATEGORIA!!!!!! !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//            Navigator.push(
//              context,
//              MaterialPageRoute(builder: (context) => WallScreenCategoria()),
//            );

//          nombre_cat = "";
//
//            Navigator.of(context).push(
//              new MaterialPageRoute(
//                // Here we are passing the values of the product to the product
//                // details page
//                builder: (context) => new WallScreenCategoria(
//                  nombre_categoria: nombre_cat,
//                ),
//              ),
//            );


//          Navigator.push(
//              context,
//              MaterialPageRoute(
//                  builder: (context) => WallScreenCategoria(user.name)));


          Navigator.of(context).push(MaterialPageRoute(builder:(context)=>WallScreenCategoria(user.name)));






//            String nombre_cat = "";
//            Navigator.of(context).push(
//              new MaterialPageRoute(
//                // Here we are passing the values of the product to the product
//                // details page
//                builder: (context) => new WallScreenCategoria(
//                  nombre_categoria: nombre_cat,
//                ),
//              ),
//            );






//            mostrarDialog(context, "Prueba", "Esto es una prueba", "Cerrar", "", null, null);
            // update
//            setUpdateUI(user);
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
                      Toast.show("Cliente Añadido", context,
                          gravity: Toast.BOTTOM,
                          duration: Toast.LENGTH_LONG,
                          backgroundColor: Color(0xff4CAF50));
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
                    }
                  });
                } else {
                  mostrarDialog(context, "Error",
                      "Ingrese los datos por favor.", "Cerrar", "", null, null);
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
        automaticallyImplyLeading: true,
        backgroundColor: Color(0xffff3a5a),
        title: Text("Categorías"),
        leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.arrowLeft,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          // Icono de buscar
//          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),
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
        padding: EdgeInsets.only(bottom: 0.0, left: 17, right: 17, top: 17),
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
//                        textInputAction: TextInputAction.send,
                        autofocus: true,
                        textCapitalization: TextCapitalization.words,
                        autocorrect: false,
                        enableSuggestions: false,
                        controller: controller,
                        decoration: InputDecoration(
                          labelText: "Nombre Cliente",
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
//      floatingActionButton: Visibility(
//        child: FloatingActionButton.extended(
//          onPressed: () {
//            setState(() {
//              showTextField = !showTextField;
//            });
//          },
//          label: Text(
//            'Agregar',
//            style: TextStyle(
//                color: Colors.white,
//                fontWeight: FontWeight.bold,
//                fontSize: 16.0),
//          ),
//          icon: Icon(
//            Icons.add_circle,
//            color: Colors.white,
//          ),
//          backgroundColor: Color(0xff00E676),
//        ),
//        visible: !showTextField, // set it to false
//      ),

//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          setState(() {
//            showTextField = !showTextField;
//          });
//        },
//        label: Text(
//          'Agregar',
//          style: TextStyle(
//              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
//        ),
//        icon: Icon(
//          Icons.add_circle,
//          color: Colors.white,
//        ),
//        backgroundColor: Color(0xff00E676),
//      ),
    );
  }
}


//
//
//class Single_prod extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container();
//  }
//}

//
//class Nombre_Cat extends StatelessWidget {
//  final nombre_cat;
//
//  Nombre_Cat({
//    this.nombre_cat,
//  });
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Card(
//      child: Hero(
//        tag: Text("hero 1"),
//        child: Material(
//          child: InkWell(
//            onTap: () =>
//                Navigator.of(context).push(
//              new MaterialPageRoute(
//                // Here we are passing the values of the product to the product
//                // details page
//                builder: (context) => new WallScreenCategoria(
//                  nombre_categoria: nombre_cat,
//                ),
//              ),
//            ),
//            child: GridTile(
//                footer: Container(
//                  color: Colors.white70,
//
//                  child: Row(
//                    children: <Widget>[
//                      Expanded(
//                        child: Text(
//                          prod_name,
//                          style: TextStyle(
//                              fontWeight: FontWeight.bold, fontSize: 16.0),
//                        ),
//                      ),
//                      Text(
//                        "\$${prod_price}",
//                        style: TextStyle(
//                            color: Colors.red, fontWeight: FontWeight.bold),
//                      ),
//                    ],
//                  ),
////                  child: ListTile(
////                    leading: Text(
////                      prod_name,
////                      style: TextStyle(fontWeight: FontWeight.bold),
////                    ),
////                    title: Text(
////                      "\$$prod_price",
////                      style: TextStyle(
////                          color: Colors.red, fontWeight: FontWeight.w800),
////                    ),
////                    subtitle: Text(
////                      "\$$prod_old_price",
////                      style: TextStyle(
//////                        decoration: TextDecoration.lineThrough,
////                        color: Colors.black54,
////                        fontWeight: FontWeight.w800,
////                        decoration: TextDecoration.lineThrough,
////                      ),
////                    ),
////                  ),
//                ),
//                child: Image.asset(
//                  prod_pricture,
//                  fit: BoxFit.cover,
//                )),
//          ),
//        ),
//      ),
//    );
//  }
//}

//import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'user.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//
//class FireBaseFireStoreDemo extends StatefulWidget {
//  FireBaseFireStoreDemo() : super();
//
////  final String title = "CloudFireStore Demo";
//
//  @override
//  FireBaseFireStoreDemoState createState() => FireBaseFireStoreDemoState();
//}
//
//class FireBaseFireStoreDemoState extends State<FireBaseFireStoreDemo> {
//  //
//  bool showTextField = false;
//  TextEditingController controller = TextEditingController();
//  String collectionName = "clientes";
//  bool isEditing = false;
//  User curUser;
//
//  getUsers() {
//    return Firestore.instance
//        .collection(collectionName)
//        .orderBy('name')
//        .snapshots();
//  }
//
//  addUser() {
//    User user = User(name: controller.text);
//    try {
//      Firestore.instance.runTransaction(
//        (Transaction transaction) async {
//          await Firestore.instance
//              .collection(collectionName)
//              .document()
//              .setData(user.toJson());
//        },
//      );
//    } catch (e) {
//      print(e.toString());
//    }
//  }
//
//  add() {
//    if (isEditing) {
//      // Update
//      update(curUser, controller.text);
//      setState(() {
//        isEditing = false;
//      });
//    } else {
//      addUser();
//    }
//    controller.text = '';
//  }
//
//  update(User user, String newName) {
//    try {
//      Firestore.instance.runTransaction((transaction) async {
//        await transaction.update(user.reference, {'name': newName});
//      });
//    } catch (e) {
//      print(e.toString());
//    }
//  }
//
//  delete(User user) {
//    // set up the buttons
//    Widget cancelButton = FlatButton(
//      child: Text("Si"),
//      onPressed: () {
//        Firestore.instance.runTransaction(
//          (Transaction transaction) async {
//            await transaction.delete(user.reference);
//          },
//        );
//        Navigator.pop(context);
//      },
//    );
//    Widget continueButton = FlatButton(
//      child: Text("No"),
//      onPressed: () {
//        Navigator.pop(context);
//      },
//    );
//
//    // set up the AlertDialog
//    AlertDialog alert = AlertDialog(
//      title: Text("Eliminar"),
//      content: Text("¿Desea eliminar el cliente?"),
//      actions: [
//        cancelButton,
//        continueButton,
//      ],
//    );
//
//    // show the dialog
//    showDialog(
//      context: context,
//      builder: (BuildContext context) {
//        return alert;
//      },
//    );
//  }
//
//  Widget buildBody(BuildContext context) {
//    return StreamBuilder<QuerySnapshot>(
//      stream: getUsers(),
//      builder: (context, snapshot) {
//        if (snapshot.hasError) {
//          return Text('Error ${snapshot.error}');
//        }
//        if (snapshot.hasData) {
//          print("Documents ${snapshot.data.documents.length}");
//          return buildList(context, snapshot.data.documents);
//        }
//        return CircularProgressIndicator();
//      },
//    );
//  }
//
//  Widget buildList(BuildContext context, List<DocumentSnapshot> snapshot) {
//    return ListView(
//      children: snapshot.map((data) => buildListItem(context, data)).toList(),
//    );
//  }
//
//  Widget buildListItem(BuildContext context, DocumentSnapshot data) {
//    final user = User.fromSnapshot(data);
//    return Padding(
//      key: ValueKey(user.name),
//      padding: EdgeInsets.symmetric(vertical: 8.0),
//      child: Container(
//        decoration: BoxDecoration(
//          border: Border.all(color: Colors.lightBlueAccent),
//          borderRadius: BorderRadius.circular(5.0),
//        ),
//        child: ListTile(
//          title: Text(user.name),
//          trailing: IconButton(
//            icon: Icon(
//              Icons.delete,
//              color: Color(0xffff3a5a),
//            ),
//            onPressed: () {
//              // delete
//              delete(user);
//            },
//          ),
//          onTap: () {
//            // update
//            setUpdateUI(user);
//          },
//        ),
//      ),
//    );
//  }
//
//  setUpdateUI(User user) {
//    controller.text = user.name;
//    setState(() {
//      showTextField = true;
//      isEditing = true;
//      curUser = user;
//    });
//  }
//
//  button() {
//    return SizedBox(
//      width: double.infinity,
//      child: OutlineButton(
//        child: Text(isEditing ? "Actualizar" : "Agregar"),
//        onPressed: () {
//          add();
//          setState(() {
//            showTextField = false;
//          });
//        },
//      ),
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Color(0xffff3a5a),
//        title: Text("Clientes"),
//        actions: <Widget>[
//          PopupMenuButton(
//            icon: Icon(FontAwesomeIcons.ellipsisV),
//            itemBuilder: (context) => [
//              PopupMenuItem(
//                child: InkWell(
//                  onTap: () {
//                    // ============= HomePageAdmin =============
//                    Navigator.pushNamedAndRemoveUntil(
//                        context, '/homepageadmin', (_) => false);
//                  },
//                  child: ListTile(
//                    title: Text('Tablero'),
//                    // Icono Home
//                    leading: Icon(
//                      FontAwesomeIcons.home,
//                      color: Color(0xffff3a5a),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
////          IconButton(
////            icon: Icon(
////              Icons.add_circle,
////              color: Color(0xff00E676),
////            ),
////            onPressed: () {
////              setState(() {
////                showTextField = !showTextField;
////              });
////            },
////          ),
//        ],
//      ),
//      body: Container(
//        padding: EdgeInsets.all(20.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            showTextField
//                ? Column(
//                    crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.start,
//                    children: <Widget>[
//                      TextFormField(
//                        autocorrect: false,
//                        enableSuggestions: false,
//                        autofocus: true,
//                        textCapitalization: TextCapitalization.words,
//                        controller: controller,
//                        decoration: InputDecoration(
//                          labelText: "Nombre Cliente",
////                          hintText: "Nombre del cliente",
//                        ),
//                      ),
//                      SizedBox(
//                        height: 10,
//                      ),
//                      button(),
//                    ],
//                  )
//                : Container(),
//            SizedBox(
//              height: 15,
//            ),
//            Text(
//              "Listado Clientes",
//              style: TextStyle(
//                  fontSize: 25,
//                  fontWeight: FontWeight.w900,
//                  color: Color(0xffff3a5a)),
//            ),
//            SizedBox(
//              height: 20,
//            ),
//            Flexible(
//              child: buildBody(context),
//            ),
//          ],
//        ),
//      ),
//      floatingActionButton: FloatingActionButton.extended(
//        onPressed: () {
//          setState(() {
//            showTextField = !showTextField;
//          });
//        },
//        label: Text(
//          'Agregar',
//          style: TextStyle(
//              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
//        ),
//        icon: Icon(
//          Icons.add_circle,
//          color: Colors.white,
//        ),
//        backgroundColor: Color(0xff00E676),
//      ),
//    );
//  }
//}
