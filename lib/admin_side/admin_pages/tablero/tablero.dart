import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ==================================
// ==================================
// ============= Tablero ============

class Tablero extends StatelessWidget {
  Color activeColor = Color(0xffff3a5a);
  MaterialColor notActive = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: GridView(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              children: <Widget>[
                // ======= RECUADRO PRODUCTOS =======
                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.track_changes,
                            color: Colors.blue,
                          ),
                          label: Text(
                            "Productos",
                            style: TextStyle(color: Colors.black),
//                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: Text(
                          '30',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: activeColor, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),

                // ========== RECUADRO CATEGORIAS ==============

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.category,
                            color: Colors.green,
                          ),
                          label: Text(
                            "Categorías",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        subtitle: Text(
                          '7',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: activeColor, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),

                // ============= RECUADRO CLIENTES ==============

                Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/productos');
                      },
                      child: ListTile(
                        title: FlatButton.icon(
                          color: Colors.black,
                          icon: Icon(
                            Icons.people_outline,
                            color: Colors.indigo,
                          ),
                          label: Text(
                            "Clientes",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        subtitle: Text(
                          '50',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: activeColor, fontSize: 58.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // PRUEBA
//
//          Padding(
//            padding: const EdgeInsets.all(16.0),
//            child: Container(
//              child: new FittedBox(
//                child: Material(
//                    color: Colors.white,
//                    elevation: 5.0,
//                    borderRadius: BorderRadius.circular(24.0),
//                    shadowColor: Color(0x802196F3),
//                    child: Row(
//                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                      children: <Widget>[
//                        Container(
//                          child: Padding(
//                            padding: const EdgeInsets.only(left: 5.0),
//                            child: myDetailsContainer4(),
//                          ),
//                        ),
//                        Container(
//                          width: 250,
//                          height: 180,
//                          child: ClipRRect(
//                            borderRadius: new BorderRadius.circular(24.0),
//                            child: Image(
//                              fit: BoxFit.contain,
//                              alignment: Alignment.topRight,
//                              image: NetworkImage(
//                                  "https://images.unsplash.com/photo-1545396872-a6682fc218ab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60"),
//                            ),
//                          ),
//                        ),
//                      ],
//
//
//                    )),
//              ),
//            ),
//          ),
        ],
      ),
    );



  }

  Widget myDetailsContainer4() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Text("Chocolate Bar",
            style: TextStyle(color: Color(0xffe6020a), fontSize: 24.0,fontWeight: FontWeight.bold),)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Container(child: Row(children: <Widget>[
            Container(child: Text("3.5", style: TextStyle(
              color: Colors.black54, fontSize: 18.0,),)),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStar, color: Colors.amber, size: 15.0,),),
            Container(child: Icon(
              FontAwesomeIcons.solidStarHalf, color: Colors.amber,
              size: 15.0,),),
            Container(child: Text("(50) \u00B7 2.5 mi",
              style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
          ],)),
        ),
        Container(child: Text("Pastries \u00B7 Phoenix,AZ",
          style: TextStyle(color: Colors.black54, fontSize: 18.0,),)),
      ],
    );
  }
}

// ==================================
// ==================================

