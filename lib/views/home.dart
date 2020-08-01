import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/account.dart';
import 'package:flutter_app/views/body.dart';

class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Extras',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () => {
                  // IMPLEMENT A FUNCTION THAT FETCHES LOCATION AND REPLACE THIS ARROW FUNCTION WITH IT!
                }),
        title: Text("Address"),
        actions: [
          Container(
            child: Center(
              child: Text(
                "Offers",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          IconButton(
              icon: Icon(Icons.local_offer),
              onPressed: () => {
                    // IMPLEMENT THE OFFERS PAGE HERE!
                  })
        ],
      ),
      body: Body(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Icon(Icons.home, color: Colors.grey),
            // title: Text('Home'),
            // backgroundColor:
            //     isTapped() ? Colors.lightBlueAccent : Colors.blueGrey,
          ),
          Container(
            child: Icon(Icons.add_circle_outline, color: Colors.grey),
            // title: Text('Extras'),
          ),
          Container(
            child: Icon(Icons.add_shopping_cart, color: Colors.grey),
            // title: Text('Cart'),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: FlatButton(
              onPressed: () => {
                print("YAHA PE DELETED USER " + widget.user.toString()),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(user: widget.user)))
              },
              child: Text('Account'),
            ),
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }
}
