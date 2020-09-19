import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/buyer/models/item.dart';
import 'package:flutter_app/buyer/models/order.dart';
import 'package:flutter_app/views/cart.dart';
import 'package:flutter_app/views/checkout.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order> orders_list;
  Widget _body;
  void initState() {
    _body = _create();
  }

  void _orderList(AsyncSnapshot snapshot) {
    Map orders = snapshot.data['orders'];
    for (int i = 0; i < orders['no_of_orders']; i++) {
      add_order_from_database(orders['details']['$i']);
    }
  }

  void add_order_from_database(Map _order) {
    Order order = new Order();
    order.item_list = new List();
    order.total = _order['total'];
    order.status = _order['status'];
    order.date = _order['date'];
    _order['items'].forEach((k, v) {
      Item item = new Item(
          _order['items'][k]['itemImage'],
          k,
          _order['items'][k]['itemQun'],
          _order['items'][k]['itemPrice'],
          _order['items'][k]['no_of_orders'],
          _order['items'][k]['itemCategory'],
          _order['items'][k]['itemIndex']);
      order.item_list.add(item);
    });
    orders_list.add(order);
  }

  String _orderDetails(Order order) {
    String details = "";
    for (int i = 0; i < order.item_list.length; i++) {
      details += "${order.item_list[i].itemQun}" +
          "x" +
          order.item_list[i].itemName +
          ", ";
    }
    return details;
  }

  void reorder(Order order) {
    globals.item_list = new List();
    for (int i = 0; i < order.item_list.length; i++) {
      globals.item_list.add(order.item_list[i]);
      globals.item_name.add(order.item_list[i].itemName);
      globals.reference.updateData({
        '${order.item_list[i].itemCategory}.${order.item_list[i].itemIndex}.no_of_orders':
            FieldValue.increment(order.item_list[i].itemQun)
      });
    }
  }

  List<Card> _generateCards(AsyncSnapshot snapshot) {
    orders_list = new List();
    _orderList(snapshot);
    List<Card> cards = List.generate(
      orders_list.length,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          title: Text(
            _orderDetails(orders_list[index]),
            style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: 20.0, color: Colors.red),
          ),
          trailing: Text(orders_list[index].total.toString()),
          leading: RaisedButton(
            child: Text("Reorder"),
            onPressed: () {
              reorder(orders_list[index]);
              setState(() {
                _body = CartPage();
              });
            },
          ),
        ),
      ),
    );
    return cards;
  }

  Widget _create() {
    return StreamBuilder<DocumentSnapshot>(
      stream: globals.user.snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        return ListView(
          children: _generateCards(snapshot),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.keyboard_backspace),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Orders',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _body,
    );
  }
}
