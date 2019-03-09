import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            child: Text(
              products[index]['title'],
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, fontFamily: 'Oswald'),
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                  child: Text("Details"),
                  onPressed: () => Navigator.pushNamed<bool>(
                      context, '/product/' + index.toString())),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCards;
    if (products.length > 0) {
      productCards = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      // productCards = Center(
      //   child: Text("No products found, please add some"),
      // );
      productCards = Container();
    }
    return productCards;
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }
}
