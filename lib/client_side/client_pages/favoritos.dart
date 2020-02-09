/**
 * Author: Damodar Lohani
 * profile: https://github.com/lohanidamodar
 */

//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../client_components/products.dart';

//import 'package:flutter_ui_challenges/core/presentation/res/assets.dart';
//import 'package:flutter_ui_challenges/src/widgets/network_image.dart';

class Favoritos extends StatelessWidget {
//  ProfileTwoPage({this.title = 'Quienes Somos'});
//
//  final String title;

  static final String path = "lib/src/pages/profile/profile2.dart";

//  final List<Map> collections = [
//    {
//      "title":"Food joint",
//      "image": meal
//    },
//    {
//      "title":"Photos",
//      "image":images[1]
//    },
//    {
//      "title":"Travel",
//      "image":fishtail
//    },
//    {
//      "title":"Nepal",
//      "image":kathmandu2
//    },
//  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Con esta configuración podemos implementar boton para atras en AppBar
        automaticallyImplyLeading: true,
        backgroundColor: Colors.red,
        title: Text('Favoritos'),
//        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(FontAwesomeIcons.ellipsisV),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    // CATALOGO

                    // ================= IMPORTANTE ROUTE =============

                    // Sirve para ir a la raiz de la ruta, cerrando el resto
                    // This will basically push a home and remove all the routes
                    // behind the new one
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/homepage', (_) => false);

//                    Navigator.pushReplacementNamed(context, '/homepage');
//                    Navigator.pushNamed(context, '/homepage');
//                    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));

//                    Navigator.popUntil(
//                        context,
//                        ModalRoute.withName(
//                            "homepage"));
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => new HomePage()));
                  },
                  child: ListTile(
                    title: Text('Catálogo'),
                    // Icono Home
                    leading: Icon(
                      FontAwesomeIcons.home,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ),

              // COMPRAR
              PopupMenuItem(
                child: InkWell(
                  onTap: () {
                    // ================= IMPORTANTE ROUTE =============

                    // Sirve para ir a la raiz de la ruta, cerrando el resto
                    // This will basically push a home and remove all the routes
                    // behind the new one

//                    Navigator.pushNamedAndRemoveUntil(
//                        context, '/comprar', (_) => false);

                    Navigator.pushReplacementNamed(context, '/comprar');
//                    Navigator.pushNamed(context, '/homepage');
//                    Navigator.popUntil(context, ModalRoute.withName(Navigator.defaultRouteName));

//                    Navigator.popUntil(
//                        context,
//                        ModalRoute.withName(
//                            "homepage"));
//                    Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                            builder: (context) => new HomePage()));
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
      body: Center(
        child: Text("En Desarrollo"),
      ),
    );
  }

//  Widget _mainListBuilder(BuildContext context, int index) {
//    if(index==0) return _buildHeader(context);
//    if(index==1) return _buildSectionHeader(context);
//    if(index==2) return _buildCollectionsRow();
//    if(index==3) return Container(
//        color: Colors.white,
//        padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
//        child: Text("Most liked posts",
//            style: Theme.of(context).textTheme.title
//        )
//    );
//    return _buildListItem();
//  }

//  Widget _buildListItem() {
//    return Container(
//      color: Colors.white,
//      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
//      child: ClipRRect(
//        borderRadius: BorderRadius.circular(5.0),
//        child: PNetworkImage(images[2], fit: BoxFit.cover),
//      ),
//    );
//  }

//  Container _buildSectionHeader(BuildContext context) {
//    return Container(
//      color: Colors.white,
//      padding: EdgeInsets.symmetric(horizontal: 20.0),
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//        children: <Widget>[
//          Text("Collection", style: Theme.of(context).textTheme.title,),
//          FlatButton(
//            onPressed: (){},
//            child: Text("Create new", style: TextStyle(color: Colors.blue),),
//          )
//        ],
//      ),
//    );
//  }

//  Container _buildCollectionsRow() {
//    return Container(
//      color: Colors.white,
//      height: 200.0,
//      padding: EdgeInsets.symmetric(horizontal: 10.0),
//      child: ListView.builder(
//        physics: BouncingScrollPhysics(),
//        scrollDirection: Axis.horizontal,
////        itemCount: collections.length,
//        itemBuilder: (BuildContext context, int index){
//          return Container(
//              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
//              width: 150.0,
//              height: 200.0,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Expanded(
//                      child: ClipRRect(
//                          borderRadius: BorderRadius.circular(5.0),
//                          child: PNetworkImage(collections[index]['image'], fit: BoxFit.cover))
//                  ),
//                  SizedBox(height: 5.0,),
//                  Text(collections[index]['title'], style: Theme.of(context).textTheme.subhead.merge(TextStyle(color: Colors.grey.shade600)))
//                ],
//              )
//          );
//        },
//      ),
//    );
//  }

  Container _buildHeader(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      height: 240.0,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
                top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
            child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              elevation: 5.0,
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    "Yudith Esther Rodriguez",
                    style: Theme.of(context).textTheme.title,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Text("Gerente"),
                  SizedBox(
                    height: 16.0,
                  ),
                  Container(
                    height: 50.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: ListTile(
                            title: Text(
                              "Contacto",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "\n317 4113119\nyudithrodriguezromero@gmail.com",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12.0)),
                          ),
                        ),
//                        Expanded(
//                          child: ListTile(
//                            title: Text(
//                              "10.3K",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                            ),
//                            subtitle: Text("Followers".toUpperCase(),
//                                textAlign: TextAlign.center,
//                                style: TextStyle(fontSize: 12.0)),
//                          ),
//                        ),
//                        Expanded(
//                          child: ListTile(
//                            title: Text(
//                              "120",
//                              textAlign: TextAlign.center,
//                              style: TextStyle(fontWeight: FontWeight.bold),
//                            ),
//                            subtitle: Text("Following".toUpperCase(),
//                                textAlign: TextAlign.center,
//                                style: TextStyle(fontSize: 12.0)),
//                          ),
//                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Material(
                elevation: 5.0,
                shape: CircleBorder(),
                child: CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage("images/yudita.jpg"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
