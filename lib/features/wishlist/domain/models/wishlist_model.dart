import 'wish_items.dart';
import 'dart:convert';

/// uid : "f914b12f-fb48-472f-837c-c58f3f30be36"
/// user : 5
/// created_at : "2025-02-09T19:29:29.108298Z"
/// items : [{"uid":"b17f279d-a2ad-4de0-9ef3-e473ea11a46a","product_uid":"0cf46b62-f94c-4b83-af33-41372e5d27c5","product_name":"Surhi","product_image_uid":"3bf2bc03-261f-418c-86e9-3c882dc4806e","product_image_url":"https://ecommerce.liberalsoft.net/media/product_images/images.jpeg","product_size_uid":"fd21ccf9-ff26-4e49-b354-86a25faaa7db","product_size_name":"M","price":980.0,"product_color_uid":"21fb29ea-5910-4dcc-8976-2c653cd1615f","product_color_image_url":"https://ecommerce.liberalsoft.net/media/product_colors/images.png","added_at":"2025-02-13T18:38:35.905715Z"}]

WishListModel wishListModelFromJson(String str) => WishListModel.fromJson(json.decode(str));
String wishListModelToJson(WishListModel data) => json.encode(data.toJson());
class WishListModel {
  WishListModel({
      String? uid, 
      num? user, 
      String? createdAt, 
      List<WishItem>? items,}){
    _uid = uid;
    _user = user;
    _createdAt = createdAt;
    _items = items;
}

  WishListModel.fromJson(dynamic json) {
    _uid = json['uid'];
    _user = json['user'];
    _createdAt = json['created_at'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(WishItem.fromJson(v));
      });
    }
  }
  String? _uid;
  num? _user;
  String? _createdAt;
  List<WishItem>? _items;
WishListModel copyWith({  String? uid,
  num? user,
  String? createdAt,
  List<WishItem>? items,
}) => WishListModel(  uid: uid ?? _uid,
  user: user ?? _user,
  createdAt: createdAt ?? _createdAt,
  items: items ?? _items,
);
  String? get uid => _uid;
  num? get user => _user;
  String? get createdAt => _createdAt;
  List<WishItem>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['user'] = _user;
    map['created_at'] = _createdAt;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}