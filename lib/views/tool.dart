import 'package:flutter/material.dart';
import 'package:flutter_app/controllers/controllers.dart';
import 'package:flutter_app/views/loginpage.dart';

class CollectPincode extends StatelessWidget {
  TextEditingController _pincodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AlertDialog(
        title: Text('Pincode to deliver'),
        content: TextField(
          controller: _pincodeController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pincode',
          ),
        ),
        actions: <Widget>[
//        FlatButton(
//          child: Text('Skip'),
//          onPressed: () {
//            Navigator.push(
//                context,
//                MaterialPageRoute(
//                    builder: (context) => HomePage()));
//          },
//        ),
          RaisedButton(
            child: Text('Proceed'),
            onPressed: () {
              print(_pincodeController.text);
              pincodeController(_pincodeController.text).then((value) {
                if (value) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                } else {
//                final snackBar = SnackBar(
//                  content: Text('enter correct pincode'),
//                  action: SnackBarAction(
//                    label: 'try again',
//                    onPressed: () {
//                      // Some code to undo the change.
//                    },
//                  ),
//                );
//
//                // Find the Scaffold in the widget tree and use
//                // it to show a SnackBar.
//                Scaffold.of(context).showSnackBar(snackBar);
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
