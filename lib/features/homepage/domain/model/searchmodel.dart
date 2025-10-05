class SearchModel{

  SearchModel({
    this.uid,
    this.name,
    this.image});

   String? uid;
   String? name;
   String? image;


  SearchModel.fromJson(Map<String, dynamic>json) {
    uid = json['uid'];
    name = json['name'];
    image = json['first_image'];
  }

  Map<String, dynamic> tojson(){
    final Map<String, dynamic> data = <String, dynamic>{};

    data['uid'] = uid;
    data['name']=name;
    data['first_image']=image;
    return data;
  }
}