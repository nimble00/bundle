import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String _currentAddress;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Where are you?"),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.location_on),
        onPressed: () {
          _getLocation();
        },
      ),
    );
  }

// Example: USE BELOW CODE TO GET PINCODE FROM THE ADDRESS
// ENTERED BY THE USER # IN CASE AUTO-DETECT IS WRONG!!!

// import 'package:geocoder/geocoder.dart';

// // From a query
// final query = "1600 Amphiteatre Parkway, Mountain View";
// var addresses = await Geocoder.local.findAddressesFromQuery(query);
// var first = addresses.first;
// print("${first.featureName} : ${first.coordinates}");

// // From coordinates
// final coordinates = new Coordinates(1.10, 45.50);
// addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
// first = addresses.first;

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
    _currentAddress = first.toString();
    prefs.setString("pincode", first.postalCode);
    prefs.setString("address", _currentAddress);

    // print number of retured addresses
    debugPrint('${addresses.length}');
    // print the best address
    debugPrint("${first.featureName} : ${first.addressLine}");
    //print other address names
    debugPrint(
        "Country:${first.countryName} AdminArea:${first.adminArea} SubAdminArea:${first.subAdminArea}");
    //print more address names
    debugPrint("Locality:${first.locality}: Sublocality:${first.subLocality}");
  }
}
