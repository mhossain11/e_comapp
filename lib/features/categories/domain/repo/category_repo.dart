
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';

import '../../../homepage/domain/model/sliderModel.dart';
import '../model/Slider_model.dart';
import '../model/specialCategoryProduct_model.dart';
import '../model/special_categories_model/special_categories_Uid_model.dart';

abstract class CategoryRepo{
  ResultFuture<List<ProductCategoriesModel>> getCategory();
  ResultFuture<List<SpecialCategoryProductModel>> getSpecialCategories();
  //ResultFuture<List<SpecialCategoriesUidModel>> getSpecialCategoriesUid(String Uid);
  ResultFuture<List<SliderModel>> getSlider();
  ResultFuture<List<SliderModel>> getBanner();
  ResultFuture<SpecialCategoriesUidModel> getProducts(String productId);

}