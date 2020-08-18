import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/views/home.dart';
import '../models/user.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String accountStatus;
  FirebaseUser currentUser;
  FirebaseAuth _auth;
  // User user;

  @override
  void initState() {
    super.initState();
    _auth = FirebaseAuth.instance;
    _getCurrentUser();
    print('here outside async');
  }

  _getCurrentUser() async {
    currentUser = await _auth.currentUser();
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Hello ' + currentUser.displayName.toString());
    setState(() {
      currentUser != null ? accountStatus = 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
      // user = User.fromFirebaseUser(currentUser);
      // user.location = position;
      // print('POSITION: ' + user.location.toString());
    });
  }

  final TextEditingController nameCtl = TextEditingController();
  final TextEditingController lnameCtl = TextEditingController();
  final TextEditingController pincodeCtl = TextEditingController();
  final TextEditingController addressCtl = TextEditingController();
  final TextEditingController dobCtl = TextEditingController();
  final TextEditingController ageProofCtl = TextEditingController();
  final TextEditingController dateCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Create a CollectionReference called users that references the firestore collection
    CollectionReference users = Firestore.instance.collection('users');

    Future<void> addUser(
      String uname,
      String pin,
      String address,
      String dob,
      // String ageproof,
    ) {
      // Call the users CollectionReference to add a new user
      return users
          .document(currentUser.phoneNumber)
          .setData({
            'username': uname, // John Doe
            'pincode': pin, // Stokes and Sons
            // 'govt_ID': ageproof,
            'dateOfBirth': dob,
            'address': address,
            'orders.no_of_orders':0,
          })
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Tell us about you!"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 1),
          TextField(
            controller: nameCtl,
            decoration: InputDecoration(
              labelText: 'Full Name',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            controller: dateCtl,
            decoration: InputDecoration(
              labelText: "Date of birth",
              hintText: "Ex. Insert your dob",
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal),
              ),
            ),
            onTap: () async {
              DateTime date = DateTime(1900);
              FocusScope.of(context).requestFocus(new FocusNode());

              date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100));

              dateCtl.text = date.toIso8601String();
            },
          ),
          SizedBox(height: 10),
          TextField(
            controller: addressCtl,
            decoration: InputDecoration(
              labelText: 'Address',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: pincodeCtl,
            decoration: InputDecoration(
              labelText: 'PINCODE',
              border: new OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.teal),
              ),
            ),
          ),
          SizedBox(height: 10),
          RaisedButton(
            onPressed: () async => {
              addUser(
                nameCtl.text, pincodeCtl.text,
                addressCtl.text, dateCtl.text,
                // ageProof.text    IMPL DROP DOWN AND UPLOAD FROM DEVICE OPTION FOR ID PROOF
                // IMPL ACCESS DEVICE LOCATION
              ),
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()))
            },
            child: Text("Submit"),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
