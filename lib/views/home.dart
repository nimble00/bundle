import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:flutter_app/views/account.dart';
import 'package:flutter_app/views/body.dart';
import 'package:flutter_app/views/cart.dart';
import 'package:flutter_app/models/user.dart';

class HomePage extends StatefulWidget {
  //final User user;
  //HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String accountStatus;
  FirebaseUser currentUser;
  FirebaseAuth _auth;
  User user;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    print('here outside async');
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    print('Hello ' + currentUser.displayName.toString());
    setState(() {
      currentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
      user = User.fromFirebaseUser(currentUser);
    });
  }

  // Function to find the nearest partner for a given pincode
  //FUNCTION TP RETRIEVE LIST OF PRODUCT FOR THE PARTNER

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            color: Colors.black,
            icon: Icon(Icons.location_on),
            onPressed: () => {
                  // IMPLEMENT A FUNCTION THAT FETCHES LOCATION AND REPLACE THIS ARROW FUNCTION WITH IT!
                }),
        title: Column(children: <Widget>[
          Text(
            "Delivering to",
            style: TextStyle(
                fontSize: 10, fontStyle: FontStyle.normal, color: Colors.black),
          ),
          /*Text(//ADDRESS OF THE USER,
              style:
                  TextStyle(fontStyle: FontStyle.normal,fontSize:11, color: Colors.black))*/
        ]),
        actions: [
          Container(
            child: Center(
              child: Text(
                "Offers",
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    fontSize: 20.0,
                    color: Colors.black),
              ),
            ),
          ),
          IconButton(
              color: Colors.black,
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
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                icon: Icon(Icons.home)),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(user: user))),
                icon: Icon(Icons.add_circle_outline)),
          ),
          Container(
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
            ),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(user: user))),
                icon: Icon(Icons.account_circle)),
          ),
        ],
      ),
    );
  }
}
