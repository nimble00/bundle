import 'package:flutter/material.dart';

class PartnerHomepage extends StatefulWidget {
  @override
  _PartnerHomepageState createState() => _PartnerHomepageState();
}

class _PartnerHomepageState extends State<PartnerHomepage> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        // backgroundColor: Colors.black,
      ),
      body: Container(
        child: Text("RAVI WILL IMPLEMENT CURRENT ACTIVE ORDERS HERE!!!"),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          // fixedColor: Colors.black, // CHECK WHAT THIS DOES
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              title: Text(""),
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
              // activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text("products"),
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
              title: Text(""),
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
              title: Text("account"),
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
