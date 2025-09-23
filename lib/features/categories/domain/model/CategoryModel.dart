import 'Subcategories.dart';
import 'dart:convert';

/// uid : "a8ce3d5d-394a-4bb6-8092-451cf7d15f3d"
/// name : "Fashion"
/// description : ""
/// subcategories : [{"uid":"d9e54570-49f5-446b-97b6-a6ffc147eaf6","name":"Men's Top Wear","description":"","products":[{"uid":"0cf46b62-f94c-4b83-af33-41372e5d27c5","name":"Surhi","description":"Men Regular Fit Checkered Spread Collar Casual Shirt","images":[{"uid":"3bf2bc03-261f-418c-86e9-3c882dc4806e","image":"https://ecommerce.liberalsoft.net/product_images/1.PNG"},{"uid":"9205ba1b-c0a4-4e7a-8340-567714958986","image":"https://ecommerce.liberalsoft.net/product_images/2.PNG"}],"sizes":[{"uid":"fd21ccf9-ff26-4e49-b354-86a25faaa7db","name":"M","main_price":"1270.00","discount_price":"980.00","quantity":"100.00"},{"uid":"99f092ef-abf0-467a-a58d-482f94bde543","name":"L","main_price":"1270.00","discount_price":"920.00","quantity":"100.00"},{"uid":"d6ca099c-a8a5-40be-9595-e5a20f56e3e5","name":"XXL","main_price":"1300.00","discount_price":"970.00","quantity":"100.00"}],"colors":[{"uid":"21fb29ea-5910-4dcc-8976-2c653cd1615f","name":"Green","image":"https://ecommerce.liberalsoft.net/product_colors/1.PNG"},{"uid":"62a44899-b2b0-40d6-9ce7-d9e94c6d1794","name":"Yellow","image":"https://ecommerce.liberalsoft.net/product_colors/2.PNG"}]}]},{"uid":"c97bac46-bdec-4bf0-bf9f-2c0b4a89c1b1","name":"Men's Bottom Wear","description":"","products":[]},{"uid":"e85281f9-3265-4281-9c90-7b5812299dfd","name":"Men Footwear","description":"","products":[]}]

ProductCategoriesModel categoryModelFromJson(String str) => ProductCategoriesModel.fromJson(json.decode(str));
String categoryModelToJson(ProductCategoriesModel data) => json.encode(data.toJson());
class ProductCategoriesModel {
  ProductCategoriesModel({
    String? uid,
    String? name,
    String? description,
    List<Subcategories>? subcategories,}){
    _uid = uid;
    _name = name;
    _description = description;
    _subcategories = subcategories;
  }

  ProductCategoriesModel.fromJson(dynamic json) {
    _uid = json['uid'];
    _name = json['name'];
    _description = json['description'];
    if (json['subcategories'] != null) {
      _subcategories = [];
      json['subcategories'].forEach((v) {
        _subcategories?.add(Subcategories.fromJson(v));
      });
    }
  }


  String? _uid;
  String? _name;
  String? _description;
  List<Subcategories>? _subcategories;
  ProductCategoriesModel copyWith({  String? uid,
    String? name,
    String? description,
    List<Subcategories>? subcategories,
  }) => ProductCategoriesModel(  uid: uid ?? _uid,
    name: name ?? _name,
    description: description ?? _description,
    subcategories: subcategories ?? _subcategories,
  );


  String? get uid => _uid;
  String? get name => _name;
  String? get description => _description;
  List<Subcategories>? get subcategories => _subcategories;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['name'] = _name;
    map['description'] = _description;
    if (_subcategories != null) {
      map['subcategories'] = _subcategories?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}