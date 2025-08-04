
class SpecialCategory {
  String? uid;
  String? name;
  String? description;

  SpecialCategory({this.uid, this.name, this.description});

  SpecialCategory.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}