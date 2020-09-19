import 'package:flutter_app/globals.dart' as globals;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/views/account.dart';
import 'package:flutter_app/buyer/views/bnearbyshops.dart';
import 'package:flutter_app/views/cart.dart';
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
    _getLocation();
    print('home.dart: here outside async');
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
  // Function to find the nearest partner for a given pincode
  //FUNCTION TP RETRIEVE LIST OF PRODUCT FOR THE PARTNER

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _currentAddress == null
            ? Text("Detecting your location")
            : Text(_currentAddress.toString()),
        // centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.location_on),
          onPressed: () {
            _getLocation();
          },
        ),
      ),
      body: BuyerNearbyShops(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
                icon: Icon(Icons.home)),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Account(user: user))),
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
            child: IconButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account(user: user),
                    )),
                icon: Icon(Icons.account_circle)),
          ),
        ],
      ),
    );
  }
}
