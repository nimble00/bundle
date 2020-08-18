import 'package:flutter/material.dart';
import 'package:flutter_app/views/body.dart';
import 'package:flutter_app/views/cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app/models/item.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:fluttertoast/fluttertoast.dart';

class SpiritPage extends StatefulWidget {
  final List display_list;
  final int index;

  SpiritPage({Key key, this.display_list, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() => SpiritState(display_list:display_list, index:index);
}

class SpiritState extends State<SpiritPage>{
  List display_list;
  int index;
  SpiritState({this.display_list, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text("Address"),
        actions: [
          IconButton(
            icon: globals.favorite_name
                .contains(display_list[index].itemName)
                ?Icon(Icons.favorite,color : Colors.red)
                :Icon(Icons.favorite_border),
              onPressed: () {
                if (!globals.favorite_name
                    .contains(display_list[index].itemName)) {
                  globals.favorite_name
                      .add(display_list[index].itemName);
                  Firestore.instance
                      .collection('users')
                      .document(globals.phoneNumber)
                      .updateData({
                    'favorites.${display_list[index].itemName}.itemCategory':
                    display_list[index].itemCategory,
                    'favorites.${display_list[index].itemName}.itemIndex':
                    display_list[index].itemIndex,
                    'favorites.${display_list[index].itemName}.itemImage':
                    display_list[index].itemImage,
                    'favorites.${display_list[index].itemName}.itemPrice':
                    display_list[index].itemPrice,
                    'favorites.${display_list[index].itemName}.no_of_orders':
                    display_list[index].no_of_orders
                  });
                } else {
                  globals.favorite_name
                      .remove(display_list[index].itemName);
                  Firestore.instance
                      .collection('users')
                      .document(globals.phoneNumber)
                      .updateData({
                    'favorites.${display_list[index].itemName}':
                    FieldValue.delete()
                  });
                }
                setState(() {});
              }),
        ],
      ),
      body: _buildView(context,display_list,index),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Container(
            child: Icon(Icons.home, color: Colors.grey),
            // title: Text('Home'),
            // backgroundColor:
            //     isTapped() ? Colors.lightBlueAccent : Colors.blueGrey,
          ),
          Container(
            child: Icon(Icons.add_circle_outline, color: Colors.grey),

            // title: Text('Extras'),
          ),
          Container(
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
                semanticLabel: 'cart',
              ),
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage())),
            ),
          ),
          Container(
            // icon: Icon(Icons.account_box, color: Colors.grey),
            child: FlatButton(
              onPressed: () {},
              child: Text('Account'),
            ),
          ),
        ],
        // currentIndex: _selectedIndex,
        // selectedItemColor: Colors.amber[800],
        // onTap: _onItemTapped,
      ),
    );
  }

//  Widget _buildBody(BuildContext context) {
//    return StreamBuilder<DocumentSnapshot>(
//      stream: Firestore.instance
//          .collection('products')
//          .document('3TLHwpIwrTt2UrygHLEs')
//          .snapshots(),
//      builder: (context, snapshot) {
//        if (!snapshot.hasData) return LinearProgressIndicator();
//        Product p = new Product(snapshot.data['Image'], snapshot.data['Name'],
//            1, snapshot.data['Price'].toString(), snapshot.data['Detail']);
//        return _buildView(context, p);
//      },
//    );
//  }

  Widget _buildView(BuildContext context,List display_list, int index) {
    return Column(
      children: <Widget>[
        Image.asset(
          display_list[index].itemImage,
          height: 240,
        ),
        SizedBox(height: 40),
        //NAME AND PRICE
        Row(
          children: <Widget>[
            Spacer(),
            Text(
              display_list[index].itemName,
            ),
            Spacer(),
            Text(
              display_list[index].itemPrice.toString(),
            ),
            Spacer(),
          ],
        ),
        //QUANTITY AND PRICE
        Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                child: Row(
                  children: <Widget>[
                    new IconButton(
                      icon: Icon(Icons.add_circle),
                      onPressed: () {
                        display_list[index].incrementQuantity();
                        print(display_list[index].itemQun);
                        setState(() {});
                      },
                    ),
//                    Spacer(),
                    Text(
                      '${(display_list[index].itemQun).toString()}',
//                  '${(itemList[ind].itemQun).toString()}',
                    ),
//                    Spacer(),
                    new IconButton(
                      icon: Icon(Icons.remove_circle),
                      onPressed: () {

                        if(display_list[index].itemQun>1){
                            display_list[index].decrementQuantity();
                        print(display_list[index].itemQun);
                        setState(() {});
                        }else{
                          showToast();
                        }
                      //ADD SOMETHING SIMILAR TO SETSTATE
                      },
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.add_shopping_cart),
                      onPressed: () {
//                    itemList[ind].incrementQuantity();
                        if (display_list[index].selected == false) {
                          if (!globals.item_name
                              .contains(display_list[index].itemName)) {
                            display_list[index].selected = true;
                            globals.item_name
                                .add(display_list[index].itemName);
                            globals.reference.updateData({
                              'products.${display_list[index].itemCategory}.${display_list[index].itemIndex}.no_of_orders':
                              FieldValue.increment(1)
                            });
                            globals.item_list.add(display_list[index]);
                          }
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //DETAILS OF PRODUCT
        Container(
          padding: const EdgeInsets.all(32),
          child: Text(
            "display_list[index].Detail",
            softWrap: true,
          ),
        ),
      ],
    );
  }
  void showToast(){
    Fluttertoast.showToast(
        msg: "Seems like u want to do somethig else :)",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
//        backgroundColor: Colors.grey,
        textColor: Colors.black,
        fontSize: 16.0
    );
  }

}
