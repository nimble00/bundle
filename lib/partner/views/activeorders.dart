import 'package:flutter/material.dart';

class PartnerActiveOrders extends StatefulWidget {
  @override
  _PartnerActiveOrdersState createState() => _PartnerActiveOrdersState();
}

class _PartnerActiveOrdersState extends State<PartnerActiveOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          "I WILL IMPLEMENT CURRENT ACTIVE ORDERS HERE!!!",
          style: TextStyle(color: Colors.black),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
