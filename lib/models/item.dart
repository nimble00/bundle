class Item {
<<<<<<< HEAD

=======
  String itemImage;
  String itemName;
  int itemQun;
  int itemPrice;
  int no_of_orders;
  bool selected;
  int in_stock;
  String itemCategory; //SPIRIT CATEGORY OF THE ITEM
  String itemIndex; //INDEX TO REFER TO THE PRODUCT MAP
  Item(
      this.itemImage,
      this.itemName,
      this.itemQun,
      this.itemPrice,
      this.selected,
      this.no_of_orders,
      this.itemCategory,
      this.itemIndex,
      );
  void incrementQuantity() => itemQun += 1;
  void decrementQuantity() => itemQun -= 1;
>>>>>>> 3c7d08345223dd8c3a927a4c31340f194e43d10d
}
