import 'dart:convert';

import 'package:get/get.dart';

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

