import 'package:cloud_firestore/cloud_firestore.dart';

enum Category { all, snd, dnb, hhi, ke, pc, misc }

class Product {
  String name;
  Category category;
  double price;
  int id;
  DocumentReference reference;

  String getCategory() {
    switch (category) {
      case Category.dnb:
        return 'dnb';
      case Category.snd:
        return 'snd';
      case Category.hhi:
        return 'hhi';
      case Category.ke:
        return 'ke';
      case Category.pc:
        return 'pc';
      case Category.misc:
        return 'misc';
      case Category.all:
        return '';
        break;
    }
    return '';
  }

  Product({this.price, this.id, this.name, this.category});

  Product.fromMap(Map<String, Object> map, {this.reference})
      : assert(map['name'] != null),
        assert(map['id'] != null),
        assert(map['category'] != null),
        name = map['name'],
        id = map['id'],
        price = map['price'],
        category = map['category'];

  Product.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data(), reference: snapshot.reference);

  @override
  String toString() => "Product<$name:$price:$getCategory()>";
}
