import 'dart:convert';

/// uid : "b17f279d-a2ad-4de0-9ef3-e473ea11a46a"
/// product_uid : "0cf46b62-f94c-4b83-af33-41372e5d27c5"
/// product_name : "Surhi"
/// product_image_uid : "3bf2bc03-261f-418c-86e9-3c882dc4806e"
/// product_image_url : "https://ecommerce.liberalsoft.net/media/product_images/images.jpeg"
/// product_size_uid : "fd21ccf9-ff26-4e49-b354-86a25faaa7db"
/// product_size_name : "M"
/// price : 980.0
/// product_color_uid : "21fb29ea-5910-4dcc-8976-2c653cd1615f"
/// product_color_image_url : "https://ecommerce.liberalsoft.net/media/product_colors/images.png"
/// added_at : "2025-02-13T18:38:35.905715Z"

WishItem itemsFromJson(String str) => WishItem.fromJson(json.decode(str));
String itemsToJson(WishItem data) => json.encode(data.toJson());
class WishItem {
  WishItem({
      String? uid, 
      String? productUid, 
      String? productName, 
      String? productImageUid, 
      String? productImageUrl, 
      String? productSizeUid, 
      String? productSizeName, 
      num? price, 
      String? productColorUid, 
      String? productColorImageUrl, 
      String? addedAt,}){
    _uid = uid;
    _productUid = productUid;
    _productName = productName;
    _productImageUid = productImageUid;
    _productImageUrl = productImageUrl;
    _productSizeUid = productSizeUid;
    _productSizeName = productSizeName;
    _price = price;
    _productColorUid = productColorUid;
    _productColorImageUrl = productColorImageUrl;
    _addedAt = addedAt;
}

  WishItem.fromJson(dynamic json) {
    _uid = json['uid'];
    _productUid = json['product_uid'];
    _productName = json['product_name'];
    _productImageUid = json['product_image_uid'];
    _productImageUrl = json['product_image_url'];
    _productSizeUid = json['product_size_uid'];
    _productSizeName = json['product_size_name'];
    _price = json['price'];
    _productColorUid = json['product_color_uid'];
    _productColorImageUrl = json['product_color_image_url'];
    _addedAt = json['added_at'];
  }
  String? _uid;
  String? _productUid;
  String? _productName;
  String? _productImageUid;
  String? _productImageUrl;
  String? _productSizeUid;
  String? _productSizeName;
  num? _price;
  String? _productColorUid;
  String? _productColorImageUrl;
  String? _addedAt;
WishItem copyWith({  String? uid,
  String? productUid,
  String? productName,
  String? productImageUid,
  String? productImageUrl,
  String? productSizeUid,
  String? productSizeName,
  num? price,
  String? productColorUid,
  String? productColorImageUrl,
  String? addedAt,
}) => WishItem(  uid: uid ?? _uid,
  productUid: productUid ?? _productUid,
  productName: productName ?? _productName,
  productImageUid: productImageUid ?? _productImageUid,
  productImageUrl: productImageUrl ?? _productImageUrl,
  productSizeUid: productSizeUid ?? _productSizeUid,
  productSizeName: productSizeName ?? _productSizeName,
  price: price ?? _price,
  productColorUid: productColorUid ?? _productColorUid,
  productColorImageUrl: productColorImageUrl ?? _productColorImageUrl,
  addedAt: addedAt ?? _addedAt,
);
  String? get uid => _uid;
  String? get productUid => _productUid;
  String? get productName => _productName;
  String? get productImageUid => _productImageUid;
  String? get productImageUrl => _productImageUrl;
  String? get productSizeUid => _productSizeUid;
  String? get productSizeName => _productSizeName;
  num? get price => _price;
  String? get productColorUid => _productColorUid;
  String? get productColorImageUrl => _productColorImageUrl;
  String? get addedAt => _addedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['product_uid'] = _productUid;
    map['product_name'] = _productName;
    map['product_image_uid'] = _productImageUid;
    map['product_image_url'] = _productImageUrl;
    map['product_size_uid'] = _productSizeUid;
    map['product_size_name'] = _productSizeName;
    map['price'] = _price;
    map['product_color_uid'] = _productColorUid;
    map['product_color_image_url'] = _productColorImageUrl;
    map['added_at'] = _addedAt;
    return map;
  }

}