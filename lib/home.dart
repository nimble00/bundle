import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/body.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Extras',
      style: optionStyle,
    ),
    Text(
      'Index 2: Cart',
      style: optionStyle,
    ),
    Text(
      'Index 3: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(icon: Icon(Icons.location_on), onPressed: () => {}),
        title: Text("Address"),
        actions: [
          Container(
            child:Center(
                  child:
               Text("Offers",
               style: TextStyle(fontSize: 20),),
                ),
          ),
          IconButton(icon: Icon(Icons.local_offer), onPressed: () => {})
        ],
      ),
      body:Body(),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,
            color:Colors.grey),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline,
            color:Colors.grey),
            title: Text('Extras'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart,
            color:Colors.grey),
            title: Text('Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box,
            color:Colors.grey),
            title: Text('Account'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
