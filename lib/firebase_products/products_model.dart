class ProductsDetails {
  String? image;
  String? name;
  String? price;

  ProductsDetails({this.image, this.name, this.price});

  ProductsDetails.fromJson(Map<String, dynamic> json) {
    image = json['Image'];
    name = json['Name'];
    price = json['Price'];
  }
}
