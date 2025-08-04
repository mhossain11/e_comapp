class SpecialCategoryProductModel {
  SpecialCategory? specialCategory;
  String? productUid;
  String? productName;
  String? productImage;
  double? mainPrice;
  double? discountPrice;
  double? discountPercentage;
  String? sizeName;
  String? productColors;

  SpecialCategoryProductModel(
      {this.specialCategory,
        this.productUid,
        this.productName,
        this.productImage,
        this.mainPrice,
        this.discountPrice,
        this.discountPercentage,
        this.sizeName,
        this.productColors});

  SpecialCategoryProductModel.fromJson(Map<String, dynamic> json) {
    specialCategory = json['special_category'] != null
        ? SpecialCategory.fromJson(json['special_category'])
        : null;
    productUid = json['product_uid'];
    productName = json['product_name'];
    productImage = json['product_image'];
    mainPrice = json['main_price'];
    discountPrice = json['discount_price'];
    discountPercentage = json['discount_percentage'];
    sizeName = json['size_name'];
    productColors = json['product_colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (specialCategory != null) {
      data['special_category'] = specialCategory!.toJson();
    }
    data['product_uid'] = productUid;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['main_price'] = mainPrice;
    data['discount_price'] = discountPrice;
    data['discount_percentage'] = discountPercentage;
    data['size_name'] = sizeName;
    data['product_colors'] = productColors;
    return data;
  }
}

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['name'] = name;
    data['description'] = description;
    return data;
  }
}
