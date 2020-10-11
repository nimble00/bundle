import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/buyer/views/bhome.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/partner/views/phome.dart';

class AddUser extends StatefulWidget {
  @override
  _AddUserState createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  String accountStatus;
  User currentUser;
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
    currentUser = _auth.currentUser;
    // Position position = await Geolocator()
    //     .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print('Hello ' + currentUser.displayName.toString());
    setState(() {
      accountStatus = currentUser != null ? 'Signed In' : 'Not Signed In';
      print("ACCOUNT STATUS: " + accountStatus);
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
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser(
      String uname,
      String userType,
      // String ageproof,
    ) {
      // Call the users CollectionReference to add a new user
      return users
          .doc(currentUser.phoneNumber)
          .set({
            'username': uname, // John Doe
            'userType': userType,
            'orders.no_of_orders': 0,
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
          RaisedButton(
            onPressed: () async => {
              addUser(
                nameCtl.text,globals.userType,
                // ageProof.text    IMPL DROP DOWN AND UPLOAD FROM DEVICE OPTION FOR ID PROOF
                // IMPL ACCESS DEVICE LOCATION
              ),
              if(globals.userType=="buyer"){
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage()))
              }else{
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PartnerHomepage()))
              }
            },
            child: Text("Submit"),
          ),
          Spacer(flex: 1),
        ],
      ),
    );
  }
}
