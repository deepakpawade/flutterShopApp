import 'package:flutter/material.dart';
import './pages/product.dart';

class Products extends StatelessWidget {
  //the actual change of data occurs in MyApp's products property
  //so this widget need not be stateful .It's just called in MyApp

  final List<String>
      products; //final keyword suggests that products property will never change once initialized (here by the constructor). Code works without it tough.
  //if new data is passed from outside, it will replace the old data in products . Here final works because the List is iterable type
  //If we had some int/float property final we can't change it,but final also allows us to make small changes on existing data e.g. we can round up that int/float data
  //const keyword blocks every change be it small changes to current data or re-assigning new value
  Products(this.products) {
    //constructor of Product class which will receive data in products property of 'this' class
    //if we initialized the product list but its constant, so we can't add new items
    print('[Products constructor called');
  }

  Widget _buildItemsList(BuildContext context, int index) {
    return Card(
      //box with soft edges and some shadow. It'll fill only the content and not the whole page if added in a column
      child: Column(
        children: <Widget>[
          //generic type annotation to show that this array can only have widgets
          Image.asset('assets/skyrim.jpg'),
          //create an assets folder and put that image in it
          //in pubspec.yaml remove hash in front of assets and path line and put the path of the image .In yaml indentations are important
          Text(products[index]), //our element is just a string from list

          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('Details'),
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => ProductPage(),
                      ),
                    ), //pages are loaded in a stack
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productView;
    if (products.length > 0) {
      productView = ListView.builder(
        itemBuilder: _buildItemsList,
        itemCount: products.length,
      );
    } else {
      productView = Center(
        child: Text("No product found please enter a product"),
        widthFactor: 6.0,
      );
    }
    return productView;
  }

  @override
  Widget build(BuildContext context) {
    print('build called');

    /// return ListView(     ///this type of ListView renders all the items before even the are drawn on the screen , this creates memory issues if the are many items..
    return _buildProductList();
  }
}

//if u dont want to return any widget you can return an empty Container()

// return products.length > 0 ?  ListView.builder(
//   itemBuilder: _buildItemsList,
//   itemCount: products.length,
// ) : Center(
//   child: Text("No products added , please add a product"),
// );

//old  code where ListView was used
// //the cards can be iterable widget and column shows where to draw the next card i.e one below other
// children: products
//     .map(
//       //takes every element in the products list and converts it into a card
//       (element) =>
//     ).toList(),
