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
  bool pinCheck;
  Position userPos;
  Map nearByShops;
  @override
  void initState() {
    super.initState();
    userPos = globals.position;
    pinCheck = doWeServePincode(globals.pincode);
    print('bbusinesses.dart: here outside async');
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
          this.nearByShops = documentSnapshot.data()['partner_list'];
          return true;
        }
        return false;
      });
    } catch (e) {
      return false;
    }
  }

  _generateCards(AsyncSnapshot snapshot) {
    // if (!pinCheck) {
    //   return Center(
    //     child: Text("We don't serve your location yet!"),
    //   );
    // }
    display_list = new List();
    _productList(snapshot);
    filterList();
    List<Card> cards = List.generate(
      display_list.length,
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
                              display_list: display_list[index],
                              index: index))),
                  // child: Image.asset(display_list[index].image),
                  child: Icon(Icons.image),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(display_list[index].name),
                    ),
                    Center(
                      child: Text(display_list[index].phone),
                    ),
                    // Center(
                    //   child:
                    //       Text((display_list[index].partnerPrice).toString()),
                    // ),
                    // Center(
                    //   child: IconButton(
                    //       icon: Icon(Icons.add_shopping_cart),
                    //       onPressed: () {
                    //         if (!globals.partner_name
                    //             .contains(display_list[index].partnerName)) {
                    //           globals.partner_name
                    //               .add(display_list[index].partnerName);
                    //           globals.reference.updateData({
                    //             'products.${display_list[index].partnerCategory}.${display_list[index].partnerIndex}.no_of_orders':
                    //                 FieldValue.increment(1)
                    //           });
                    //           globals.partner_list.add(display_list[index]);
                    //         }
                    //       }),
                    // ),
                    // Center(
                    //   child: IconButton(
                    //       icon: globals.favorite_name
                    //               .contains(display_list[index].partnerName)
                    //           ? Icon(Icons.favorite, color: Colors.red)
                    //           : Icon(Icons.favorite_border),
                    //       onPressed: () {
                    //         if (!globals.favorite_name
                    //             .contains(display_list[index].partnerName)) {
                    //           globals.favorite_name
                    //               .add(display_list[index].partnerName);
                    //           globals.user.updateData({
                    //             'favorites.${display_list[index].partnerName}.partnerCategory':
                    //                 display_list[index].partnerCategory,
                    //             'favorites.${display_list[index].partnerName}.partnerIndex':
                    //                 display_list[index].partnerIndex,
                    //             'favorites.${display_list[index].partnerName}.partnerImage':
                    //                 display_list[index].partnerImage,
                    //             'favorites.${display_list[index].partnerName}.partnerPrice':
                    //                 display_list[index].partnerPrice,
                    //             'favorites.${display_list[index].partnerName}.no_of_orders':
                    //                 display_list[index].no_of_orders
                    //           });
                    //         } else {
                    //           globals.favorite_name
                    //               .remove(display_list[index].partnerName);
                    //           globals.user.updateData({
                    //             'favorites.${display_list[index].partnerName}':
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
  List<Partner> display_list;

  _productList(AsyncSnapshot snapshot) {
    nearByShops = snapshot.data.data()['partner_list'];
    snapshot.data.data()['partner_list'].forEach((k, v) {
      Partner partner = new Partner(
          v['image_source'], v['name'], k, v['location'], 'kiryana');
      display_list.add(partner);
    });
  }

  void filterList() {
    if (globals.filter == 'Distance') {
      display_list.sort((a, b) => distanceBetween(userPos.latitude,
              userPos.longitude, a.location.latitude, a.location.longitude)
          .compareTo(distanceBetween(userPos.latitude, userPos.longitude,
              b.location.latitude, b.location.longitude)));
    } else {
      // sort by popularity
      // currently, it's hardcoded to be sorted by distance
      // display_list.sort((b, a) => a.no_of_orders.compareTo(b.no_of_orders));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('pincodes')
          .doc(globals.pincode)
          .collection('retail_partners')
          .doc('partners')
          .snapshots(),
      builder: (context, snapshot) {
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
