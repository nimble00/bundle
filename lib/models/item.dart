import 'package:flutter/cupertino.dart';

class Item {
 String itemImage;
 String itemName;
 int itemQun;
 int itemPrice;
 int no_of_orders;
 bool selected;
 int in_stock;
 String itemCategory; //SPIRIT CATEGORY OF THE ITEM
 String itemIndex; //INDEX TO REFER TO THE PRODUCT MAP
 int index; //INDEX TO REFER TO DISPLAY LIST
Item(this.itemImage, this.itemName, this.itemQun, this.itemPrice,this.selected,this.no_of_orders,this.itemCategory,this.itemIndex,this.index);
void incrementQuantity() => itemQun+=1;
void decrementQuantity() => itemQun-=1;
}