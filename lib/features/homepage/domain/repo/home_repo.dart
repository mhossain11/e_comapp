

import 'package:e_comapp/core/utils/typedefs.dart';
import 'package:e_comapp/features/homepage/domain/model/searchmodel.dart';

abstract class HomeRepo{

  ResultFuture<List<SearchModel>> searchData(String search);
}