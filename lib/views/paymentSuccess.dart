import 'package:flutter/material.dart';

class PaymentSuccess extends StatefulWidget {
//  PaymentSuccess({Key key, this.amount}) : super(key: key);

  @override
  _PaymentSuccessState createState() => _PaymentSuccessState();
}

class _PaymentSuccessState extends State<PaymentSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Payment Succesful"),
        ),
        body: Center(
          child: Text("Payment Successful page. put track_order, total, date , etc... "),
        )
//        bottomNavigationBar:
    );
  }

}