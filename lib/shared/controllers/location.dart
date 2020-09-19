import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  // _getCurrentLocation() async {
  //   await getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
  //       .then((Position position) {
  //     setState(() {
  //       _currentPosition = position;
  //     });
  //     _getAddressFromLatLng();
  //   }).catchError((e) {
  //     print(e);
  //   });
  // }

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
