import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/buyer/models/partner.dart';
import 'package:flutter_app/buyer/views/cart.dart';
 import 'package:flutter_app/globals.dart' as globals;
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


  Widget _buildView(BuildContext context, List displayList, int index) {
    return Column(
       children: <Widget>[
         Image.asset(
           'assets/products/' +
               displayList[index].name.toString().replaceAll(' ', '-'),
           fit: BoxFit.scaleDown,
          ),
//             ?? Icon(Icons.image),
//         SizedBox(height: 40),
         //NAME AND PRICE
         Column(
           children: <Widget>[
             Text(
               displayList[index].name,
             ),
//             Spacer(),
             Row(
                 children: <Widget>[
                   Expanded(
                     flex:3,
                       child:Text(
                       "Change Name",
                     ),
                   ),
//                   Spacer(),

                    Expanded(
                      flex:6,
                      child:TextFormField(
                         controller: _nameController,
                         decoration: InputDecoration(
                             labelText:"optional",
                             hintText: displayList[index].name.split('.').first,
                         )
                      ),
                    ),
                 ],
             )

           ],
         ),
//         Spacer(),
         Row(
             children:<Widget>[
               Text(
                   "Price : "
               ),
             Expanded(
               flex:6,
               child: TextFormField(
                     controller: _prizeController,
                     keyboardType: TextInputType.number,
                     inputFormatters: <TextInputFormatter>[
                       WhitelistingTextInputFormatter.digitsOnly
                     ],
                     decoration: InputDecoration(
                         labelText:"your Price",
                         hintText: "your Price",
                         icon: Icon(Icons.phone_iphone)
                     )
                 ),
              ),
             ],
           ),
//         Spacer(),
         //DETAILS OF PRODUCT
         Container(
           padding: const EdgeInsets.all(32),
           child: Row(
             children: <Widget>[
               RaisedButton(
                  child: Text('ADD'),
                  onPressed: (() {
                    String pname=(_nameController.text.length>0)?_nameController.text:displayList[index].name.toString().split('.').first;
                    DocumentReference docRef= globals.partner.collection("products").doc("productDoc");
//                    globals.partner.collection("products").limit(1).get().then((docSnapshot){
//                      if(docSnapshot.size>0){
//                         docRef = globals.partner.collection("products").doc("productDoc");
//                        }
//                    });
                    docRef.update({
                      "productList" : FieldValue.arrayUnion([{'name':pname, 'price': _prizeController.text,
                        'imageLoc':'assets/products/' + displayList[index].name.toString().replaceAll(' ', '-'),"category":displayList[index].category.toString(),"show":"true" }])
                    }).then((_) {
                      print("success!");
                      showToast("product added");
                      Navigator.pop(context);
                    });
                  }),

//                    globals.partner.set({'products': 'JISPE SLIDER BUTTON ON KIA'}, SetOptions(merge: true))
//                        .then((_){
//
//                    }) ;

               ),
               Spacer(),
               FlatButton(
                   child: Text('Cancel'),
                     onPressed: () {
                        Navigator.pop(context);
                     }
               ),

             ],
           )
         ),
//         Spacer(),
       ],
    );
  }

  void showToast(msg) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }
}
