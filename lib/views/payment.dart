import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/buyer/models/item.dart';
import 'package:flutter_app/views/paymentGateway.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<PaymentPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.blueGrey,
      ),
      body: new Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(5.0),
              child: Card(
                  child: Container(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // three line description
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Delivery',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black38),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.black38,
                                            ),
                                            onPressed: null)
                                      ],
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                          'Payment',
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.blue,
                                            ),
                                            onPressed: null)
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ],
                      )))),
          _verticalDivider(),
          Container(
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  color: Colors.green.shade100,
                  child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                      child: Text(
                          "GET EXTRA 5% OFF* with MONEY bank Simply Save Credit card. T&C.",
                          //TO PUT BANK OFFER
                          maxLines: 10,
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.black87))),
                ),
              )),
          new Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Payment Method',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          _verticalDivider(),

          //PAYMENT METHODS LIST WITH RADIO BUTTON
          new Container(
              height: 264.0,
              margin: EdgeInsets.all(10.0),
              child: Card(
                child: Container(
                  child: Container(
                      child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text("Wallet / UPI",
                                maxLines: 10,
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black)),
                            Radio<int>(
                                value: 0, groupValue: 0, onChanged: null),
                          ],
                        ),
                      ),
                      Divider(),
                      _verticalD(),
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Net Banking",
                                  maxLines: 10,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black)),
                              Radio<int>(
                                  value: 0,
                                  groupValue: radioValue,
                                  onChanged: null),
                            ],
                          )),
                      Divider(),
                      _verticalD(),
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Credit / Debit / ATM Card",
                                  maxLines: 10,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black)),
                              Radio<int>(
                                  value: 0,
                                  groupValue: 0,
                                  onChanged: handleRadioValueChanged),
                            ],
                          )),
                      Divider(),
                      _verticalD(),
                      Container(
                          padding: EdgeInsets.only(left: 10.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Cash on Delivery",
                                  maxLines: 10,
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.black)),
                              Radio<int>(
                                  value: 0, groupValue: 0, onChanged: null),
                            ],
                          )),
                      Divider(),
                    ],
                  )),
                ),
              )),
          Container(
              alignment: Alignment.bottomLeft,
              height: 50.0,
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.info), onPressed: null),
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      getTotal().toString(),
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide: BorderSide(color: Colors.green),
                            child: const Text('PROCEED TO PAY'),
                            textColor: Colors.green,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PaymentGateway(amount: getTotal())));
                            },
                            shape: new OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            )),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  double getTotal() {
    double total = 0;
    for (Item item in globals.itemList) {
      total += item.itemQun * (item.itemPrice);
    }
    return total;
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 5.0),
      );
}
