
import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';

abstract class CategoryRepo{
  ResultFuture<List<CategoryModel>> getCategory();
}