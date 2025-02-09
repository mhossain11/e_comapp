import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';

abstract class ProductRepo{

  ResultFuture<Products> getProduct(String ProductId);
}