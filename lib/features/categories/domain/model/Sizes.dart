import 'dart:convert';

/// uid : "fd21ccf9-ff26-4e49-b354-86a25faaa7db"
/// name : "M"
/// main_price : "1270.00"
/// discount_price : "980.00"
/// quantity : "100.00"

Sizes sizesFromJson(String str) => Sizes.fromJson(json.decode(str));
String sizesToJson(Sizes data) => json.encode(data.toJson());
class Sizes {
  Sizes({
      String? uid, 
      String? name, 
      String? mainPrice, 
      String? discountPrice, 
      String? quantity,}){
    _uid = uid;
    _name = name;
    _mainPrice = mainPrice;
    _discountPrice = discountPrice;
    _quantity = quantity;
}

  Sizes.fromJson(dynamic json) {
    _uid = json['uid'];
    _name = json['name'];
    _mainPrice = json['main_price'];
    _discountPrice = json['discount_price'];
    _quantity = json['quantity'];
  }
  String? _uid;
  String? _name;
  String? _mainPrice;
  String? _discountPrice;
  String? _quantity;
Sizes copyWith({  String? uid,
  String? name,
  String? mainPrice,
  String? discountPrice,
  String? quantity,
}) => Sizes(  uid: uid ?? _uid,
  name: name ?? _name,
  mainPrice: mainPrice ?? _mainPrice,
  discountPrice: discountPrice ?? _discountPrice,
  quantity: quantity ?? _quantity,
);
  String? get uid => _uid;
  String? get name => _name;
  String? get mainPrice => _mainPrice;
  String? get discountPrice => _discountPrice;
  String? get quantity => _quantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['name'] = _name;
    map['main_price'] = _mainPrice;
    map['discount_price'] = _discountPrice;
    map['quantity'] = _quantity;
    return map;
  }

}