import 'dart:convert';

import 'package:get/get.dart';

/// product_uid : "0cf46b62-f94c-4b83-af33-41372e5d27c5"
/// product_name : "Surhi"
/// product_image_uid : "3bf2bc03-261f-418c-86e9-3c882dc4806e"
/// product_image : "/media/product_images/images.jpeg"
/// product_size_uid : "fd21ccf9-ff26-4e49-b354-86a25faaa7db"
/// product_size_name : "M"
/// product_color_uid : "21fb29ea-5910-4dcc-8976-2c653cd1615f"
/// product_color_image : "https://ecommerce.liberalsoft.net/media/product_colors/images.png"
/// quantity : 26
/// price : 980.0
/// total_price : 25480.0
/// added_at : "2025-02-11T06:43:03.527045Z"

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

}