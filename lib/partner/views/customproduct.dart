import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PartnerCustomProduct extends StatefulWidget {
  @override
  _PartnerCustomProductState createState() => _PartnerCustomProductState();
}

class _PartnerCustomProductState extends State<PartnerCustomProduct> {
  File _image;
  final picker = ImagePicker();
  TextEditingController size;
  TextEditingController price;
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen,
          title: Text(
            'Add New Product',
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: double.infinity,
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
              RaisedButton(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 80),
                color: Colors.lightGreen,
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    side: BorderSide(color: Colors.white)),
                onPressed: getImage,
                // tooltip: 'Pick Image',
                child: Icon(
                  Icons.add_a_photo,
                  size: 80,
                ),
              ),
            ],
          ),
        ));
  }
}
