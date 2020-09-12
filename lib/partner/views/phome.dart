import 'package:flutter/material.dart';
import 'package:flutter_app/partner/views/paccount.dart';

class PartnerHomepage extends StatefulWidget {
  @override
  _PartnerHomepageState createState() => _PartnerHomepageState();
}

class _PartnerHomepageState extends State<PartnerHomepage> {
  int _index = 0;
  List<Widget> _bodyList = [
    Column(
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          "RAVI WILL IMPLEMENT CURRENT ACTIVE ORDERS HERE!!!",
          style: TextStyle(color: Colors.black),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    ),
    PartnerAccountPage(),
    PartnerAccountPage(),
    PartnerAccountPage()
  ];
  List<Widget> _appBarList = [
    AppBar(
      leading: Icon(
        Icons.call_to_action,
        color: Colors.black,
      ),
      title: Text(
        "Active Orders",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
    ),
    AppBar(
      leading: Icon(
        Icons.call_to_action,
        color: Colors.black,
      ),
      title: Text(
        "Explore Products",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
    ),
    AppBar(
      leading: Icon(
        Icons.call_to_action,
        color: Colors.black,
      ),
      title: Text(
        "Past Orders",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.white,
    ),
    AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.account_box,
          color: Colors.black,
        ),
        title: Text(
          'My Account',
          style: TextStyle(color: Colors.black),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarList[_index],
      body: _bodyList[_index],
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
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PartnerHomepage()));
                }, // THIS BUTTON SHOULD BRING THE USER BACK TO HOME
              ),
              // activeIcon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => null));
                }, // THIS BUTTON SHOULD OPEN THE ADD PRODUCT CUM PRODUCT LIST SECTION
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (context) => null));
                }, // THIS BUTTON SHOULD OPEN THE FULFILLED ORDERS LIST
              ),
            ),
            BottomNavigationBarItem(
              title: Text(""),
              icon: IconButton(
                icon: Icon(Icons.account_box),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => PartnerAccountPage()));
                },
              ),
            ),
          ]),
    );
  }
}
