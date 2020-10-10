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
            ListView.builder(
              itemBuilder: (context, index) {
                if (!loaded) return LinearProgressIndicator();
                allProducts.forEach((element) {
                  list.add(Text(element.name));
                });

                return ListView(
                  physics: const ScrollPhysics(),
                  shrinkWrap: true,
                  children: list,
                );
              },
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF DnB PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF Pcare PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF SnD PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF K.E THE PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF Misc. THE PRODUCTS HERE!"),
            ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF Misc. THE PRODUCTS HERE!"),
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
