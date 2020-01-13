import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [
//    {
//      "name": "Zapatos",
//      "picture": "images/products/tia_1.jpeg",
//      "old_price": "120",
//      "price": "50.000",
//    },
//    {
//      "name": "Tenis",
//      "picture": "images/products/tia_2.jpeg",
//      "old_price": "120",
//      "price": "45.000",
//    },
//    {
//      "name": "Bolsos",
//      "picture": "images/products/tia_3.jpeg",
//      "old_price": "120",
//      "price": "70.000",
//    },
//    {
//      "name": "Tacones",
//      "picture": "images/products/tia_4.jpeg",
//      "old_price": "120",
//      "price": "45.000",
//    },
//    {
//      "name": "Tacones",
//      "picture": "images/products/tia_5.jpeg",
//      "old_price": "120",
//      "price": "55.000",
//    },
//    {
//      "name": "Tenis Hombre",
//      "picture": "images/products/tia_6.jpeg",
//      "old_price": "120",
//      "price": "60.000",
//    },
//    {
//      "name": "Tenis",
//      "picture": "images/products/tia_7.jpeg",
//      "old_price": "120",
//      "price": "50.000",
//    },
//    {
//      "name": "Tenis",
//      "picture": "images/products/tia_8.jpeg",
//      "old_price": "120",
//      "price": "60.000",
//    },
//    {
//      "name": "Zapatos",
//      "picture": "images/products/tia_9.jpeg",
//      "old_price": "120",
//      "price": "55.000",
//    },
//    {
//      "name": "Tenis",
//      "picture": "images/products/tia_10.jpeg",
//      "old_price": "120",
//      "price": "40.000",
//    },
//    {
//      "name": "Zapatos",
//      "picture": "images/products/tia_11.jpeg",
//      "old_price": "120",
//      "price": "60.000",
//    },
//    {
//      "name": "Tenis",
//      "picture": "images/products/tia_12.jpeg",
//      "old_price": "120",
//      "price": "55.000",
//    }
    {
      "name": "Zapatos",
      "picture": "images/products/tia1.jpg",
      "old_price": "120",
      "price": "50.000",
    },
    {
      "name": "Bolsos",
      "picture": "images/products/tia_3.jpeg",
      "old_price": "120",
      "price": "55.000",
    },
    {
      "name": "Tacones",
      "picture": "images/products/tia_4.jpeg",
      "old_price": "120",
      "price": "50.000",
    },
    {
      "name": "Tacones Dorados",
      "picture": "images/products/tia_5.jpeg",
      "old_price": "120",
      "price": "55.000",
    },
    {
      "name": "Producto 5",
      "picture": "images/products/tia2.jpg",
      "old_price": "100",
      "price": "40.000",
    },
    {
      "name": "Producto 6",
      "picture": "images/products/tia_6.jpeg",
      "old_price": "100",
      "price": "45.000",
    },
    {
      "name": "Producto 7",
      "picture": "images/products/tia_7.jpeg",
      "old_price": "100",
      "price": "50.000",
    },
    {
      "name": "Producto 8",
      "picture": "images/products/tia_8.jpeg",
      "old_price": "100",
      "price": "60.000",
    },
    {
      "name": "Producto 9",
      "picture": "images/products/tia_9.jpeg",
      "old_price": "100",
      "price": "45.000",
    },
    {
      "name": "Producto 10",
      "picture": "images/products/tia_10.jpeg",
      "old_price": "100",
      "price": "55.000",
    }
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
        });
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
        tag: prod_name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
//                    leading: Text(
//                      prod_name,
//                      style: TextStyle(fontWeight: FontWeight.bold),
//                    ),
                    title: Text(
                      prod_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "\$$prod_price",
                      style: TextStyle(
//                        decoration: TextDecoration.lineThrough,
                          color: Colors.red,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
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
