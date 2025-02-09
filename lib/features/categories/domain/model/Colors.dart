import 'dart:convert';

/// uid : "21fb29ea-5910-4dcc-8976-2c653cd1615f"
/// name : "Green"
/// image : "https://ecommerce.liberalsoft.net/product_colors/1.PNG"

Colors colorsFromJson(String str) => Colors.fromJson(json.decode(str));
String colorsToJson(Colors data) => json.encode(data.toJson());
class Colors {
  Colors({
      String? uid, 
      String? name, 
      String? image,}){
    _uid = uid;
    _name = name;
    _image = image;
}

  Colors.fromJson(dynamic json) {
    _uid = json['uid'];
    _name = json['name'];
    _image = json['image'];
  }
  String? _uid;
  String? _name;
  String? _image;
Colors copyWith({  String? uid,
  String? name,
  String? image,
}) => Colors(  uid: uid ?? _uid,
  name: name ?? _name,
  image: image ?? _image,
);
  String? get uid => _uid;
  String? get name => _name;
  String? get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['uid'] = _uid;
    map['name'] = _name;
    map['image'] = _image;
    return map;
  }

}