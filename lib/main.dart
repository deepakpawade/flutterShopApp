//dart is a typed language. It requires the type mentioned for variables and methods .
// However dart does not necessarily need return type of a method bcoz it is able to infer(deduct) the return type and
// it gives error that method does not return the expected type.

import 'package:flutter/material.dart'; //include code (classes) from flutter framework
// import 'package:flutter/rendering.dart';
import './productManager.dart';

main() {
  //attach widgets to main function so it will render the widgets to the screen.
  // debugPaintSizeEnabled = true;  
  // debugPaintBaselinesEnabled = true;
  // debugPaintPointersEnabled = true;
  runApp(
      new MyApp()); //runApp is function which takes a widget(object) as an argument.
}

// main() => runApp(MyApp()); is also valid if u have only one statement.
//creating a root widget
//A widget is an object of an class which is why we need to create a blueprint for the object
//class MyApp extends StatelessWidget {
/* StatefulWidget doesn't depend on anything like any previous state or actual user input, for e.g. A clock
    widget is a stateless widget which only takes the current values of time from device.
    Whereas a counter with button depends on actual user to change itself
     */

//classes allows us to create blueprint for new objects
// MyApp will inherit all the features of base class
//add features to a class
class MyApp extends StatelessWidget {
  @override //not compulsory
  //this annotation tells dart and flutter that we are overriding the method
  Widget build(BuildContext context) {
    //here writing Widget and BuildContext is not compulsory since dart infers the return type.
    //NOTE :  Widget itself is a class defined in flutter
    //this class needs to implement this method to be able to be drawn.
    //Whenever we pass a widget object to a main method , it'll always call build method on that object
    //the "context" argument will be the data passed by flutter since its called by flutter . context
    //includes meta info about app
    return  new MaterialApp(
      //this will return whatever is to be drawn on the screen and this will be another widget
      //here it returns a MaterialApp widget.
      //MaterialApp widget w/o parenthesis is a class in flutter/material.dart package
      //with parenthesis we return an object created and initialized since its a parameterised constructor defined in MaterialApp class
        // debugShowMaterialGrid: true,
        theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            // these are the static properties of class which can be called without instantiating the class
            accentColor: Colors.deepPurple,
            brightness: Brightness
                .light //default color set . dark sets to dark mode like colors
        ),
        // In dart new keyword is optional.
        home: //its a named argument which is used by most of the classes.
        //home requires another widget which is drawn on the screen when the app loads.
        new Scaffold(            //press and release ctrl + space
          //scaffold creates a new page with default white bkgrnd where we can add
          // appbar and such widgets by passing data in this constructor.
          appBar: new AppBar(
            //here goes another widget class constructor
            title: new Text("EasyList"),
          ),
          body: ProductManager(),  //It's parameter has a default value specified so no need to add parameter,but you can.
          ), //created a named argument in the constructor of ProductManager Class using curly braces
        );
  }

}
