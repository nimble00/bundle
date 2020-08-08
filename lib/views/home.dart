import 'package:firebase_auth/firebase_auth.dart';
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
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    print('here outside async');
  }

  // Function to find the nearest partner for a given pincode
  //FUNCTION TP RETRIEVE LIST OF PRODUCT FOR THE PARTNER

  @override
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
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage())),
                icon: Icon(Icons.home)),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account())),
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
                        builder: (context) => Account())),
                icon: Icon(Icons.account_circle)),
          ),
        ],
      ),
    );
  }
}
