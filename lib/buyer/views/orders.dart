import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:flutter_app/buyer/models/item.dart';
import 'package:flutter_app/buyer/models/order.dart';
import 'package:flutter_app/buyer/views/cart.dart';

class Orders extends StatefulWidget {
  @override
  _OrdersState createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List<Order> ordersList;
  Widget _body;

  @override
  void initState() {
    super.initState();
    _body = _create();
  }

  void _orderList(AsyncSnapshot snapshot) {
    Map orders = snapshot.data['orders'];
    for (int i = 0; i < orders['numOrders']; i++) {
      addOrderFromDatabase(orders['details']['$i']);
    }
  }

  void addOrderFromDatabase(Map _order) {
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
          _order['items'][k]['numOrders'],
          _order['items'][k]['itemCategory'],
          _order['items'][k]['itemIndex']);
      order.item_list.add(item);
    });
    ordersList.add(order);
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
      globals.reference.update({
        '${order.item_list[i].itemCategory}.${order.item_list[i].itemIndex}.numOrders':
            FieldValue.increment(order.item_list[i].itemQun)
      });
    }
  }

  List<Card> _generateCards(AsyncSnapshot snapshot) {
    ordersList = new List();
    _orderList(snapshot);
    List<Card> cards = List.generate(
      ordersList.length,
      (int index) => Card(
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          title: Text(
            _orderDetails(ordersList[index]),
            style: TextStyle(
                fontStyle: FontStyle.italic, fontSize: 20.0, color: Colors.red),
          ),
          trailing: Text(ordersList[index].total.toString()),
          leading: RaisedButton(
            child: Text("Reorder"),
            onPressed: () {
              reorder(ordersList[index]);
              setState(() {
                _body = BuyerCartPage();
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
