import 'dart:convert';

import 'package:get/get.dart';

/*
CartsItems itemsFromJson(String str) => CartsItems.fromJson(json.decode(str));
String itemsToJson(CartsItems data) => json.encode(data.toJson());
class CartsItems {
  CartsItems({
      String? productUid, 
      String? productName, 
      String? productImageUid, 
      String? productImage, 
      String? productSizeUid, 
      String? productSizeName, 
      String? productColorUid, 
      String? productColorImage, 
      int? quantity,
    double? price,
    double? totalPrice,
      String? addedAt,}){
    _productUid = productUid;
    _productName = productName;
    _productImageUid = productImageUid;
    _productImage = productImage;
    _productSizeUid = productSizeUid;
    _productSizeName = productSizeName;
    _productColorUid = productColorUid;
    _productColorImage = productColorImage;
    _quantity = quantity;
    _price = price;
    _totalPrice = totalPrice;
    _addedAt = addedAt;
}

  CartsItems.fromJson(dynamic json) {
    _productUid = json['product_uid'];
    _productName = json['product_name'];
    _productImageUid = json['product_image_uid'];
    _productImage = json['product_image'];
    _productSizeUid = json['product_size_uid'];
    _productSizeName = json['product_size_name'];
    _productColorUid = json['product_color_uid'];
    _productColorImage = json['product_color_image'];
    _quantity = json['quantity'];
    _price = json['price'];
    _totalPrice = json['total_price'];
    _addedAt = json['added_at'];
  }
  String? _productUid;
  String? _productName;
  String? _productImageUid;
  String? _productImage;
  String? _productSizeUid;
  String? _productSizeName;
  String? _productColorUid;
  String? _productColorImage;
  int? _quantity;
  double? _price;
  double? _totalPrice;
  String? _addedAt;
CartsItems copyWith({  String? productUid,
  String? productName,
  String? productImageUid,
  String? productImage,
  String? productSizeUid,
  String? productSizeName,
  String? productColorUid,
  String? productColorImage,
  int? quantity,
  double? price,
  double? totalPrice,
  String? addedAt,
}) => CartsItems(  productUid: productUid ?? _productUid,
  productName: productName ?? _productName,
  productImageUid: productImageUid ?? _productImageUid,
  productImage: productImage ?? _productImage,
  productSizeUid: productSizeUid ?? _productSizeUid,
  productSizeName: productSizeName ?? _productSizeName,
  productColorUid: productColorUid ?? _productColorUid,
  productColorImage: productColorImage ?? _productColorImage,
  quantity: quantity ?? _quantity,
  price: price ?? _price,
  totalPrice: totalPrice ?? _totalPrice,
  addedAt: addedAt ?? _addedAt,
);
  String? get productUid => _productUid;
  String? get productName => _productName;
  String? get productImageUid => _productImageUid;
  String? get productImage => _productImage;
  String? get productSizeUid => _productSizeUid;
  String? get productSizeName => _productSizeName;
  String? get productColorUid => _productColorUid;
  String? get productColorImage => _productColorImage;
  int? get quantity => _quantity;
  double? get price => _price;
  double? get totalPrice => _totalPrice;
  String? get addedAt => _addedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_uid'] = _productUid;
    map['product_name'] = _productName;
    map['product_image_uid'] = _productImageUid;
    map['product_image'] = _productImage;
    map['product_size_uid'] = _productSizeUid;
    map['product_size_name'] = _productSizeName;
    map['product_color_uid'] = _productColorUid;
    map['product_color_image'] = _productColorImage;
    map['quantity'] = _quantity;
    map['price'] = _price;
    map['total_price'] = _totalPrice;
    map['added_at'] = _addedAt;
    return map;
  }

}*/


CartsItems itemsFromJson(String str) => CartsItems.fromJson(json.decode(str));
String itemsToJson(CartsItems data) => json.encode(data.toJson());

class CartsItems {
  var productUid = "";
  var productName = "";
  var productImage = "";
  var productImageUid= "";
  var productSize = "";
  var productSizeUid= "";
  var productColor = "";
  var productColorUid = "";
  var quantity = 0;
  var price = 0.0;
  var totalPrice = 0.0;

  CartsItems({
    String? productUid,
    String? productName,
    String? productImage,
    String? productSize,
    String? productSizeUid,
    String? productColor,
    String? productColorUid,
    int? quantity,
    String? productImageUid,
    double? price,
  }) {
    this.productUid = productUid ?? "";
    this.productName = productName ?? "";
    this.productImage = productImage ?? "";
    this.productImageUid = productImageUid ?? "";
    this.productSize = productSize ?? "";
    this.productSizeUid = productSizeUid ?? "";
    this.productColor = productColor ?? "";
    this.productColorUid = productColorUid ?? "";
    this.quantity = quantity ?? 1;
    this.price = price ?? 0.0;
    this.totalPrice = (price ?? 0.0) * (quantity ?? 1);
  }

  factory CartsItems.fromJson(Map<String, dynamic> json) => CartsItems(
    productUid: json["product_uid"],
    productName: json["product_name"],
    productImage: json["product_image"],
    productImageUid: json['product_image_uid'],
    productSize: json["product_size"],
    productSizeUid: json["product_size_uid"],
    productColor: json["product_color"],
    productColorUid: json["product_color_uid"],
    quantity: json["quantity"],
    price: json["price"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_uid": productUid,
    "product_name": productName,
    "product_image": productImage,
    'product_image_uid': productImageUid,
    "product_size": productSize,
    "product_size_uid": productSizeUid,
    "product_color": productColor,
    "product_color_uid": productColorUid,
    "quantity": quantity,
    "price": price,
    "total_price": totalPrice,
  };
}

