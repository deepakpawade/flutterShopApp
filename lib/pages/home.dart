import 'package:flutter/material.dart';
import '../productManager.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(            //press and release ctrl + space
          //scaffold creates a new page with default white bkgrnd where we can add
          // appbar and such widgets by passing data in this constructor.
          appBar: new AppBar(
            //here goes another widget class constructor
            title: new Text("EasyList"),
          ),
          body: ProductManager(),  //It's parameter has a default value specified so no need to add parameter,but you can.
          );//created a named argument in the constructor of ProductManager Class using curly braces
  }
}
