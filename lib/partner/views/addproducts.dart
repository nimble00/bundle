import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/partner/models/product.dart';
import 'package:flutter_app/partner/models/product_repo.dart';

import 'package:flutter_app/partner/views/customproduct.dart';
import 'package:flutter_app/partner/views/productPage.dart';

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

  _buildGridCards(BuildContext context, Category category) {
    var displayList = ProductsRepository.loadProducts(category);
    List<Card> cards = List.generate(
      displayList.length,
      (int i) => Card(
        elevation: 8.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductPage(displayList: displayList,index: i),
                    ),
                  );
                }, // handle your image tap here
                child: Image.asset(
                  'assets/products/' +
                      displayList[i].name.toString().replaceAll(' ', '-'),
                  fit: BoxFit.scaleDown,
                ) ?? Icon(Icons.image),
              ),
              Center(
                child: Text(
                  displayList[i].name.split('.').first,
                ),
              ),
            ],
      ),

        //     // Padding(
        //     //   padding: EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 2.0),
        //     //   child: Center(
        //     //     child: Column(
        //     //       crossAxisAlignment: CrossAxisAlignment.start,
        //     //       children: <Widget>[
        //     //         Center(
        //     //           child: Text(displayList[i].name),
        //     //         ),
        //     //         Center(
        //     //           child: Text(displayList[i].getCategory()),
        //     //         ),
        //     //         // Center(
        //     //         //   child: IconButton(
        //     //         //       icon: Icon(Icons.add_shopping_cart),
        //     //         //       onPressed: () {
        //     //         //         if (!globals.partner_name
        //     //         //             .contains(displayList[i].partnerName)) {
        //     //         //           globals.partner_name
        //     //         //               .add(displayList[i].partnerName);
        //     //         //           globals.reference.updateData({
        //     //         //             'products.${displayList[i].partnerCategory}.${displayList[i].partneri}.no_of_orders':
        //     //         //                 FieldValue.increment(1)
        //     //         //           });
        //     //         //           globals.partner_list.add(displayList[i]);
        //     //         //         }
        //     //         //       }),
        //     //         // ),
        //     //         // Center(
        //     //         //   child: IconButton(
        //     //         //       icon: globals.favorite_name
        //     //         //               .contains(displayList[i].partnerName)
        //     //         //           ? Icon(Icons.favorite, color: Colors.red)
        //     //         //           : Icon(Icons.favorite_border),
        //     //         //       onPressed: () {
        //     //         //         if (!globals.favorite_name
        //     //         //             .contains(displayList[i].partnerName)) {
        //     //         //           globals.favorite_name
        //     //         //               .add(displayList[i].partnerName);
        //     //         //           globals.user.updateData({
        //     //         //             'favorites.${displayList[i].partnerName}.partnerCategory':
        //     //         //                 displayList[i].partnerCategory,
        //     //         //             'favorites.${displayList[i].partnerName}.partneri':
        //     //         //                 displayList[i].partneri,
        //     //         //             'favorites.${displayList[i].partnerName}.partnerImage':
        //     //         //                 displayList[i].partnerImage,
        //     //         //             'favorites.${displayList[i].partnerName}.partnerPrice':
        //     //         //                 displayList[i].partnerPrice,
        //     //         //             'favorites.${displayList[i].partnerName}.no_of_orders':
        //     //         //                 displayList[i].no_of_orders
        //     //         //           });
        //     //         //         } else {
        //     //         //           globals.favorite_name
        //     //         //               .remove(displayList[i].partnerName);
        //     //         //           globals.user.updateData({
        //     //         //             'favorites.${displayList[i].partnerName}':
        //     //         //                 FieldValue.delete()
        //     //         //           });
        //     //         //         }
        //     //         //         setState(() {});
        //     //         //       }),
        //     //         // )
        //     //       ],
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // ),
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
              children: _buildGridCards(context, Category.all),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.dnb),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.pc),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.snd),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.ke),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.hhi),
            ),
            GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16.0),
              childAspectRatio: 8.0 / 9.0,
              children: _buildGridCards(context, Category.misc),
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
