class Item {
 String itemImage;
 String itemName;
 int itemQun; //taken by user
 double itemPrice;
 int no_of_orders;
 int selected;
 int in_stock;
Item(this.itemImage, this.itemName, this.itemQun, this.itemPrice,this.selected,this.no_of_orders);
// String itemDetail;
// Item({this.itemImage, this.itemName, this.itemQun=1, this.itemPrice,this.selected=false,this.no_of_orders=1,this.itemDetail=""});

void incrementQuantity() => itemQun+=1;
void decrementQuantity() => itemQun-=1;
}
