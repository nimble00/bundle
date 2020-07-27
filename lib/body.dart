import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
 Widget build(BuildContext context) {
  return ListView(children: <Widget>[
   SizedBox(height: 20.0,),
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
     Container(
      height: 75.0,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
       children: <Widget>[
        Container(
         height: 50.0,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('assets/vodka.jpg'))),
        ),
        Text(
         'Vodka',
         style: TextStyle(fontFamily: 'Quicksand'),
        )
       ],
      ),
     ),
     Container(
      height: 75.0,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
       children: <Widget>[
        Container(
         height: 50.0,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('assets/whiskey.jpg'))),
        ),
        Text(
         'Whiskey',
         style: TextStyle(fontFamily: 'Quicksand'),
        )
       ],
      ),
     ),
     Container(
      height: 75.0,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
       children: <Widget>[
        Container(
         height: 50.0,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('assets/beer.jpg'))),
        ),
        Text(
         'Beer',
         style: TextStyle(fontFamily: 'Quicksand'),
        ),
       ],
      ),
     ),
     Container(
      height: 75.0,
      width: MediaQuery.of(context).size.width / 4,
      child: Column(
       children: <Widget>[
        Container(
         height: 50.0,
         decoration: BoxDecoration(
             image: DecorationImage(
                 image: AssetImage('assets/champagne.jpg'))),
        ),
        Text(
         'Champagne',
         style: TextStyle(fontFamily: 'Quicksand'),
        ),
       ],
      ),
     )
    ],
   ),
   SizedBox(
    height:20.0,
   ),
   Container(
    height: 150.0,
    width: double.infinity,
    color:Colors.white,
    child: Padding(
     padding:EdgeInsets.all(10.0),
         child:
         Row(
       children: <Widget>[
        Container(
         height: 75.0,
         width: 385.0,
         decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
        child: Text("Trending"),
        )
        ),
       ]
   )
    ),
   ),
   Container(
       height: 300.0,
       child:
       Row(
       children: [
        SizedBox(
        width: 10.0,
     ),
        Container(
         height:300.0,
         width:150.0,
         color: Colors.blueGrey,
         child:Center(
          child:
          Text("Offers"),
         ),
        ),
        SizedBox(
         width: 90.0,
        ),
        Container(
         height:300.0,
         width:150.0,
         color: Colors.blueGrey,
         child:Center(
          child:
          Text("Recommends"),
         ),
        )
    ],
   )
   ),
  ]);

 }
}
