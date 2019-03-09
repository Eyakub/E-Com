import 'package:flutter/material.dart';
import './product_list.dart';
import './product_create.dart';

class ProductsAdminPage extends StatelessWidget {

final Function addProduct;
final Function deleteProduct;

ProductsAdminPage(this.addProduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, //how many tabs a tablist have
      child: Scaffold(
          drawer: Drawer(
            child: Column(
              children: <Widget>[
                AppBar(
                  automaticallyImplyLeading: false,
                  title: Text("Choose"),
                ),
                ListTile(
                  leading: Icon(Icons.shop),
                  title: Text("All Products"),
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/products');
                  },
                )
              ],
            ),
          ),
          appBar: AppBar(
            title: Text("Manage Products"),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(
                  text: 'Create Products',
                  icon: Icon(Icons.create),
                ),
                Tab(
                  text: 'My Products',
                  icon: Icon(Icons.list),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[ProductCreatePage(addProduct), ProductListPage()],
          )),
    );
  }
}
