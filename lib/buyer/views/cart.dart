import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/buyer/models/item.dart';
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:toast/toast.dart';
import 'package:flutter_app/buyer/views/checkout.dart';

enum DialogDemoAction {
  cancel,
  discard,
  disagree,
  agree,
}

class BuyerCartPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CartState();
}

class CartState extends State<BuyerCartPage> {
  CollectionReference product = Firestore.instance.collection('Products');
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
                  top: 5.0), // left: 12.0, right: 12.0, bottom: 10.0
              height: hh,
              child: ListView.builder(
                  itemCount: globals.item_list.length,
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
                                    height: 100.0,
                                    width: dd,
                                    child: Card(
                                      child: Row(
                                        children: <Widget>[
                                          //for image
                                          SizedBox(
                                              height: 110.0,
                                              width: 100.0,
                                              child: Image.asset(
                                                globals
                                                    .item_list[ind].itemImage,
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
                                                          globals.item_list[ind]
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
                                                              text: globals
                                                                  .item_list[
                                                                      ind]
                                                                  .itemPrice
                                                                  .toString(),
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
                                                            globals
                                                                .item_list[ind]
                                                                .incrementQuantity();
                                                            globals.reference
                                                                .updateData({
                                                              'products.${globals.item_list[ind].itemCategory}.${globals.item_list[ind].itemIndex}.no_of_orders':
                                                                  FieldValue
                                                                      .increment(
                                                                          1)
                                                            });
                                                            setState(() {});
                                                          },
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 2.0),
                                                        ),
//
                                                        Text(
                                                          '${(globals.item_list[ind].itemQun).toString()}',
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
                                                            if (globals
                                                                    .item_list[
                                                                        ind]
                                                                    .itemQun >
                                                                1) {
                                                              globals.item_list[
                                                                      ind]
                                                                  .decrementQuantity();
                                                              globals.reference
                                                                  .updateData({
                                                                'products.${globals.item_list[ind].itemCategory}.${globals.item_list[ind].itemIndex}.no_of_orders':
                                                                    FieldValue
                                                                        .increment(
                                                                            -1)
                                                              });
                                                              setState(() {});
                                                            } else {
                                                              showToast();
//                                                            print("taost was here");
                                                            }
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
                                              text: (globals.item_list[ind]
                                                          .itemQun *
                                                      (globals.item_list[ind]
                                                          .itemPrice))
                                                  .toString(),
                                            )),
                                          ),
                                          new IconButton(
                                            icon: Icon(
                                              Icons.delete,
                                              semanticLabel: 'delete',
                                            ),
                                            onPressed: () {
                                              Item deleted_item =
                                                  globals.item_list[ind];
                                              int deleted_ind = ind;
                                              globals.item_name.remove(globals
                                                  .item_list[ind].itemName);
                                              globals.reference.updateData({
                                                'products.${globals.item_list[ind].itemCategory}.${globals.item_list[ind].itemIndex}.no_of_orders':
                                                    FieldValue.increment(
                                                        -globals.item_list[ind]
                                                            .itemQun)
                                              });
                                              globals.item_list.removeAt(ind);
                                              setState(() {});
                                              print("snackbar calling");
                                              showSnackBar(cont, deleted_item,
                                                  deleted_ind);
                                              print("snackbar complete");
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
                      getTotal(globals.item_list).toString(),
                      style: TextStyle(fontSize: 17.0, color: Colors.black54),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.center,
                        child: OutlineButton(
                            borderSide:
                                BorderSide(color: Colors.amber.shade500),
                            child: const Text('CHECKOUT'),
                            textColor: Colors.amber.shade500,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Checkout()));
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
      total += item.itemQun * (item.itemPrice);
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

//  void showToast() {
//    Fluttertoast.showToast(
//        msg: "Use delete icon to delete",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
////        backgroundColor: Colors.grey,
//        textColor: Colors.black,
//        fontSize: 16.0);
//  }
  void showToast() {
    Toast.show('Use delete icon to delete', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

  showSnackBar(BuildContext context, Item deleted_item, int deleted_ind) {
    print("snackbar inside");
    final snackBar = SnackBar(
      content: Text('You have deleted ${deleted_item.itemName}'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          globals.item_name.add(deleted_item.itemName);
          globals.item_list.insert(deleted_ind, deleted_item);
          globals.reference.updateData({
            'products.${globals.item_list[deleted_ind].itemCategory}.${globals.item_list[deleted_ind].itemIndex}.no_of_orders':
                FieldValue.increment(-globals.item_list[deleted_ind].itemQun)
          });
          setState(() {});
        },
      ),
    );
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
