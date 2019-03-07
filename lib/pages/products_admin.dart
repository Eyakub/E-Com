import 'package:flutter/material.dart';
import './products.dart';
import './product_list.dart';
import './product_create.dart';

class ProductsAdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  title: Text("All Products"),
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => ProductsPage()));
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
            children: <Widget>[ProductCreatePage(), ProductListPage()],
          )),
    );
  }
}
