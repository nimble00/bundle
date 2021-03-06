import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;

import 'buyer/controllers/authservice.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Spacer(
            flex: 10,
          ),
          RaisedButton(
            onPressed: null,
            child: Text(" i want to "),
            padding: EdgeInsets.all(10.0),
          ),
          Spacer(
            flex: 4,
          ),
          RaisedButton(
            child: Column(
              children: <Widget>[
                Text("sell"),
                Icon(Icons.local_grocery_store),
              ],
            ),
            onPressed: () {
              globals.userType = "partner";
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthService().handleAuth(),
                  // builder: (context) => LoginPage(),
                ),
              );
            },
            padding: EdgeInsets.all(10.0),
          ),
          Spacer(
            flex: 1,
          ),
          Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                print('Card tapped.');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Text('A card that can be tapped'),
              ),
            ),
          ),
          RaisedButton(
            child: Column(
              children: <Widget>[
                Text("buy"),
                Icon(Icons.local_mall),
              ],
            ),
            onPressed: () {
              // getApplicationDocumentsDirectory().then((dir) {
              //   File file = new File('${dir.path}/userType.txt');
              //   file.writeAsString("buyer");
              // });
              globals.userType = "buyer";
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AuthService().handleAuth(),
                  // builder: (context) => LoginPage(),
                ),
              );
            },
            padding: EdgeInsets.all(10.0),
          ),
          Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}
