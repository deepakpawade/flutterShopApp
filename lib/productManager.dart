import 'package:flutter/material.dart';

import './products.dart';

import './productControl.dart';

//We need to add products dynamically on pressing a button so we need a stateful widget
class ProductManager extends StatefulWidget{   //Stateful widget needs a state method

  final String startingProduct;
  ProductManager({this.startingProduct}){  //create a named argument and assign a default value
    print('manager constructor called');
  }

  @override           //type createS and IDE will recommend this method
  State<StatefulWidget> createState() {   //used when we need to re-render things to the screen
    //<State..> tells that the State object will belong to StatefulWidget class or which will work with a stfl widget.
    print('manager createState');
  
    return _productManagerState();    //returns a state object that works with a stfl widget
  }
}
class _productManagerState extends State<ProductManager>{   //its a state object so it extends state object
  //  _method restricts the scope of method within block
  //by adding MyApp in angled brackets we tell that this _MyAppState state class belongs to MyApp Widget. So the connection between those classes is made.

  List<String> products = [ ]; //create list(array) of strings named products
          //we can write [widget.startingProduct] because the state is connected to parent widget
          //but we can't use it here while initializing properties of a widget


  @override

  void initState(){   //will be called when the state object is created
    super.initState();   //super refers to the parent class.This calls initState on base class to make sure it is called there even if you override it
    //initState runs before the build function, so all the changed made are before rendering anything . So no need
    //to call setState which re-renders all the widgets whenever changes are made
    print('manager initState');
    if(widget.startingProduct!=null)
    products.add(widget.startingProduct);

  }


  @override
  void didUpdateWidget(ProductManager oldWidget){
    //prints
    super.didUpdateWidget(oldWidget);
  }

  void _addProduct(String product){
    setState(() {
      // setState re-renders the app making the changes written in this method. W/o it the changes will be made in the list but will not be drawn
      products.add(product);
    });   //it's efficient as it re-renders the build method of that state widget only if changes are made.

    print(products);
  }
  Widget build(BuildContext context) {
    print('manager state build');
    return  Column(
      //container allows us to add margin to the widget . Here RaisedButton() Widget
      children:<Widget>[Container(
        margin: EdgeInsets.all(10.0),
        child: ProductControl(_addProduct),  //pass just address of method i.e passing down a reference to the function
      ),
      Expanded(     //wrappped with a container(not here cause we dont know the height) or Expanded Widget for ListView inside Products to be compatiblle
        child: Products(products)
        )  
      ] 
    );
  }
}