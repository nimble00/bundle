import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        height: 10.0,
        color: Colors.grey,
      ),
      Container(
        color: Colors.grey,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: InkWell(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.0),
                color: Colors.white,
              ),
              child: ListTile(
                leading: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                title: Text(" Search for drinks....",
                    style: TextStyle(fontStyle: FontStyle.italic)),
              ),
            ),
            onTap: () {},
          ),
        ),
      ),
      Container(
          height: 30.0,
          decoration: BoxDecoration(
            color: Colors.blueGrey,
          )),
      Container(
          height: 75.0,
          color: Colors.grey,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("All"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Beer"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Rum"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Whiskey"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  ))),
              Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Center(
                      child: RaisedButton(
                    child: Text("Vodka"),
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {},
                  )))
            ],
          )),
      SizedBox(
        height: 10.0,
      ),
      Container(
          margin: EdgeInsets.all(4.0),
          decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: ListTile(
            title: Text(
              " Sort By:  Popularity",
              style: TextStyle(color: Colors.redAccent),
            ),
            trailing: IconButton(
              color: Colors.redAccent,
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
          )),
      Container(
          height: 300.0,
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              Card(
                  child: Column(
                children: [
                  AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset('assets/beer.jpg'),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Center(
                    child: Text("Budweiser"),
                  )
                ],
              )),
              Card(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 18.0 / 11.0,
                        child: Image.asset('assets/vodka.jpg'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text("Magic colors"),
                      )
                    ],
                  )),
              Card(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 18.0 / 11.0,
                        child: Image.asset('assets/whiskey.jpg'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text("Chill"),
                      )
                    ],
                  )),
              Card(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 18.0 / 11.0,
                        child: Image.asset('assets/champagne.jpg'),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Center(
                        child: Text("Madira"),
                      )
                    ],
                  )),
            ],
          ))
    ]);
  }
}
