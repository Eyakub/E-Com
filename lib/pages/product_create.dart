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
  String _titleValue = '';
  String _descriptionValue = '';
  double _priceValue = 0.0;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildTitleTextFeild() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Title'),
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty || value.length < 5) {
          return "Title is required and should be minimum 5 character.";
        }
      },
      onSaved: (String value) {
        setState(() {
          _titleValue = value;
        });
      },
    );
  }

  Widget _buildDescTextField() {
    return TextFormField(
      maxLines: 4,
      decoration: InputDecoration(labelText: 'Product Descript ion'),
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty || value.length < 10) {
          return "Title is required and should be minimum 10 character.";
        }
      },
      onSaved: (String value) {
        setState(() {
          _descriptionValue = value;
        });
      },
    );
  }

  Widget _buildProductPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Product Price'),
      validator: (String value) {
        //if(value.trim().length <= 0){
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return "Price is required and should be number.";
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        setState(() {
          _priceValue = double.parse(value);
        });
      },
    );
  }

  void _saveRaisedButton() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    final Map<String, dynamic> product = {
      'title': _titleValue,
      'description': _descriptionValue,
      'price': _priceValue,
      'image': 'assets/food.jpg',
    };
    widget.addProduct(product);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 500.0 : deviceWidth * 0.95;
    final double targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _buildTitleTextFeild(),
              _buildDescTextField(),
              _buildProductPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                color: Theme.of(context).accentColor,
                textColor: Colors.white,
                child: Text("Save"),
                onPressed: _saveRaisedButton,
              ),
              // GestureDetector(
              //   onTap: _saveRaisedButton,
              //   child: Container(
              //     color: Colors.green,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text("Save"),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
