import 'package:flutter/material.dart';
import 'package:flutter_app/partner/views/activeorders.dart';
import 'package:flutter_app/partner/views/addproducts.dart';
import 'package:flutter_app/partner/views/myproducts.dart';
import 'package:flutter_app/partner/views/paccount.dart';
import 'package:flutter_app/partner/views/pastorders.dart';

class PartnerHomepage extends StatefulWidget {
  @override
  _PartnerHomepageState createState() => _PartnerHomepageState();
}

class _PartnerHomepageState extends State<PartnerHomepage> {
  int _index = 0;
  List<Widget> _bodyList = [
    PartnerActiveOrders(),
    PartnerAddProducts(),
    PartnerMyProducts(),
    PartnerPastOrders(),
    PartnerAccountPage()
  ];
  List<Widget> _appBarList = [
    AppBar(
      leading: Icon(
        Icons.call_to_action,
        color: Colors.black54,
      ),
      title: Text(
        "Active Orders",
        style: TextStyle(color: Colors.black54),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.explore,
        color: Colors.black54,
      ),
      title: Text(
        "Explore Products",
        style: TextStyle(color: Colors.black54),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.store_mall_directory,
        color: Colors.black54,
      ),
      title: Text(
        "My Shop",
        style: TextStyle(color: Colors.black54),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.done_all,
        color: Colors.black54,
      ),
      title: Text(
        "Past Orders",
        style: TextStyle(color: Colors.black54),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
        backgroundColor: Colors.green,
        leading: Icon(
          Icons.account_box,
          color: Colors.black54,
          // size: 12,
        ),
        title: Text(
          'My Account',
          style: TextStyle(color: Colors.black54),
        )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarList[_index],
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
              backgroundColor: Colors.green,
              title: Text(""),
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.home),
                onPressed: () {
                  setState(() {
                    this._index = 0;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text(""),
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text(""),
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.store_mall_directory),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text(""),
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.done_all),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text(""),
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
}
