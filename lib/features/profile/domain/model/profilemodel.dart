class ProfileModel {
  String? uid;
  String? address;
  String? gender;
  String? dateOfBirth;
  String? userImage;

  ProfileModel(
      {this.uid, this.address, this.gender, this.dateOfBirth, this.userImage});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    address = json['address'];
    gender = json['gender'];
    dateOfBirth = json['date_of_birth'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['date_of_birth'] = this.dateOfBirth;
    data['user_image'] = this.userImage;
    return data;
  }
}
