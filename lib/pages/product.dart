import 'package:scoped_model/scoped_model.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import '../widgets/ui_elements/title_default.dart';
import '../models/product.dart';
import '../scoped-models/main.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;

  ProductPage(this.productIndex);

  // _showWarningDialog(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           title: Text("Are you sure?"),
  //           content: Text("This action can't be undone"),
  //           actions: <Widget>[
  //             FlatButton(
  //               child: Text("Discard"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             FlatButton(
  //               child: Text("Continue"),
  //               onPressed: () {
  //                 Navigator.pop(context);
  //                 Navigator.pop(context, true);
  //               },
  //             )
  //           ],
  //         );
  //       });
  // }

  Widget _buildAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Union Square, San Francisco',
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: new Text(
            '|',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        new Text(
          '\$' + price.toString(),
          style: TextStyle(fontFamily: 'Oswald', color: Colors.grey),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print("Back Button Pressed");
        Navigator.pop(context, false); // custom back request
        return Future.value(false); //original back request
      },
      child: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final Product product = model.allProducts[productIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(product.title),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset(product.image),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: TitleDefault(product.title),
                ),
                _buildAddressPriceRow(product.price),
                Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    product.description,
                    textAlign: TextAlign.center,
                  ),
                ),
                // Container(
                //   padding: EdgeInsets.all(10.0),
                //   child: RaisedButton(
                //     color: Theme.of(context).accentColor,
                //     child: Text("Delete"),
                //     textColor: Colors.white,
                //     // onPressed: () => Navigator.pop(context, true),
                //     onPressed: () => _showWarningDialog(context),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }
}
