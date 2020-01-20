import 'package:flutter/material.dart';
import 'package:shopapp_tut/pages/comprar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductDetails extends StatefulWidget {
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "YUKA TiendApp",
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),
//        title: Text('YUKA TiendApp'),

        actions: <Widget>[
          // Icono de buscar
          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),

          // Icono de comprar
          IconButton(
              icon: Icon(FontAwesomeIcons.shoppingCart),
              onPressed: () {
//                Navigator.push(
//                    context,
//                    PageTransition(
//                        type: PageTransitionType.rightToLeft,
//                        child: ProfileTwoPage()));

                Navigator.push(
                  context,
                  // Quienes somos
                  MaterialPageRoute(builder: (context) => ProfileTwoPage()),
                );
              }),
        ],
      ),
//      body: HeroApp(),
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                color: Colors.white,
                child: Image.asset(widget.product_detail_picture),
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product_detail_name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_old_price}",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$${widget.product_detail_new_price}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

//        ============== The First Buttons ============

          Row(
            children: <Widget>[
//            ========= The Size Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Size')),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),

//            ========= The Size Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Color')),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),

//            ========= The Size Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Qty')),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),
            ],
          ),

//
//
//        ============== The Second Buttons ============

          Row(
            children: <Widget>[
//            ========= The Size Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  color: Colors.red,
                  textColor: Colors.white,
                  elevation: 0.2,
                  child: Text("Buy Now"),
                ),
              ),

              IconButton(
                icon: Icon(Icons.add_shopping_cart),
                color: Colors.red,
                onPressed: () {},
              ),

              IconButton(
                icon: Icon(Icons.favorite_border),
                color: Colors.red,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Hero App Animation Photo
//
//class HeroApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Transition Demo',
//      home: MainScreen(),
//    );
//  }
//}
//
//class MainScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
////      appBar: AppBar(
////        title: Text('Main Screen'),
////      ),
//      body: GestureDetector(
//        child: Hero(
//          tag: 'imageHero',
//          child: Image.asset(
//              "images/products/tia_7.jpeg",
//          ),
//        ),
//        onTap: () {
//          Navigator.push(context, MaterialPageRoute(builder: (_) {
//            return DetailScreen();
//          }));
//        },
//      ),
//    );
//  }
//}
//
//class DetailScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: GestureDetector(
//        child: Center(
//          child: Hero(
//            tag: 'imageHero',
//            child: Image.network(
//              'https://picsum.photos/250?image=9',
//            ),
//          ),
//        ),
//        onTap: () {
//          Navigator.pop(context);
//        },
//      ),
//    );
//  }
//}
