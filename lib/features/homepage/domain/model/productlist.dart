import '../../../categories/domain/model/special_categories_model/special_category_model.dart';

class ProductList {
  SpecialCategoryModel? specialCategory;
  String? productUid;
  String? productName;
  String? productImage;
  int? mainPrice;
  int? discountPrice;
  int? discountPercentage;

  ProductList(
      {this.specialCategory,
        this.productUid,
        this.productName,
        this.productImage,
        this.mainPrice,
        this.discountPrice,
        this.discountPercentage});

  ProductList.fromJson(Map<String, dynamic> json) {
    specialCategory = json['special_category'] != null
        ? new SpecialCategoryModel.fromJson(json['special_category'])
        : null;
    productUid = json['product_uid'];
    productName = json['product_name'];
    productImage = json['product_image'];
    mainPrice = json['main_price'];
    discountPrice = json['discount_price'];
    discountPercentage = json['discount_percentage'];
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
    return data;
  }
}


