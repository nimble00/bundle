import 'package:flutter/cupertino.dart';

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
  ]);
 }
}
