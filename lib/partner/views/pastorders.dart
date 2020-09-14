import 'package:flutter/material.dart';

class PartnerPastOrders extends StatefulWidget {
  @override
  _PartnerPastOrdersState createState() => _PartnerPastOrdersState();
}

class _PartnerPastOrdersState extends State<PartnerPastOrders> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(
          flex: 1,
        ),
        Text(
          "RAVI WILL IMPLEMENT PAST ORDERS LIST HERE!!!",
          style: TextStyle(color: Colors.black),
        ),
        Spacer(
          flex: 2,
        ),
      ],
    );
  }
}
