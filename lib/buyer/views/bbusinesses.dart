import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/models/partner.dart';
import 'package:flutter_app/buyer/views/spirit.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';

class BuyerBusinessesPage extends StatefulWidget {
  @override
  _BuyerBusinessesPageState createState() => _BuyerBusinessesPageState();
}

class _BuyerBusinessesPageState extends State<BuyerBusinessesPage> {
  // ignore: unused_field
  bool _pinCheck;
  Position _userPos;
  // ignore: unused_field
  Map _nearByShops;
  Stream<DocumentSnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _userPos = globals.position;
    _pinCheck = doWeServePincode(globals.pincode);
    _stream = FirebaseFirestore.instance
        .collection('pincodes')
        .doc(globals.pincode)
        .snapshots()
        .asBroadcastStream();
  }

  doWeServePincode(pincode) {
    try {
      FirebaseFirestore.instance
          .collection('pincodes')
          .doc(pincode)
          .get()
          .then((DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          print('WE SERVE AT THIS PINCODE');
          return true;
        }
        return false;
      });
    } catch (e) {
      return false;
    }
  }

  _generateCards(AsyncSnapshot snapshot) {
    // if (!_pinCheck) {
    //   return Center(
    //     child: Text("We don't serve your location yet!"),
    //   );
    // }
    displayList = new List();
    _productList(snapshot);
    filterList();
    List<Card> cards = List.generate(
      displayList.length,
      (int index) => Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 40.0 / 11.0,
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SpiritPage(
                              displayList: displayList[index], index: index))),
                  // child: Image.asset(displayList[index].image),
                  child: Icon(Icons.image),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(displayList[index].name),
                    ),
                    Center(
                      child: Text(displayList[index].phone),
                    ),
                    // Center(
                    //   child:
                    //       Text((displayList[index].partnerPrice).toString()),
                    // ),
                    // Center(
                    //   child: IconButton(
                    //       icon: Icon(Icons.add_shopping_cart),
                    //       onPressed: () {
                    //         if (!globals.partner_name
                    //             .contains(displayList[index].partnerName)) {
                    //           globals.partner_name
                    //               .add(displayList[index].partnerName);
                    //           globals.reference.updateData({
                    //             'products.${displayList[index].partnerCategory}.${displayList[index].partnerIndex}.no_of_orders':
                    //                 FieldValue.increment(1)
                    //           });
                    //           globals.partner_list.add(displayList[index]);
                    //         }
                    //       }),
                    // ),
                    // Center(
                    //   child: IconButton(
                    //       icon: globals.favorite_name
                    //               .contains(displayList[index].partnerName)
                    //           ? Icon(Icons.favorite, color: Colors.red)
                    //           : Icon(Icons.favorite_border),
                    //       onPressed: () {
                    //         if (!globals.favorite_name
                    //             .contains(displayList[index].partnerName)) {
                    //           globals.favorite_name
                    //               .add(displayList[index].partnerName);
                    //           globals.user.updateData({
                    //             'favorites.${displayList[index].partnerName}.partnerCategory':
                    //                 displayList[index].partnerCategory,
                    //             'favorites.${displayList[index].partnerName}.partnerIndex':
                    //                 displayList[index].partnerIndex,
                    //             'favorites.${displayList[index].partnerName}.partnerImage':
                    //                 displayList[index].partnerImage,
                    //             'favorites.${displayList[index].partnerName}.partnerPrice':
                    //                 displayList[index].partnerPrice,
                    //             'favorites.${displayList[index].partnerName}.no_of_orders':
                    //                 displayList[index].no_of_orders
                    //           });
                    //         } else {
                    //           globals.favorite_name
                    //               .remove(displayList[index].partnerName);
                    //           globals.user.updateData({
                    //             'favorites.${displayList[index].partnerName}':
                    //                 FieldValue.delete()
                    //           });
                    //         }
                    //         setState(() {});
                    //       }),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return cards;
  }

  // ignore: non_constant_identifier_names
  List<Partner> displayList;

  _productList(AsyncSnapshot snapshot) {
    if (snapshot.data.data() == null) {
      doWeServePincode(globals.pincode);
      return;
    }
    _nearByShops = snapshot.data.data()['partners'];
    snapshot.data.data()['partners'].forEach((k, v) {
      Partner partner = new Partner(
          v['image_source'], v['name'], k, v['location'], 'kiryana');
      displayList.add(partner);
    });
  }

  void filterList() {
    if (globals.filter == 'Distance') {
      if (_userPos == null) return;
      displayList.sort((a, b) => distanceBetween(_userPos.latitude,
              _userPos.longitude, a.location.latitude, a.location.longitude)
          .compareTo(distanceBetween(_userPos.latitude, _userPos.longitude,
              b.location.latitude, b.location.longitude)));
    } else {
      // sort by popularity
      // currently, it's hardcoded to be sorted by distance
      // displayList.sort((b, a) => a.no_of_orders.compareTo(b.no_of_orders));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _stream,
      builder: (context, snapshot) {
        if (snapshot.hasError)
          return Center(
              child: Text("Check your internet connection and try again!"));
        if (!snapshot.hasData) return LinearProgressIndicator();
        return ListView(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          children: _generateCards(snapshot),
        );
      },
    );
  }
}
