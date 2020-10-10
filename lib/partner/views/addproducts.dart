import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/partner/views/customproduct.dart';

// I added android: ... = "true" in android/ap/src/main/AndroidManifest.xml
// to make 'imagepicker' backward compatible.

class PartnerAddProducts extends StatefulWidget {
  @override
  _PartnerAddProductsState createState() => _PartnerAddProductsState();
}

class _PartnerAddProductsState extends State<PartnerAddProducts> {
  List<Text> list = [];
  bool loaded = false;
  FirebaseStorage storage;
  FirebaseFirestore firestore;
  List allProducts = [];
  List snackAndDrinks;
  List kitchenEssentials;
  List dairyAndBakery;
  List householdItems;
  List personalCare;
  List miscellaneous;

  @override
  void initState() {
    super.initState();
    firestore = FirebaseFirestore.instance;
    // storage = FirebaseStorage.instance;
    // _getStorageReferences();
  }

  // A FUNC. TO COMMUNINCATE WITH FIREBASE STORAGE
  // NO LONGER IN USE, MAY BECOME USEFUL IN FUTURE
  // _getStorageReferences() {
  //   storage.ref('/products').listAll().then((value) {
  //     allProducts = value.items;
  //   });
  //   storage.ref('/products/dairy and bakery').listAll().then((value) {
  //     dairyAndBakery = value.items;
  //     print("adding dnb");
  //     allProducts.addAll(value.items);

  //     dairyAndBakery.forEach((element) {
  //       firestore
  //           .collection("products")
  //           .doc("all")
  //           .update({
  //             '${element.name}': {"category": "DNB", "path": element.fullPath}
  //           })
  //           .then((value) => print("element Added"))
  //           .catchError((error) => print("Failed to add element: $error"));
  //       print(element.toString() + " :::: " + element.fullPath);
  //     });
  //     setState(() {
  //       loaded = true;
  //     });
  //   });
  //   storage.ref('/products/home care').listAll().then((value) {
  //     householdItems = value.items;
  //     print("adding hhi");
  //     allProducts.addAll(value.items);
  //   });
  //   storage.ref('/products/kitchen essentials').listAll().then((value) {
  //     kitchenEssentials = value.items;
  //     print("adding ke");
  //     allProducts.addAll(value.items);
  //   });
  //   storage.ref('/products/personal care').listAll().then((value) {
  //     personalCare = value.items;
  //     print("adding pe");
  //     allProducts.addAll(value.items);
  //   });
  //   storage.ref('/products/snacks and drinks').listAll().then((value) {
  //     snackAndDrinks = value.items;
  //     print("adding snd");
  //     allProducts.addAll(value.items);
  //   });
  //   storage.ref('/products/miscellaneous').listAll().then((value) {
  //     miscellaneous = value.items;
  //     print("adding misc");
  //     allProducts.addAll(value.items);
  //   }
  // }

  _buildGridCards() {
    // if (!_pinCheck) {
    //   return Center(
    //     child: Text("We don't serve your location yet!"),
    //   );
    // }
    var displayList = new List();
    List<Card> cards = List.generate(
      displayList.length,
      (int index) => Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 40.0 / 11.0,
              child: Image.asset(displayList[index].image),
              // child: Icon(Icons.image),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Text(displayList[index].name),
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: TabBar(
          isScrollable: true,
          indicatorWeight: 1,
          indicatorColor: Colors.black54,
          labelColor: Colors.white,
          labelPadding: EdgeInsets.all(0),
          unselectedLabelColor: Colors.black54,
          tabs: [
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "All",
              ),
              width: 100,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Snacks and Drinks",
              ),
              width: 160,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Dairy and Bakery",
              ),
              width: 150,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Personal Care",
              ),
              width: 130,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Kitchen Essentials",
              ),
              width: 170,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Household Items",
              ),
              width: 150,
            ),
            Container(
              color: Colors.green[400],
              child: Tab(
                text: "Miscellaneous",
              ),
              width: 130,
            ),
          ],
        ),
        body: TabBarView(
          children: [
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF DnB PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF PC PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF SnD PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF K.E PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF HHI PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF Misc. PRODUCTS HERE!"),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PartnerCustomProduct(),
              ),
            );
          },
          elevation: 20,
          child: Icon(
            Icons.add_circle,
            color: Colors.black38,
            size: 40,
          ),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
