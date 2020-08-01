import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/account.dart';
import 'package:flutter_app/views/body.dart';
import 'package:flutter_app/cart.dart';
class HomePage extends StatefulWidget {
  final FirebaseUser user;
  HomePage({this.user});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
                        builder: (context) => Account(widget.user))),
                icon: Icon(Icons.home)),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(widget.user))),
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
<<<<<<< HEAD
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
=======
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(widget.user))),
                icon: Icon(Icons.account_circle)),
>>>>>>> 6042b2c20a986c0275d8057c75e9dd6ffd88d005
          ),
        ],
      ),
    );
  }
}
