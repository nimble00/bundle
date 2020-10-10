import 'package:flutter/material.dart';
import 'package:flutter_app/buyer/models/partner.dart';
import 'package:flutter_app/buyer/views/cart.dart';
// import 'package:flutter_app/globals.dart' as globals;
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class SpiritPage extends StatefulWidget {
  final Partner displayList;
  final int index;

  SpiritPage({Key key, this.displayList, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      SpiritState(displayList: displayList, index: index);
}

class SpiritState extends State<SpiritPage> {
  Partner displayList;
  int index;
  SpiritState({this.displayList, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(displayList.name),
      ),
      body: _buildView(context, displayList, index),
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
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BuyerCartPage())),
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

  Widget _buildView(BuildContext context, Partner displayList, int index) {
    return Column(
//       children: <Widget>[
//         Image.asset(
//           displayList.image,
//           height: 240,
//         ),
//         SizedBox(height: 40),
//         //NAME AND PRICE
//         Row(
//           children: <Widget>[
//             Spacer(),
//             Text(
//               displayList[index],
//             ),
//             Spacer(),
//             Text(
//               displayList[index].itemPrice.toString(),
//             ),
//             Spacer(),
//           ],
//         ),
//         //QUANTITY AND PRICE
//         Container(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [
//               Container(
//                 child: Row(
//                   children: <Widget>[
//                     new IconButton(
//                       icon: Icon(Icons.add_circle),
//                       onPressed: () {
//                         displayList[index].incrementQuantity();
//                         print(displayList[index].itemQun);
//                         setState(() {});
//                       },
//                     ),
// //                    Spacer(),
//                     Text(
//                       '${(displayList[index].itemQun).toString()}',
// //                  '${(itemList[ind].itemQun).toString()}',
//                     ),
// //                    Spacer(),
//                     new IconButton(
//                       icon: Icon(Icons.remove_circle),
//                       onPressed: () {
//                         if (displayList[index].itemQun > 1) {
//                           displayList[index].decrementQuantity();
//                           print(displayList[index].itemQun);
//                           setState(() {});
//                         } else {
//                           showToast();
//                           print("toast was here");
//                         }
//                         //ADD SOMETHING SIMILAR TO SETSTATE
//                       },
//                     ),
//                     Spacer(),
//                     IconButton(
//                       icon: Icon(Icons.add_shopping_cart),
//                       onPressed: () {
// //                    itemList[ind].incrementQuantity();
//                         if (displayList[index].selected == false) {
//                           if (!globals.item_name
//                               .contains(displayList[index])) {
//                             displayList[index].selected = true;
//                             globals.item_name.add(displayList[index]);
//                             globals.reference.updateData({
//                               'products.${displayList[index].itemCategory}.${displayList[index].itemIndex}.no_of_orders':
//                                   FieldValue.increment(1)
//                             });
//                             globals.item_list.add(displayList[index]);
//                           }
//                         }
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         //DETAILS OF PRODUCT
//         Container(
//           padding: const EdgeInsets.all(32),
//           child: Text(
//             "displayList[index].Detail",
//             softWrap: true,
//           ),
//         ),
//       ],
        );
  }

//  void showToast(){
//    Fluttertoast.showToast(
//        msg: "Seems like u want to do somethig else :)",
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
////        backgroundColor: Colors.grey,
//        textColor: Colors.black,
//        fontSize: 16.0
//    );
//  }
  void showToast() {
    Toast.show('Seems like u want to do somethig else :', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }
}
