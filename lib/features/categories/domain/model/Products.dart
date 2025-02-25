import 'Images.dart';
import 'Sizes.dart';
import 'product_color.dart';
import 'dart:convert';

/// uid : "0cf46b62-f94c-4b83-af33-41372e5d27c5"
/// name : "Surhi"
/// description : "Men Regular Fit Checkered Spread Collar Casual Shirt"
/// images : [{"uid":"3bf2bc03-261f-418c-86e9-3c882dc4806e","image":"https://ecommerce.liberalsoft.net/product_images/1.PNG"},{"uid":"9205ba1b-c0a4-4e7a-8340-567714958986","image":"https://ecommerce.liberalsoft.net/product_images/2.PNG"}]
/// sizes : [{"uid":"fd21ccf9-ff26-4e49-b354-86a25faaa7db","name":"M","main_price":"1270.00","discount_price":"980.00","quantity":"100.00"},{"uid":"99f092ef-abf0-467a-a58d-482f94bde543","name":"L","main_price":"1270.00","discount_price":"920.00","quantity":"100.00"},{"uid":"d6ca099c-a8a5-40be-9595-e5a20f56e3e5","name":"XXL","main_price":"1300.00","discount_price":"970.00","quantity":"100.00"}]
/// colors : [{"uid":"21fb29ea-5910-4dcc-8976-2c653cd1615f","name":"Green","image":"https://ecommerce.liberalsoft.net/product_colors/1.PNG"},{"uid":"62a44899-b2b0-40d6-9ce7-d9e94c6d1794","name":"Yellow","image":"https://ecommerce.liberalsoft.net/product_colors/2.PNG"}]

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());
class Products {
  Products({
      String? uid, 
      String? name, 
      String? description, 
      List<Images>? images, 
      List<Sizes>? sizes, 
      List<ProductColor>? colors,}){
    _uid = uid;
    _name = name;
    _description = description;
    _images = images;
    _sizes = sizes;
    _colors = colors;
}

  Products.fromJson(dynamic json) {
    _uid = json['uid'];
    _name = json['name'];
    _description = json['description'];
    if (json['images'] != null) {
      _images = [];
      json['images'].forEach((v) {
        _images?.add(Images.fromJson(v));
      });
    }
    if (json['sizes'] != null) {
      _sizes = [];
      json['sizes'].forEach((v) {
        _sizes?.add(Sizes.fromJson(v));
      });
    }
    if (json['colors'] != null) {
      _colors = [];
      json['colors'].forEach((v) {
        _colors?.add(ProductColor.fromJson(v));
      });
    }
  }
  String? _uid;
  String? _name;
  String? _description;
  List<Images>? _images;
  List<Sizes>? _sizes;
  List<ProductColor>? _colors;
Products copyWith({  String? uid,
  String? name,
  String? description,
  List<Images>? images,
  List<Sizes>? sizes,
  List<ProductColor>? colors,
}) => Products(  uid: uid ?? _uid,
  name: name ?? _name,
  description: description ?? _description,
  images: images ?? _images,
  sizes: sizes ?? _sizes,
  colors: colors ?? _colors,
);
  String? get uid => _uid;
  String? get name => _name;
  String? get description => _description;
  List<Images>? get images => _images;
  List<Sizes>? get sizes => _sizes;
  List<ProductColor>? get colors => _colors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['name'] = _name;
    map['description'] = _description;
    if (_images != null) {
      map['images'] = _images?.map((v) => v.toJson()).toList();
    }
    if (_sizes != null) {
      map['sizes'] = _sizes?.map((v) => v.toJson()).toList();
    }
    if (_colors != null) {
      map['colors'] = _colors?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}