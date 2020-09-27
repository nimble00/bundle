class Item {
  String itemImage;
  String itemName;
  int itemQun;
  int itemPrice;
  int numOrders;
  String itemCategory; //SPIRIT CATEGORY OF THE ITEM
  String itemIndex; //INDEX TO REFER TO THE PRODUCT MAP
  Item(
    this.itemImage,
    this.itemName,
    this.itemQun,
    this.itemPrice,
    this.numOrders,
    this.itemCategory,
    this.itemIndex,
  );
  void incrementQuantity() => itemQun += 1;
  void decrementQuantity() => itemQun -= 1;
}
