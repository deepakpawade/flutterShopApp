import 'package:flutter/material.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Details"),
        ),
        body: Center(
                  child: Column(
            children: <Widget>[
              Text("Details"),
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Back"),
              )
            ],
          ),
        ));
  }
}
