import 'package:flutter/material.dart';
import 'package:flutter_app/partner/views/customproduct.dart';

// I added android: ... = "true" in android/ap/src/main/AndroidManifest.xml
// to make 'imagepicker' backward compatible.

class PartnerAddProducts extends StatefulWidget {
  @override
  _PartnerAddProductsState createState() => _PartnerAddProductsState();
}

class _PartnerAddProductsState extends State<PartnerAddProducts> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.black,
          indicatorPadding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: "All",
            ),
            Tab(
              text: "Dairy and Bakery",
            ),
            Tab(
              text: "Personal Care",
            ),
            Tab(
              text: "Snacks and Drinks",
            ),
            Tab(
              text: "Kitchen Essentials",
            ),
            Tab(
              text: "Miscellaneous",
            ),
          ],
        ),
        body: TabBarView(
          children: [
            // Container(
            //   child: StreamBuilder(
            //     stream: Firestore.instance.collection('productList').snapshots(),
            //     builder: (context, snapshot) {
            //       if (!snapshot.hasData) {
            //         return Center(
            //           child: CircularProgressIndicator(
            //             valueColor: AlwaysStoppedAnimation<Color>(themeColor),
            //           ),
            //         );
            //       } else {
            //         return ListView.builder(
            //           padding: EdgeInsets.all(10.0),
            //           itemBuilder: (context, index) =>
            //               buildItem(context, snapshot.data.documents[index]),
            //           itemCount: snapshot.data.documents.length,
            //         );
            //       }
            //     },
            //   ),
            // ),
            Center(
              child: Text("IMPLEMENT THE LISTVIEW OF ALL THE PRODUCTS HERE!"),
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
          child: Icon(Icons.navigation),
          backgroundColor: Colors.green,
        ),
      ),
    );
  }
}
