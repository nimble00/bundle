import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class CartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartState();
}

class Item {
  final String itemImage;
  final String itemName;
  int itemQun;
  final String itemPrice;
//  final double itemPrice;

  Item({this.itemImage, this.itemName, this.itemQun, this.itemPrice});
  void incrementQuantity() => itemQun += 1;
  void decrementQuantity() => itemQun -= 1;
}

class CartState extends State<CartPage> {
  CollectionReference product = Firestore.instance.collection('Products');
  List<Item> itemList = <Item>[
    Item(
      itemImage: 'assets/beer.jpg',
      itemName: 'Black beer',
      itemQun: 1,
      itemPrice: '100.0',
//        itemPrice:100.0,
    ),
    Item(
      itemImage: 'images/tomato.jpg',
      itemName: 'Tomato',
      itemQun: 3,
      itemPrice: '112.0',
//        itemPrice: 112.0,
    ),
    Item(
      itemImage: 'images/guava.jpg',
      itemName: 'Guava',
      itemQun: 2,
      itemPrice: '105.6',
//        itemPrice: 105.0,
    ),
//    Item(
//        itemImage: 'images/kiwi.jpg',
//        itemName: 'Kiwi',
//        itemQun: 1,
//        itemPrice: '90.0'),
//    Item(
//        itemImage: 'images/lemons.jpg',
//        itemName: 'Lemon',
//        itemQun: 2,
//        itemPrice: '70.0'),
//    Item(
//        itemImage: 'images/apple.jpg',
//        itemName: 'Apple',
//        itemQun: 1,
//        itemPrice:'50.0'),
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  String pincode;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    IconData _add_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.add_circle;
        case TargetPlatform.iOS:
          return Icons.add_circle;
      }
      assert(false);
      return null;
    }

    IconData _sub_icon() {
      switch (Theme.of(context).platform) {
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
          return Icons.remove_circle;
        case TargetPlatform.iOS:
          return Icons.remove_circle;
      }
      assert(false);
      return null;
    }

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    double dd = width * 0.77;
    double hh = height - 215.0;
    int item = 0;
    final ThemeData theme = Theme.of(context);
    final TextStyle dialogTextStyle =
        theme.textTheme.subhead.copyWith(color: theme.textTheme.caption.color);

    return new Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(_backIcon()),
          alignment: Alignment.centerLeft,
          tooltip: 'Back',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('My Cart (${itemList.length})'),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: <Widget>[
          //addres wala
          Container(
              margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),
              child: Card(
                  child: Container(
                      padding:
                          const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                      child: GestureDetector(
                          child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          // three line description
                          Row(
                            children: <Widget>[
                              Text(
                                'Pincode : ',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black54,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 2.0),
                              ),
                              GestureDetector(
                                child: Text(
                                  '383310',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black),
                                ),
                                onTap: () {
                                  showDemoDialog<DialogDemoAction>(
                                      context: context,
                                      child: AlertDialog(
                                          title: const Text(
                                              'Location/Area Pincode'),
                                          content: SizedBox(
                                            height: 24.0,
                                            child: TextFormField(
                                                keyboardType: TextInputType
                                                    .emailAddress, // Use email input type for emails.
                                                decoration: new InputDecoration(
                                                    hintText: '******',
                                                    labelText: 'Pincode'),
                                                //  validator: this._validateEmail,
                                                onSaved: (String value) {
                                                  this.pincode = value;
                                                }),
                                          ),
                                          actions: <Widget>[
                                            FlatButton(
                                                child: const Text('CANCEL'),
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context,
                                                      DialogDemoAction
                                                          .disagree);
                                                }),
                                            FlatButton(
                                                child: const Text('SAVE'),
                                                onPressed: () {
                                                  Navigator.pop(context,
                                                      DialogDemoAction.agree);
                                                })
                                          ]));
                                },
                              )
                            ],
                          ),
                        ],
                      ))))),

          //image , name, price , total price
          Container(
              margin: EdgeInsets.only(
                  left: 12.0, top: 5.0, right: 12.0, bottom: 10.0),
              height: hh,
              child: ListView.builder(
                  itemCount: itemList.length,
                  itemBuilder: (BuildContext cont, int ind) {
                    return SafeArea(
                        child: Container(
                      alignment: Alignment.topLeft,
                      child: Column(
                        children: <Widget>[
                          Container(
                              alignment: Alignment.topLeft,
                              child: Row(
                                children: <Widget>[
                                  // to show image , name , quantity, price
                                  Container(
                                    height: 120.0,
                                    width: dd,
                                    child: Card(
                                      child: Row(
                                        children: <Widget>[
                                          //for image
                                          SizedBox(
                                              height: 110.0,
                                              width: 100.0,
                                              child: Image.asset(
                                                itemList[ind].itemImage,
                                                fit: BoxFit.fill,
                                              )),
                                          SizedBox(
                                              height: 110.0,
                                              child: Container(
                                                alignment: Alignment.topLeft,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    _verticalD(),
                                                    //name of product
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Text(
                                                          itemList[ind]
                                                              .itemName,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 18.0,
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                    _verticalD(),
                                                    //for price
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: <Widget>[
                                                        Container(
                                                          child: Text.rich(
                                                            TextSpan(
                                                              text: itemList[
                                                                      ind]
                                                                  .itemPrice,
//                                                                  debugPrint(itemList[ind].itemPrice),
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      15.0,
                                                                  color: Colors
                                                                      .black54),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    //for + - icon and quantity
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        new IconButton(
                                                          icon: Icon(
                                                              _add_icon(),
                                                              color: Colors
                                                                  .amber
                                                                  .shade500),
                                                          onPressed: () {
                                                            itemList[ind]
                                                                .incrementQuantity();
                                                            setState(() {});
                                                          },
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 2.0),
                                                        ),
//                                                            RichText(
//                                                              text: TextSpan(
//
////                                                                text:'${itemList[ind].itemQun.toString()}',
//                                                              text: (itemList[ind].itemQun).toString(),
//                                                                style: TextStyle(
//                                                                    fontWeight:
//                                                                    FontWeight
//                                                                        .bold,
//                                                                    fontSize: 18.0,
//                                                                    color:
//                                                                    Colors.black),
//                                                              ),
//
//
//                                                            ),
                                                        Text(
                                                          '${(itemList[ind].itemQun).toString()}',
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 2.0),
                                                        ),
                                                        new IconButton(
                                                          icon: Icon(
                                                              _sub_icon(),
                                                              color: Colors
                                                                  .amber
                                                                  .shade500),
                                                          onPressed: () {
                                                            itemList[ind]
                                                                .decrementQuantity();
                                                            setState(() {});
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ),

                                  //to show total price of product quantity*price
                                  SizedBox(
                                      height: 110.0,
                                      width: 50.0,
//
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            padding:
                                                const EdgeInsets.only(top: 20),
                                            child: Text.rich(TextSpan(
                                              text: (itemList[ind].itemQun *
                                                      double.parse(itemList[ind]
                                                          .itemPrice))
                                                  .toStringAsFixed(2),
                                            )),
                                          ),
                                          new IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              semanticLabel: 'delete',
                                            ),
                                            onPressed: () {
                                              itemList.removeAt(ind);
                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      ),
                    ));
                  })),

          //to show total and conform order button
          Container(
              alignment: Alignment.bottomLeft,
              height: 60.0,
              child: Card(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    //IconButton(icon: Icon(Icons.info), onPressed: null),
                    Text(
                      'Total :',
                      style: TextStyle(
                          fontSize: 17.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      getTotal(itemList).toString(),
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
//                              Navigator.push(
//                                  context,
//                                  MaterialPageRoute(
//                                      builder: (context) => Checkout()));
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

  verticalDivider() => Container(
        padding: EdgeInsets.all(2.0),
      );

  _verticalD() => Container(
        margin: EdgeInsets.only(left: 3.0, right: 0.0, top: 07.0, bottom: 0.0),
      );
  double getTotal(List<Item> itemList) {
    double total = 0;
    for (Item item in itemList) {
      total += item.itemQun * double.parse(item.itemPrice);
    }
    return total;
  }

  void showDemoDialog<T>({BuildContext context, Widget child}) {
    showDialog<T>(
      context: context,
      builder: (BuildContext context) => child,
    ).then<void>((T value) {
      // The value passed to Navigator.pop() or null.
      if (value != null) {
        _scaffoldKey.currentState
            .showSnackBar(SnackBar(content: Text('You selected: $value')));
      }
    });
  }
}
