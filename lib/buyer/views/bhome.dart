import 'package:flutter_app/buyer/views/baccount.dart';
import 'package:flutter_app/buyer/views/bbusinesses.dart';
import 'package:flutter_app/buyer/views/bservices.dart';
import 'package:flutter_app/buyer/views/btoken.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/views/cart.dart';

class HomePage extends StatefulWidget {
  //final User user;
  //HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String accountStatus;
  User currentUser;
  FirebaseAuth _auth;
  User user;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    // _getLocation();
    print('home.dart: here outside async');
  }

  int _index = 0;
  List<Widget> _bodyList = [
    // BuyerNearbyShops(),
    BuyerBusinessesPage(),
    BuyerTokenPage(),
    BuyerServicesPage(),
    BuyerCartPage(),
    BuyerAccountPage()
  ];

  List<Widget> _appBarList = [
    AppBar(
      title: Text("Dummy AppBar :::: NEVER TO BE USED"),
    ),
    AppBar(
      leading: Icon(
        Icons.store_mall_directory,
        color: Colors.black,
      ),
      title: Text(
        "My Shop",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.done_all,
        color: Colors.black,
      ),
      title: Text(
        "Past Orders",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      backgroundColor: Colors.green,
      leading: Icon(
        Icons.account_box,
        color: Colors.black,
        // size: 12,
      ),
      title: Text(
        'My Cart',
        style: TextStyle(color: Colors.black),
      ),
    ),
    AppBar(
      backgroundColor: Colors.green,
      leading: Icon(
        Icons.account_box,
        color: Colors.black,
        // size: 12,
      ),
      title: Text(
        'My Account',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _index == 0
          ? AppBar(
              backgroundColor: Colors.lightGreen,
              title: globals.address == null
                  ? Text(
                      "Detecting your location...",
                      softWrap: true,
                      style: TextStyle(fontSize: 14),
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Delivering to:",
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          globals.address,
                          softWrap: true,
                          style: TextStyle(fontSize: 14),
                        )
                      ],
                    ),
              leading: IconButton(
                icon: Icon(Icons.location_on),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  // _getLocation();
                  // OPEN location.dart TO ENTER THE LOCATION MANUALLY
                  // INSTEAD OF CALLING _getLocation()...
                  // NO BIGGIE, WILL IMPLEMENT LATER
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.all_inclusive,
                  ),
                  iconSize: 35,
                  onPressed: () {},
                )
              ],
            )
          : _appBarList[_index],
      body: _bodyList[_index],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 8,
          currentIndex: _index,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black38,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 0;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Tokens",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.store_mall_directory),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Services",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Account",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.account_box),
                onPressed: () {
                  setState(() {
                    this._index = 4;
                  });
                },
              ),
            ),
          ]),
    );
  }

  _getCurrentUser() {
    currentUser = _auth.currentUser;
    print('home.dart: Hello ' + currentUser.displayName.toString());
    setState(() {
      accountStatus = currentUser != null ? 'Signed In' : 'Not Signed In';
      print("bhome.dart: ACCOUNT STATUS: " + accountStatus);
      // user = User.fromFirebaseUser(currentUser);
    });
  }
}
