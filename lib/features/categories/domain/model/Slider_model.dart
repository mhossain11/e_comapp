import 'dart:convert';

/// id : 1
/// uid : "d274edad-9edb-47be-aacb-5b9ec56b89ec"
/// title : "HoZOborollo"
/// image : "https://ecommerce.liberalsoft.net/media/sliders/images-1.jpeg"
/// link : null
/// is_active : true
/// created_at : "2025-04-13T07:07:20.175677Z"

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));
String sliderModelToJson(SliderModel data) => json.encode(data.toJson());
class SliderModel {
  SliderModel({
      num? id, 
      String? uid, 
      String? title, 
      String? image,
      String? link,
      bool? isActive, 
      String? createdAt,}){
    _id = id;
    _uid = uid;
    _title = title;
    _image = image;
    _link = link;
    _isActive = isActive;
    _createdAt = createdAt;
}


  SliderModel.fromJson(dynamic json) {
    _id = json['id'];
    _uid = json['uid'];
    _title = json['title'];
    _image = json['image'];
    _link = json['link'];
    _isActive = json['is_active'];
    _createdAt = json['created_at'];
   }




  num? _id;
  String? _uid;
  String? _title;
  String? _image;
  String? _link;
  bool? _isActive;
  String? _createdAt;
SliderModel copyWith({  num? id,
  String? uid,
  String? title,
  String? image,
  String? link,
  bool? isActive,
  String? createdAt,
}) => SliderModel(  id: id ?? _id,
  uid: uid ?? _uid,
  title: title ?? _title,
  image: image ?? _image,
  link: link ?? _link,
  isActive: isActive ?? _isActive,
  createdAt: createdAt ?? _createdAt,
);
  num? get id => _id;
  String? get uid => _uid;
  String? get title => _title;
  String? get image => _image;
  String? get link => _link;
  bool? get isActive => _isActive;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['uid'] = _uid;
    map['title'] = _title;
    map['image'] = _image;
    map['link'] = _link;
    map['is_active'] = _isActive;
    map['created_at'] = _createdAt;
    return map;
  }

}