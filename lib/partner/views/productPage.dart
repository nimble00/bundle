import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/buyer/models/partner.dart';
import 'package:flutter_app/buyer/views/cart.dart';
// import 'package:flutter_app/globals.dart' as globals;
import 'package:toast/toast.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class ProductPage extends StatefulWidget {
  final List displayList;
  final int index;



  ProductPage({Key key, this.displayList, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      ProductPageState(displayList: displayList, index: index);
}

class ProductPageState extends State<ProductPage> {
  List displayList;
  int index;

  final _prizeController = TextEditingController();
  final _nameController=  TextEditingController();

  ProductPageState({this.displayList, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(displayList[index].name),
      ),
      body: _buildView(context, displayList, index),
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

  Widget _buildView(BuildContext context, List displayList, int index) {

    return Column(
       children: <Widget>[
         Image.asset(
           'assets/products/' +
               displayList[index].name.toString().replaceAll(' ', '-'),
           fit: BoxFit.scaleDown,
          ) ?? Icon(Icons.image
         ),
         SizedBox(height: 40),
         //NAME AND PRICE
         Column(
           children: <Widget>[
             Text(
               displayList[index].name,
             ),
             Spacer(),
             Row(
                 children: <Widget>[
                   Text(
                     "Change Name",
                   ),
                   Spacer(),
                   TextFormField(
                       controller: _nameController,
                       keyboardType: TextInputType.number,
                       inputFormatters: <TextInputFormatter>[
                         WhitelistingTextInputFormatter.digitsOnly
                       ],
                       decoration: InputDecoration(
//                           labelText:,
                           hintText: "optional",
                           icon: Icon(Icons.phone_iphone)
                       )
                   ),
                 ],
             )

           ],
         ),
         Spacer(),
         Row(
            children: <Widget>[
               TextField( //                       <--- TextField
                 onChanged: (text) {
                 },
               )
            ],
         ),
         Row(
           children: <Widget>[
             Container(
               child:Row(
                 children:<Widget>[
                   Text(
                       "Prize : "
                   ),
//                   new TextField(
////                     decoration: new InputDecoration(labelText: "Enter your number"),
//                     keyboardType: TextInputType.number,
//                     inputFormatters: <TextInputFormatter>[
//                       WhitelistingTextInputFormatter.digitsOnly
//                     ], // Only numbers can be entered
//                   ),
                    Spacer(),
                   TextFormField(
                       controller: _prizeController,
                       keyboardType: TextInputType.number,
                       inputFormatters: <TextInputFormatter>[
                         WhitelistingTextInputFormatter.digitsOnly
                       ],
                       decoration: InputDecoration(
                           labelText:"whatever you want",
                           hintText: "whatever you want",
                           icon: Icon(Icons.phone_iphone)
                       )
                   ),
                   Container(

                   ),
                 ],
               ),
             ),
           ],
         ),
         Spacer(),
         //DETAILS OF PRODUCT
         Container(
           padding: const EdgeInsets.all(32),
           child: Row(
             children: <Widget>[
               FlatButton(
                  child: Text('Save'),
                  onPressed: () {

                  }
               ),
               Spacer(),
               FlatButton(
                   child: Text('Cancel'),
                     onPressed: () {

                     }
               ),

             ],
           )
         ),
         Spacer(),
       ],
    );
  }

  void showToast() {
    Toast.show('Seems like u want to do somethig else :', context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }
}

//onPressed: () {
////                    itemList[ind].incrementQuantity();
//if (displayList[index].selected == false) {
//if (!globals.item_name
//    .contains(displayList[index])) {
//displayList[index].selected = true;
//globals.item_name.add(displayList[index]);
//globals.reference.updateData({
//'products.${displayList[index].itemCategory}.${displayList[index].itemIndex}.no_of_orders':
//FieldValue.increment(1)
//});
//globals.item_list.add(displayList[index]);
//}
//}
//},
