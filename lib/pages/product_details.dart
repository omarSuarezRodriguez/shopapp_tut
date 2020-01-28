import 'package:flutter/material.dart';
import 'package:shopapp_tut/pages/comprar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shopapp_tut/home_page.dart';

class ProductDetails extends StatefulWidget {
  // Con esto recibimos los valores del otro Widget/Page
  final product_detail_name;
  final product_detail_new_price;
  final product_detail_old_price;
  final product_detail_picture;

  ProductDetails(
      {this.product_detail_name,
      this.product_detail_new_price,
      this.product_detail_old_price,
      this.product_detail_picture});

  // Hasta aquí se reciben los valores del otro Widget/Page

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    // Scaffold
    return Scaffold(
      // ================= appBar =================
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
//        title: InkWell(
//          onTap: () {
//            Navigator.push(context,
//                MaterialPageRoute(builder: (context) => new HomePage()));
//          },
//          child: Text("YUKA TiendApp"),
//        ),

        // TITULO
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.product_detail_name,
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ],
        ),

        // FLECHA ATRAS
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        // LISTA DE ACCIONES, BOTON A LA DERECHA
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

        // Iconos
//        actions: <Widget>[
//          // Icono de buscar
//          IconButton(icon: Icon(FontAwesomeIcons.search), onPressed: () {}),
//          // Icono de comprar
//          IconButton(
//              icon: Icon(FontAwesomeIcons.shoppingCart),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  // Quienes somos
//                  MaterialPageRoute(builder: (context) => ProfileTwoPage()),
//                );
//              }),
//        ],
      ),

      // ================= body =================
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
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text('Tallas'),
                            content: Text('Selecciona la talla'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Talla')),
                      Expanded(child: Icon(Icons.arrow_drop_down))
                    ],
                  ),
                ),
              ),

//            ========= The Color Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text('Colores'),
                            content: Text('Selecciona el color'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        });
                  },
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

//            ========= The Qty Button =========
              Expanded(
                child: MaterialButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return new AlertDialog(
                            title: Text('Cantidad'),
                            content: Text('Seleccione la Cantidad'),
                            actions: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                                child: Text('Cerrar'),
                              ),
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  textColor: Colors.grey,
                  elevation: 0.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text('Cantd')),
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
                  child: Text("Comprar"),
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

          // Divider
          Divider(),

          // ListTile
          ListTile(
            title: Text('Detalles del Producto'),
            subtitle: Text(
                "Información relevante del producto Información relevante del"
                " producto Información relevante del producto\nInformación relevante del producto"),
          ),

          // Divider
          Divider(),

          // Row Product Name
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Producto",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product_detail_name),
              ),
            ],
          ),

          // Row Product Brand
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Marca",
                  style: TextStyle(color: Colors.grey),
                ),
              ),

              // REMEMBER TO CREATE THE PRODUCT BRAND
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Marca X"),
              ),
            ],
          ),

          // Row Product Condition
          // ADD THE PRODUCT CONDITION
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Condición del Producto",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Nuevo"),
              ),
            ],
          ),

          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Productos Similares"),
          ),

          // SIMILAR PRODUCTS SECTION
          Container(
            height: 340.0,
            child: Similar_products(),
          ),
        ],
      ),
    );
  }
}

class Similar_products extends StatefulWidget {
  @override
  _Similar_productsState createState() => _Similar_productsState();
}

class _Similar_productsState extends State<Similar_products> {
  var product_list = [
    {
      "name": "Tacones Dorados",
      "picture": "images/products/9.jpeg",
      "old_price": "100",
      "price": "45.000",
    },
    {
      "name": "Tenis",
      "picture": "images/products/10.jpeg",
      "old_price": "100",
      "price": "55.000",
    },
    {
      "name": "Producto 11",
      "picture": "images/products/11.jpeg",
      "old_price": "100",
      "price": "40.000",
    },
    {
      "name": "Producto 12",
      "picture": "images/products/12.jpeg",
      "old_price": "100",
      "price": "50.000",
    },
    {
      "name": "Producto 13",
      "picture": "images/products/13.jpeg",
      "old_price": "100",
      "price": "45.000",
    },
    {
      "name": "Producto 19",
      "picture": "images/products/19.jpeg",
      "old_price": "100",
      "price": "55.000",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Similar_single_prod(
          prod_name: product_list[index]['name'],
          prod_pricture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Similar_single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: Text("hero 1"),
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              new MaterialPageRoute(
                // Here we are passing the values of the product to the product
                // details page
                builder: (context) => new ProductDetails(
                  product_detail_name: prod_name,
                  product_detail_new_price: prod_price,
                  product_detail_old_price: prod_old_price,
                  product_detail_picture: prod_pricture,
                ),
              ),
            ),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,

                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          prod_name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16.0),
                        ),
                      ),
                      Text(
                        "\$${prod_price}",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
//                  child: ListTile(
//                    leading: Text(
//                      prod_name,
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                    ),
//                    title: Text(
//                      "\$$prod_price",
//                      style: TextStyle(
//                          color: Colors.red, fontWeight: FontWeight.w800),
//                    ),
//                    subtitle: Text(
//                      "\$$prod_old_price",
//                      style: TextStyle(
////                        decoration: TextDecoration.lineThrough,
//                        color: Colors.black54,
//                        fontWeight: FontWeight.w800,
//                        decoration: TextDecoration.lineThrough,
//                      ),
//                    ),
//                  ),
                ),
                child: Image.asset(
                  prod_pricture,
                  fit: BoxFit.cover,
                )),
          ),
        ),
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
