import 'package:flutter/material.dart';

class Cart_products extends StatefulWidget {
  @override
  _Cart_productsState createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart = [
    {
      "name": "Tacones",
      "picture": "images/products/1.jpeg",
      "old_price": "100",
      "price": "50.000",
      "size": "35",
      "color": "Rojo",
      "quantity": 1,
    },
    {
      "name": "Tenis",
      "picture": "images/products/11.jpeg",
      "old_price": "100",
      "price": "40.000",
      "size": "40",
      "color": "Negro",
      "quantity": 2,
    },
    {
      "name": "Bolso",
      "picture": "images/products/7.jpeg",
      "old_price": "100",
      "price": "50.000",
      "size": "5",
      "color": "Amarillo",
      "quantity": 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: Products_on_the_cart.length,
        itemBuilder: (context, index) {
          return Single_cart_product(
            cart_prod_name: Products_on_the_cart[index]["name"],
            cart_prod_color: Products_on_the_cart[index]["color"],
            cart_prod_qty: Products_on_the_cart[index]["quantity"],
            cart_prod_size: Products_on_the_cart[index]["size"],
            cart_prod_price: Products_on_the_cart[index]["price"],
            cart_prod_pricture: Products_on_the_cart[index]["picture"],
          );
        });
  }
}

class Single_cart_product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_pricture;
  final cart_prod_old_price;
  final cart_prod_price;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_qty;

  Single_cart_product({
    this.cart_prod_name,
    this.cart_prod_pricture,
    this.cart_prod_old_price,
    this.cart_prod_price,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ======= Leading Section ==========

        leading: Image.asset(
          cart_prod_pricture,
          width: 70.0,
          height: 70.0,
        ),

        // ======== Title Section ==========

        title: Text(cart_prod_name),

        // ====== Subtitle Section =========
        subtitle: Column(
          children: <Widget>[
            // ROW INSIDE THE COLUMN
            Row(
              children: <Widget>[
                // This Section is for the size of the product
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text("Size"),
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    cart_prod_size,
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                // ======= This section of for the product color =====

                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: Text("Color:"),
                ),

                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Text(
                    cart_prod_color,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ],
            ),

            // ====== This Section is for the Product Price =======

            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "$cart_prod_qty",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),

        // =======  SECTION OF QUANTITY, PART RIGHT ==========

        trailing: FittedBox(
          fit: BoxFit.fill,
          child: Column(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.arrow_drop_up, color: Colors.red),
                  iconSize: 65,
                  onPressed: () {}),
              Text(
                "$cart_prod_qty",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                  iconSize: 65,
                  onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
