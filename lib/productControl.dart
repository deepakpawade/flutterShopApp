import 'package:flutter/material.dart';

class ProductControl extends StatelessWidget{
  final Function addProduct;
   ProductControl(this.addProduct);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor, //context has meta-info about main app
      child: Text("Add Product"),
      onPressed: () {
          addProduct('Sweets');
      },
//                onPressed: () {},    //anonymous function .An empty method.
    );
  }
}