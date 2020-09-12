import 'package:flutter/material.dart';

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
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit)
          ],
        ),
      ),
    );
  }
}
