import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/products/products.dart';


class ProductManager extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductManager(this.products);

  
  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [Expanded(child: Products(products))],
    );
  }
}
