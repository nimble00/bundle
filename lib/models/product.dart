class Product {
  String Name;
  String Image;
  String Price;
  int Qun;
  String Detail;
  Product(this.Name, this.Image, this.Qun, this.Price, this.Detail);
  void incrementQuantity() => Qun += 1;
  void decrementQuantity() => Qun -= 1;
}
