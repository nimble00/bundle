import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:toast/toast.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class MyProductPage extends StatefulWidget {
  final List displayList;
  final int index;

  MyProductPage({Key key, this.displayList, this.index}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      MyProductPageState(displayList: displayList, index: index);
}

class MyProductPageState extends State<MyProductPage> {
  List displayList;
  int index;
  String isShow;
  DocumentReference docRef = globals.partner;
  // .collection("products").doc("productDoc");
  final _prizeController = TextEditingController();
  MyProductPageState({this.displayList, this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(displayList[index]["name"]),
      ),
      body: _buildView(context, displayList, index),
    );
  }

  Widget _buildView(BuildContext context, List displayList, int index) {
    isShow = displayList[index]["show"];
    return Column(
      children: <Widget>[
        Image.asset(
          displayList[index]["imageLoc"],
          fit: BoxFit.scaleDown,
        ),
//             ?? Icon(Icons.image),

        Column(
          children: <Widget>[
            Text(
              displayList[index]["name"].split('.').first,
            ),
//             Spacer(),
          ],
        ),
//         Spacer(),
        Row(
          children: <Widget>[
            Text("Wants to Update Price : "),
            Expanded(
              flex: 6,
              child: TextFormField(
                  controller: _prizeController,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    WhitelistingTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    labelText: "  " + displayList[index]["price"],
                    hintText: "Optional",
                  )),
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Text("  Avaibility : "),
            Expanded(
              flex: 4,
              child: LiteRollingSwitch(
                value: (isShow == "true") ? true : false,
                textOn: 'available',
                textOff: 'unavailable',
                colorOn: Colors.deepOrange,
                colorOff: Colors.blueGrey,
                iconOn: Icons.lightbulb_outline,
                iconOff: Icons.power_settings_new,
                onChanged: (bool state) {
                  print('turned ${(state) ? 'on' : 'off'}');
                  isShow = state ? 'true' : 'false';
                  if (state && displayList[index]["show"] == "false") {
                    delete(
                        displayList[index]["name"],
                        displayList[index]["price"],
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        "false");
                    add(
                        displayList[index]["name"],
                        displayList[index]["price"],
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        "true");
                  } else if (!state && displayList[index]["show"] == "true") {
                    delete(
                        displayList[index]["name"],
                        displayList[index]["price"],
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        "true");
                    add(
                        displayList[index]["name"],
                        displayList[index]["price"],
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        "false");
                  } else {
                    print("kuch alag hi ho raha he");
                  }
                },
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.all(32),
          child: Row(children: <Widget>[
            RaisedButton(
                child: Text('Update Price'),
                onPressed: (() {
                  if (_prizeController.text.length == 0) {
                    showToast("insert new price");
                  } else {
                    delete(
                        displayList[index]["name"],
                        displayList[index]["price"],
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        isShow);
                    add(
                        displayList[index]["name"],
                        _prizeController.text.toString(),
                        displayList[index]["imageLoc"],
                        displayList[index]["category"],
                        isShow);
                    displayList[index]["price"] =
                        _prizeController.text.toString();
                    print("success!");
                    showToast("product updated");
                    Navigator.pop(context);
                  }
                }))
          ]),
        ),
        Spacer(),
        FlatButton(
            child: Text('Delete'),
            onPressed: (() {
              docRef.update({
                "productList": FieldValue.arrayRemove([
                  {
                    'name': displayList[index]["name"],
                    'price': displayList[index]["price"],
                    'imageLoc': displayList[index]["imageLoc"],
                    "category": displayList[index]["category"]
                  }
                ])
              }).then((_) {
                print("success!");
                showToast("product deleted");
                Navigator.pop(context);
              });
            })),
      ],
    );
  }

  void showToast(msg) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
  }

  void delete(name, price, imageLoc, category, show) {
    docRef.update({
      "productList": FieldValue.arrayRemove([
        {
          'name': name,
          'price': price,
          'imageLoc': imageLoc,
          "category": category,
          "show": show
        }
      ])
    });
  }

  void add(name, price, imageLoc, category, show) {
    docRef.update({
      "productList": FieldValue.arrayUnion([
        {
          'name': name,
          'price': price,
          'imageLoc': imageLoc,
          "category": category,
          "show": show
        }
      ])
    });
  }
}