//
//
//
//
///// ESTA APP ES LA DASHBOARD DE LA APP
//
////class AdministrarPage extends StatelessWidget {
////  @override
////  Widget build(BuildContext context) {
////    return Text("Hola Mundo");
////  }
////}
//
//class TableroPage extends StatefulWidget {
//  @override
//  _TableroPageState createState() => _TableroPageState();
//}
//
//class _TableroPageState extends State<TableroPage> {
//  MaterialColor active = Colors.red;
//  MaterialColor notActive = Colors.grey;
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        backgroundColor: Colors.red,
//        title: Text("Inicio"),
//        elevation: 0.0,
//      ),
//      body: Column(
//        children: <Widget>[
//          SizedBox(
//            height: 20.0,
//          ),
////          Center(
////            child: Text(
////              "Tablero",
////              textScaleFactor: 2.5,
////              style:
////              TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
////            ),
////          ),
////          SizedBox(
////            height: 10.0,
////          ),
//          Expanded(
//            child: GridView(
//              gridDelegate:
//              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//              children: <Widget>[
//                // ======= RECUADRO PRODUCTOS ======
//                Padding(
//                  padding: const EdgeInsets.all(9.0),
//                  child: Card(
//                    child: ListTile(
//                        title: FlatButton.icon(
//                            onPressed: () {},
//                            icon: Icon(
//                              Icons.track_changes,
//                              color: Colors.blue,
//                            ),
//                            label: Text("Productos")),
//                        subtitle: Text(
//                          '15',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: active, fontSize: 58.0),
//                        )),
//                  ),
//                ),
//
//                // ========== RECUADRO CATEGORIAS ==============
//                Padding(
//                  padding: const EdgeInsets.all(9.0),
//                  child: Card(
//                    child: ListTile(
//                        title: FlatButton.icon(
//                            onPressed: () {},
//                            icon: Icon(
//                              Icons.category,
//                              color: Colors.green,
//                            ),
//                            label: Text("Categorías")),
//                        subtitle: Text(
//                          '5',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: active, fontSize: 58.0),
//                        )),
//                  ),
//                ),
//
//                // ============= RECUADRO CLIENTES ==============
//                Padding(
//                  padding: const EdgeInsets.all(9.0),
//                  child: Card(
//                    child: ListTile(
//                        title: FlatButton.icon(
//                            onPressed: () {},
//                            icon: Icon(
//                              Icons.people_outline,
//                              color: Colors.indigo,
//                            ),
//                            label: Text("Clientes")),
//                        subtitle: Text(
//                          '13',
//                          textAlign: TextAlign.center,
//                          style: TextStyle(color: active, fontSize: 58.0),
//                        )),
//                  ),
//                ),
//
////                Padding(
////                  padding: const EdgeInsets.all(15.0),
////                  child: Card(
////                    child: ListTile(
////                        title: FlatButton.icon(
////                            onPressed: null,
////                            icon: Icon(Icons.tag_faces),
////                            label: Text("Sold")),
////                        subtitle: Text(
////                          '13',
////                          textAlign: TextAlign.center,
////                          style: TextStyle(color: active, fontSize: 50.0),
////                        )),
////                  ),
////                ),
////                Padding(
////                  padding: const EdgeInsets.all(15.0),
////                  child: Card(
////                    child: ListTile(
////                        title: FlatButton.icon(
////                            onPressed: null,
////                            icon: Icon(Icons.shopping_cart),
////                            label: Text("Orders")),
////                        subtitle: Text(
////                          '5',
////                          textAlign: TextAlign.center,
////                          style: TextStyle(color: active, fontSize: 60.0),
////                        )),
////                  ),
////                ),
////                Padding(
////                  padding: const EdgeInsets.all(15.0),
////                  child: Card(
////                    child: ListTile(
////                        title: FlatButton.icon(
////                            onPressed: null,
////                            icon: Icon(Icons.close),
////                            label: Text("Return")),
////                        subtitle: Text(
////                          '0',
////                          textAlign: TextAlign.center,
////                          style: TextStyle(color: active, fontSize: 60.0),
////                        )),
////                  ),
////                ),
//              ],
//            ),
//          ),
//        ],
//      ),
//    );
//  }
//}
//////class Body
////
////enum Page { dashboard, manage }
////
////class Admin extends StatefulWidget {
////  @override
////  _AdminState createState() => _AdminState();
////}
////
////class _AdminState extends State<Admin> {
////  Page _selectedPage = Page.dashboard;
////  MaterialColor active = Colors.red;
////  MaterialColor notActive = Colors.grey;
////  TextEditingController categoryController = TextEditingController();
////  TextEditingController brandController = TextEditingController();
////  GlobalKey<FormState> _categoryFormKey = GlobalKey();
////  GlobalKey<FormState> _brandFormKey = GlobalKey();
////
//////  BrandService _brandService = BrandService();
//////  CategoryService _categoryService = CategoryService();
////
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////        appBar: AppBar(
////          title: Row(
////            children: <Widget>[
////              Expanded(
////                  child: FlatButton.icon(
////                      onPressed: () {
////                        setState(() => _selectedPage = Page.dashboard);
////                      },
////                      icon: Icon(
////                        Icons.dashboard,
////                        color: _selectedPage == Page.dashboard
////                            ? active
////                            : notActive,
////                      ),
////                      label: Text('Dashboard'))),
////              Expanded(
////                  child: FlatButton.icon(
////                      onPressed: () {
////                        setState(() => _selectedPage = Page.manage);
////                      },
////                      icon: Icon(
////                        Icons.sort,
////                        color:
////                            _selectedPage == Page.manage ? active : notActive,
////                      ),
////                      label: Text('Manage'))),
////            ],
////          ),
////          elevation: 0.0,
////          backgroundColor: Colors.white,
////        ),
////        body: _loadScreen());
////  }
////
////  Widget _loadScreen() {
////    switch (_selectedPage) {
////      case Page.dashboard:
////        return Column(
////          children: <Widget>[
////            ListTile(
////              subtitle: FlatButton.icon(
////                onPressed: null,
////                icon: Icon(
////                  Icons.attach_money,
////                  size: 30.0,
////                  color: Colors.green,
////                ),
////                label: Text('12,000',
////                    textAlign: TextAlign.center,
////                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
////              ),
////              title: Text(
////                'Revenue',
////                textAlign: TextAlign.center,
////                style: TextStyle(fontSize: 24.0, color: Colors.grey),
////              ),
////            ),
////            Expanded(
////              child: GridView(
////                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
////                    crossAxisCount: 2),
////                children: <Widget>[
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.people_outline),
////                              label: Text("Users")),
////                          subtitle: Text(
////                            '7',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 50.0),
////                          )),
////                    ),
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.category),
////                              label: Text("Categoria")),
////                          subtitle: Text(
////                            '2',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 50.0),
////                          )),
////                    ),
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.track_changes),
////                              label: Text("Producs")),
////                          subtitle: Text(
////                            '1',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 50.0),
////                          )),
////                    ),
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.tag_faces),
////                              label: Text("Sold")),
////                          subtitle: Text(
////                            '13',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 50.0),
////                          )),
////                    ),
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.shopping_cart),
////                              label: Text("Orders")),
////                          subtitle: Text(
////                            '5',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 60.0),
////                          )),
////                    ),
////                  ),
////                  Padding(
////                    padding: const EdgeInsets.all(15.0),
////                    child: Card(
////                      child: ListTile(
////                          title: FlatButton.icon(
////                              onPressed: null,
////                              icon: Icon(Icons.close),
////                              label: Text("Return")),
////                          subtitle: Text(
////                            '0',
////                            textAlign: TextAlign.center,
////                            style: TextStyle(color: active, fontSize: 60.0),
////                          )),
////                    ),
////                  ),
////                ],
////              ),
////            ),
////          ],
////        );
////        break;
////      case Page.manage:
////        return ListView(
////          children: <Widget>[
////            ListTile(
////              leading: Icon(Icons.add),
////              title: Text("Add product"),
//////              onTap: () {
//////                Navigator.push(context, MaterialPageRoute(builder: (_) => AddProduct()));
//////              },
////            ),
////            Divider(),
////            ListTile(
////              leading: Icon(Icons.change_history),
////              title: Text("Products list"),
////              onTap: () {},
////            ),
////            Divider(),
////            ListTile(
////              leading: Icon(Icons.add_circle),
////              title: Text("Add category"),
////              onTap: () {
////                _categoryAlert();
////              },
////            ),
////            Divider(),
////            ListTile(
////              leading: Icon(Icons.category),
////              title: Text("Category list"),
////              onTap: () {},
////            ),
////            Divider(),
////            ListTile(
////              leading: Icon(Icons.add_circle_outline),
////              title: Text("Add brand"),
////              onTap: () {
////                _brandAlert();
////              },
////            ),
////            Divider(),
////            ListTile(
////              leading: Icon(Icons.library_books),
////              title: Text("brand list"),
//////              onTap: () {
//////                _brandService.getBrands();
//////              },
////            ),
////            Divider(),
////          ],
////        );
////        break;
////      default:
////        return Container();
////    }
////  }
////
////  void _categoryAlert() {
////    var alert = new AlertDialog(
////      content: Form(
////        key: _categoryFormKey,
////        child: TextFormField(
////          controller: categoryController,
////          validator: (value) {
////            if (value.isEmpty) {
////              return 'category cannot be empty';
////            }
////          },
////          decoration: InputDecoration(hintText: "add category"),
////        ),
////      ),
////      actions: <Widget>[
////        FlatButton(
////            onPressed: () {
//////          if(categoryController.text != null){
//////            _categoryService.createCategory(categoryController.text);
//////          }
//////          Fluttertoast.showToast(msg: 'category created');
////              Navigator.pop(context);
////            },
////            child: Text('ADD')),
////        FlatButton(
////            onPressed: () {
////              Navigator.pop(context);
////            },
////            child: Text('CANCEL')),
////      ],
////    );
////
////    showDialog(context: context, builder: (_) => alert);
////  }
////
////  void _brandAlert() {
////    var alert = new AlertDialog(
////      content: Form(
////        key: _brandFormKey,
////        child: TextFormField(
////          controller: brandController,
////          validator: (value) {
////            if (value.isEmpty) {
////              return 'category cannot be empty';
////            }
////          },
////          decoration: InputDecoration(hintText: "add brand"),
////        ),
////      ),
////      actions: <Widget>[
////        FlatButton(
////            onPressed: () {
//////          if(brandController.text != null){
//////            _brandService.createBrand(brandController.text);
//////          }
//////          Fluttertoast.showToast(msg: 'brand added');
////              Navigator.pop(context);
////            },
////            child: Text('ADD')),
////        FlatButton(
////            onPressed: () {
////              Navigator.pop(context);
////            },
////            child: Text('CANCEL')),
////      ],
////    );
////
////    showDialog(context: context, builder: (_) => alert);
////  }
////}
