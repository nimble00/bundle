import 'package:flutter/material.dart';

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("RAVI WILL IMPLEMENT CURRENT ACTIVE ORDERS HERE!!!"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    this._index = 0;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                }, // THIS BUTTON SHOULD BRING THE USER BACK TO HOME
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                }, // THIS BUTTON SHOULD OPEN THE ADD PRODUCT CUM PRODUCT LIST SECTION
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                }, // THIS BUTTON SHOULD OPEN THE FULFILLED ORDERS LIST
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => null));
                },
              ),
            ),
          ]),
    );
  }
}
