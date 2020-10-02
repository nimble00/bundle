import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageApi extends StatefulWidget {
  @override
  _StorageApiState createState() => _StorageApiState();
}

class _StorageApiState extends State<StorageApi> {
  FirebaseStorage storage;
  List<Reference> productCategories;
  @override
  void initState() {
    super.initState();
    storage = FirebaseStorage.instance;
    storage.ref('products').listAll().then((value) {
      productCategories = value.items;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
