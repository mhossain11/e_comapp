

class ProductReviewModel {
  String? uid;
  String? product;
  User? user;
  int? rating;
  String? review;
  String? createdAt;
  String? updatedAt;

  ProductReviewModel(
      {this.uid,
        this.product,
        this.user,
        this.rating,
        this.review,
        this.createdAt,
        this.updatedAt});

  ProductReviewModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    product = json['product'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    rating = json['rating'];
    review = json['review'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['product'] = product;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['rating'] = rating;
    data['review'] = review;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? fullName;

  User({this.id, this.email, this.fullName});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    fullName = json['full_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['full_name'] = fullName;
    return data;
  }
}
