import 'package:flutter/material.dart';
import '../client_pages/comprar.dart';
import '../client_pages/product_details.dart';

class Productazos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Products(),
    );
  }
}

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var products = new List();

  var product_list = [
    {
      "name": "Tacones",
      "picture": "images/products/1.jpeg",
      "old_price": "120",
      "price": "50.000",
    },
    {
      "name": "Tenis",
      "picture": "images/products/2.jpeg",
      "old_price": "120",
      "price": "55.000",
    },
    {
      "name": "Tacones",
      "picture": "images/products/3.jpeg",
      "old_price": "120",
      "price": "50.000",
    },
    {
      "name": "Tacones",
      "picture": "images/products/4.jpeg",
      "old_price": "120",
      "price": "55.000",
    },
    {
      "name": "Tenis",
      "picture": "images/products/5.jpeg",
      "old_price": "100",
      "price": "40.000",
    },
    {
      "name": "Zapatos",
      "picture": "images/products/6.jpeg",
      "old_price": "100",
      "price": "45.000",
    },
    {
      "name": "Bolsos",
      "picture": "images/products/7.jpeg",
      "old_price": "100",
      "price": "50.000",
    },
    {
      "name": "Tacones",
      "picture": "images/products/8.jpeg",
      "old_price": "100",
      "price": "60.000",
    },
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
      "name": "Producto 14",
      "picture": "images/products/14.jpeg",
      "old_price": "100",
      "price": "55.000",
    },
    {
      "name": "Producto 15",
      "picture": "images/products/15.jpeg",
      "old_price": "100",
      "price": "60.000",
    },
    {
      "name": "Producto 16",
      "picture": "images/products/16.jpeg",
      "old_price": "100",
      "price": "40.000",
    },
    {
      "name": "Producto 17",
      "picture": "images/products/17.jpeg",
      "old_price": "100",
      "price": "55.000",
    },
    {
      "name": "Producto 18",
      "picture": "images/products/18.jpeg",
      "old_price": "100",
      "price": "40.000",
    },
    {
      "name": "Producto 19",
      "picture": "images/products/19.jpeg",
      "old_price": "100",
      "price": "55.000",
    }

//
//    {
//      "name": "Blazer",
//      "picture": "images/products/blazer1.jpeg",
//      "old_price": "120",
//      "price": "85",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/dress1.jpeg",
//      "old_price": "100",
//      "price": "50",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/hills1.jpeg",
//      "old_price": "100",
//      "price": "50",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/hills2.jpeg",
//      "old_price": "100",
//      "price": "50",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/skt1.jpeg",
//      "old_price": "100",
//      "price": "50",
//    },
//    {
//      "name": "Red Dress",
//      "picture": "images/products/skt2.jpeg",
//      "old_price": "100",
//      "price": "50",
//    }
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: product_list.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return Single_prod(
          prod_name: product_list[index]['name'],
          prod_pricture: product_list[index]['picture'],
          prod_old_price: product_list[index]['old_price'],
          prod_price: product_list[index]['price'],
        );
      },
    );
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  Single_prod({
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
