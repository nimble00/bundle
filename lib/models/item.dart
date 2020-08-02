class Item {
 String itemImage;
 String itemName;
 int itemQun;
 double itemPrice;
 int no_of_orders;
 int selected;
 int in_stock;
Item(this.itemImage, this.itemName, this.itemQun, this.itemPrice,this.selected,this.no_of_orders);
void incrementQuantity() => itemQun+=1;
void decrementQuantity() => itemQun-=1;
}