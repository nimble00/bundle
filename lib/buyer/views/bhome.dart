import 'package:flutter_app/buyer/views/baccount.dart';
import 'package:flutter_app/buyer/views/bbusinesses.dart';
import 'package:flutter_app/buyer/views/bservices.dart';
import 'package:flutter_app/buyer/views/btoken.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/account.dart';
import 'package:flutter_app/buyer/views/bnearbyshops.dart';
import 'package:flutter_app/buyer/views/cart.dart';
import 'package:flutter_app/buyer/models/user.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  //final User user;
  //HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _currentAddress;
  String accountStatus;
  FirebaseUser currentUser;
  FirebaseAuth _auth;
  User user;
  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    // _getLocation();
    print('home.dart: here outside async');
  }

  int _index = 0;
  List<Widget> _bodyList = [
    // BuyerNearbyShops(),
    BuyerBusinessesPage(),
    BuyerTokenPage(),
    BuyerServicesPage(),
    BuyerCartPage(),
    BuyerAccountPage()
  ];

  List<Widget> _appBarList = [
    AppBar(
      title: Text("Dummy AppBar :::: NEVER TO BE USED"),
    ),
    AppBar(
      leading: Icon(
        Icons.store_mall_directory,
        color: Colors.black,
      ),
      title: Text(
        "My Shop",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      leading: Icon(
        Icons.done_all,
        color: Colors.black,
      ),
      title: Text(
        "Past Orders",
        style: TextStyle(color: Colors.black),
      ),
      // centerTitle: true,
      backgroundColor: Colors.green,
    ),
    AppBar(
      backgroundColor: Colors.green,
      leading: Icon(
        Icons.account_box,
        color: Colors.black,
        // size: 12,
      ),
      title: Text(
        'My Cart',
        style: TextStyle(color: Colors.black),
      ),
    ),
    AppBar(
      backgroundColor: Colors.green,
      leading: Icon(
        Icons.account_box,
        color: Colors.black,
        // size: 12,
      ),
      title: Text(
        'My Account',
        style: TextStyle(color: Colors.black),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget _column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          "Delivering to:",
          softWrap: true,
          style: TextStyle(fontSize: 14),
        ),
        Text(
          globals.address,
          softWrap: true,
          style: TextStyle(fontSize: 14),
        )
      ],
    );
    return Scaffold(
      appBar: _index == 0
          ? AppBar(
              backgroundColor: Colors.lightGreen,
              title: globals.address == null
                  ? Text(
                      "Detecting your location...",
                      softWrap: true,
                      style: TextStyle(fontSize: 14),
                    )
                  : _column,
              leading: IconButton(
                icon: Icon(Icons.location_on),
                iconSize: 30,
                color: Colors.white,
                onPressed: () {
                  _getLocation();
                  // OPEN location.dart TO ENTER THE LOCATION MANUALLY
                  // INSTEAD OF CALLING _getLocation()... it is already
                  // being called in initState()
                  // NO BIGGIE, WILL IMPLEMENT LATER
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.all_inclusive,
                  ),
                  iconSize: 35,
                  onPressed: () {},
                )
              ],
            )
          : _appBarList[_index],
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
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.explore),
                onPressed: () {
                  setState(() {
                    this._index = 0;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Tokens",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.store_mall_directory),
                onPressed: () {
                  setState(() {
                    this._index = 1;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Services",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.check),
                onPressed: () {
                  setState(() {
                    this._index = 2;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Cart",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
              icon: IconButton(
                padding: EdgeInsets.all(0),
                iconSize: 30,
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  setState(() {
                    this._index = 3;
                  });
                },
              ),
            ),
            BottomNavigationBarItem(
              title: Text(
                "Account",
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.lightGreen,
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

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    print('home.dart: Hello ' + currentUser.displayName.toString());
    setState(() {
      currentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print("home.dart: ACCOUNT STATUS: " + accountStatus);
      user = User.fromFirebaseUser(currentUser);
    });
  }

  _getLocation() async {
    // bool isLocationEnabled = await isLocationServiceEnabled();
    final prefs = await SharedPreferences.getInstance();
    Position position =
        await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
    debugPrint('location: ${position.latitude}');

    final coordinates = new Coordinates(position.latitude, position.longitude);
    debugPrint('coordinates is: $coordinates');

    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    _currentAddress = first.addressLine;
    prefs.setString("pincode", first.postalCode);
    prefs.setString("address", _currentAddress);
    setState(() {
      globals.pincode = first.postalCode;
      globals.address = _currentAddress;
      globals.position = position;
      _column = Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Delivering to:",
            softWrap: true,
            style: TextStyle(fontSize: 14),
          ),
          Text(
            _currentAddress.toString(),
            softWrap: true,
            style: TextStyle(fontSize: 14),
          )
        ],
      );
    });

    // print number of retured addresses
    debugPrint('${addresses.toString()}');
    // print the best address
    debugPrint("${first.featureName} : ${first.addressLine}");
    //print other address names
    debugPrint(
        "Country:${first.countryName} AdminArea:${first.adminArea} SubAdminArea:${first.subAdminArea}");
    //print more address names
    debugPrint("Locality:${first.locality}: Sublocality:${first.subLocality}");
  }
}
