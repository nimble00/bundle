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
      length: 2,
      child: Scaffold(
        appBar: TabBar(
          indicatorColor: Colors.black,
          labelColor: Colors.black,
          tabs: [
            Tab(
              text: "Add Products",
            ),
            Tab(
              text: "My Products",
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
            Icon(Icons.directions_transit)
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
