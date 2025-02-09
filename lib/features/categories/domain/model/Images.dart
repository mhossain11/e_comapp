import 'dart:convert';

/// uid : "3bf2bc03-261f-418c-86e9-3c882dc4806e"
/// image : "https://ecommerce.liberalsoft.net/product_images/1.PNG"

Images imagesFromJson(String str) => Images.fromJson(json.decode(str));
String imagesToJson(Images data) => json.encode(data.toJson());
class Images {
  Images({
      String? uid, 
      String? image,}){
    _uid = uid;
    _image = image;
}

  Images.fromJson(dynamic json) {
    _uid = json['uid'];
    _image = json['image'];
  }
  String? _uid;
  String? _image;
Images copyWith({  String? uid,
  String? image,
}) => Images(  uid: uid ?? _uid,
  image: image ?? _image,
);
  String? get uid => _uid;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['image'] = _image;
    return map;
  }

}