import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app/views/payment.dart';
import 'package:flutter_app/buyer/models/item.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/views/payment.dart';

class Checkout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CheckoutState();
}

class CheckoutState extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool checkboxValueA = true;
  bool checkboxValueB = false;
  bool checkboxValueC = false;
  int numOrders;
  @override
  void initState() {
    super.initState();
    _getOrders();
  }

  _getOrders() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(globals.phoneNumber)
        .get()
        .then((value) {
      numOrders = value.data()['orders']['numOrders'];
    });
  }

  @override
  Widget build(BuildContext context) {
    // final double height = MediaQuery.of(context).size.height;

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('CheckOut'),
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
                                              color: Colors.black),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.play_circle_outline,
                                              color: Colors.blue,
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
                                              color: Colors.black38),
                                        ),
                                        IconButton(
                                            icon: Icon(
                                              Icons.check_circle,
                                              color: Colors.black38,
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
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Delivery Address',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),
          //ADDRESS
          Container(
              height: 165.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    height: 165.0,
                    width: 56.0,
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          new Container(
                              alignment: Alignment.center,
                              child: IconButton(
                                  icon: Icon(Icons.add), onPressed: null)),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 165.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Naomi A. Schultz',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      '2585 Columbia Boulevard',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      'Salisbury',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      'MD 21801',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black26,
                                            ),
                                          ),
                                          _verticalD(),
                                          new Checkbox(
                                            value: checkboxValueA,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueA = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Lisa J. Cunningham',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      '49 Bagwell Avenue',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      'Ocala',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      ' FL 34471',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          _verticalD(),
                                          new Checkbox(
                                            value: checkboxValueB,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueB = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 130.0,
                    width: 200.0,
                    margin: EdgeInsets.all(7.0),
                    child: Card(
                      elevation: 3.0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Container(
                                margin: EdgeInsets.only(
                                    left: 12.0,
                                    top: 5.0,
                                    right: 0.0,
                                    bottom: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    new Text(
                                      'Elizabeth J. Schmidt',
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      '3674 Oakway Lane',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      'Long Beach',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    _verticalDivider(),
                                    new Text(
                                      ' CA 90802',
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 13.0,
                                          letterSpacing: 0.5),
                                    ),
                                    new Container(
                                      margin: EdgeInsets.only(
                                          left: 00.0,
                                          top: 05.0,
                                          right: 0.0,
                                          bottom: 5.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          new Text(
                                            'Delivery Address',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: Colors.black12,
                                            ),
                                          ),
                                          _verticalD(),
                                          new Checkbox(
                                            value: checkboxValueC,
                                            onChanged: (bool value) {
                                              setState(() {
                                                checkboxValueC = value;
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
          _verticalDivider(),
          Container(
            alignment: Alignment.topLeft,
            margin:
                EdgeInsets.only(left: 12.0, top: 5.0, right: 0.0, bottom: 5.0),
            child: new Text(
              'Order Summary',
              style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
            ),
          ),

          //ITEM LIST
          Container(
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 12.0, bottom: 5.0),
              height: 170.0,
              child: ListView.builder(
                  itemCount: globals.itemList.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Column(
                      children: <Widget>[
                        Divider(height: 15.0),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(globals.itemList[ind].itemName,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              Text(globals.itemList[ind].itemQun.toString(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                              Text(
                                  (globals.itemList[ind].itemQun *
                                          globals.itemList[ind].itemPrice)
                                      .toString(),
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ],
                    ));
                  })),

          //TOTAL
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
                            borderSide:
                                BorderSide(color: Colors.amber.shade500),
                            child: const Text('CONFIRM ORDER'),
                            textColor: Colors.amber.shade500,
                            onPressed: () {
                              addOrderToDatabase();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PaymentPage()));
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

  void addOrderToDatabase() {
    int sum = 0;
    for (int i = 0; i < globals.itemList.length; i++) {
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.itemCategory':
            globals.itemList[i].itemCategory
      });
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.itemPrice':
            globals.itemList[i].itemPrice
      });
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.itemQun':
            globals.itemList[i].itemQun
      });
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.itemIndex':
            globals.itemList[i].itemIndex
      });
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.itemImage':
            globals.itemList[i].itemImage
      });
      globals.user.update({
        'orders.details.' +
                numOrders.toString() +
                '.items.${globals.itemList[i].itemName}.numOrders':
            globals.itemList[i].numOrders
      });
      sum += globals.itemList[i].itemPrice * globals.itemList[i].itemQun;
    }
    globals.user
        .update({'orders.details.' + numOrders.toString() + '.total': sum});
    globals.user.update(
        {'orders.details.' + numOrders.toString() + '.status': "Delievered"});
    globals.user.update(
        {'orders.details.' + numOrders.toString() + '.date': "20 July"});
    globals.user.update({'orders.numOrders': FieldValue.increment(1)});
  }

  _verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 0.0, bottom: 0.0),
      );
}
