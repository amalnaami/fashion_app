class Product {
  String name;
  String price;
  String description;
  String departId;
  String imageUrl;
  String productId;
  Product(this.description, this.imageUrl,
      this.departId, this.name, this.price,this.productId);
  Product.fromMap(Map map) {
    this.name = map['productName'];
    this.price = map['productPrice'];
    this.description = map['productDescription'];
    this.imageUrl = map['imageUrl'];
    this.productId = map['productId'];
    this.departId = map['departId'];
  }
}
