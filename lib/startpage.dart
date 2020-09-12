import 'package:flutter/material.dart';
import 'package:flutter_app/partner/views/phome.dart';
import 'controllers/authservice.dart';

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
            padding: EdgeInsets.only(top: 20, bottom: 20),
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
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PartnerHomepage(),
              ),
            ),
            padding: EdgeInsets.only(top: 20, bottom: 20),
          ),
          Spacer(
            flex: 1,
          ),
          RaisedButton(
            child: Column(
              children: <Widget>[
                Text("buy"),
                Icon(Icons.local_mall),
              ],
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AuthService().handleAuth(),
              ),
            ),
            padding: EdgeInsets.only(top: 20, bottom: 20),
          ),
          Spacer(
            flex: 10,
          ),
        ],
      ),
    );
  }
}