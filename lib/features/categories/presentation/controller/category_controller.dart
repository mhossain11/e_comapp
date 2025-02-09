
import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:e_comapp/features/categories/domain/repo/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  CategoryController(this._categoryRepo);
  final CategoryRepo _categoryRepo;

  var categoryList = <CategoryModel>[].obs;
  var productList = <Products>[].obs;
  var isLoading = false.obs;
  var index = 0 .obs;
  var clickSubItem = false.obs;
  var errorMessage = ''.obs;


  Future<void> getCategories() async{
    try{
      isLoading.value=true;
      update();
      final result = await _categoryRepo.getCategory();

      result.fold(
          (failure){
            errorMessage.value = failure.message;
            update();
          }
      ,
          (categories){
            categoryList.assignAll(categories);
            update();
          }
      );

    }catch(e){
      errorMessage.value = e.toString();
      update();

    }finally{
      isLoading.value = false;
      update();
    }
  }
}