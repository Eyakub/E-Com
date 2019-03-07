import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {

  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue = '';
  String descriptionValue = '';
  double priceValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
        child: ListView(
      children: <Widget>[
        TextField(
          decoration: InputDecoration(labelText: 'Product Title'),
          onChanged: (String value) {
            setState(() {
              titleValue = value;
            });
          },
        ),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(labelText: 'Product Descript ion'),
          onChanged: (String value) {
            setState(() {
              descriptionValue = value;
            });
          },
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Product Price'),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              priceValue = double.parse(value);
            });
          },
        ),
        RaisedButton(
          child: Text("Save"),
          onPressed: () {
            final Map<String, dynamic> product = {
              'title': titleValue, 
              'description':descriptionValue,
              'price':priceValue,
              'image': 'assets/unnamed.jpg',
              };
            widget.addProduct(product);
            Navigator.pushReplacementNamed(context, '/');
          },
        ),
      ],
    ),);
  }
}
