import 'dart:io';
import 'package:flutter/material.dart';
import 'buyer/controllers/authservice.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/buyer/views/loginpage.dart';
import 'package:path_provider/path_provider.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/info.txt');
  }
  Future<File> addData(String text) async {
    final file = await _localFile;
    return file.writeAsString('$text');
//    return file.writeAsString('$text\r\n', mode: FileMode.append);
  }
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
            onPressed: () => {
                globals.userType="partner",
              addData(globals.userType),
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
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
            onPressed: () => {
                globals.userType="buyer",
              addData(globals.userType),
                Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ),
              ),
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
