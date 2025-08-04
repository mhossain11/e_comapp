class SpecialCategoryModel {
  String? uid;
  String? name;
  String? description;

  SpecialCategoryModel({this.uid, this.name, this.description});

  SpecialCategoryModel.fromJson(dynamic json) {
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}