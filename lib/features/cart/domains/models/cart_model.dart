import 'cart_Items.dart';
import 'dart:convert';

/// uid : "1f5dda92-45f2-4471-af7a-6adb829f166c"
/// user : 5
/// session_id : null
/// items : [{"product_uid":"0cf46b62-f94c-4b83-af33-41372e5d27c5","product_name":"Surhi","product_image_uid":"3bf2bc03-261f-418c-86e9-3c882dc4806e","product_image":"/media/product_images/images.jpeg","product_size_uid":"fd21ccf9-ff26-4e49-b354-86a25faaa7db","product_size_name":"M","product_color_uid":"21fb29ea-5910-4dcc-8976-2c653cd1615f","product_color_image":"https://ecommerce.liberalsoft.net/media/product_colors/images.png","quantity":26,"price":980.0,"total_price":25480.0,"added_at":"2025-02-11T06:43:03.527045Z"}]

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));
String cartModelToJson(CartModel data) => json.encode(data.toJson());
class CartModel {
  CartModel({
      String? uid, 
      num? user, 
      dynamic sessionId, 
      List<CartsItems>? items,}){
    _uid = uid;
    _user = user;
    _sessionId = sessionId;
    _items = items;
}

  CartModel.fromJson(dynamic json) {
    _uid = json['uid'];
    _user = json['user'];
    _sessionId = json['session_id'];
    if (json['items'] != null) {
      _items = [];
      json['items'].forEach((v) {
        _items?.add(CartsItems.fromJson(v));
      });
    }
  }
  String? _uid;
  num? _user;
  dynamic _sessionId;
  List<CartsItems>? _items;
CartModel copyWith({  String? uid,
  num? user,
  dynamic sessionId,
  List<CartsItems>? items,
}) => CartModel(  uid: uid ?? _uid,
  user: user ?? _user,
  sessionId: sessionId ?? _sessionId,
  items: items ?? _items,
);
  String? get uid => _uid;
  num? get user => _user;
  dynamic get sessionId => _sessionId;
  List<CartsItems>? get items => _items;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['user'] = _user;
    map['session_id'] = _sessionId;
    if (_items != null) {
      map['items'] = _items?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}