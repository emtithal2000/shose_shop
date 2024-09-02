class Products {
  String? image;
  String? name;
  String? price;

  Products({this.image, this.name, this.price});

  Products.fromJson(Map<String, dynamic> json) {
    image = json['Image'];
    name = json['Name'];
    price = json['Price'];
  }
}





// class ProductsModel {
//   Product0? product0;
//   Product0? product1;
//   Product0? product2;
//   Product0? product3;
//   Product0? product4;
//   Product0? product5;

//   ProductsModel(
//       {this.product0,
//       this.product1,
//       this.product2,
//       this.product3,
//       this.product4,
//       this.product5});

//   ProductsModel.fromJson(Map<String, dynamic> json) {
//     product0 =
//         json['Product0'] != null ? Product0.fromJson(json['Product0']) : null;
//     product1 =
//         json['Product1'] != null ? Product0.fromJson(json['Product1']) : null;
//     product2 =
//         json['Product2'] != null ? Product0.fromJson(json['Product2']) : null;
//     product3 =
//         json['Product3'] != null ? Product0.fromJson(json['Product3']) : null;
//     product4 =
//         json['Product4'] != null ? Product0.fromJson(json['Product4']) : null;
//     product5 =
//         json['Product5'] != null ? Product0.fromJson(json['Product5']) : null;
//   }
// }

// class Product0 {
//   String? image;
//   String? name;
//   String? price;

//   Product0({this.image, this.name, this.price});

//   Product0.fromJson(Map<String, dynamic> json) {
//     image = json['Image'];
//     name = json['Name'];
//     price = json['Price'];
//   }
// }
