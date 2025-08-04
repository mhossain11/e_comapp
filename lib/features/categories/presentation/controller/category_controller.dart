
import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
<<<<<<< HEAD
import 'package:e_comapp/features/categories/domain/repo/category_repo.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{
  CategoryController(this._categoryRepo);
  final CategoryRepo _categoryRepo;

  var categoryList = <CategoryModel>[].obs;
  var productList = <Products>[].obs;
=======
import 'package:e_comapp/features/categories/domain/model/Slider_model.dart';
import 'package:e_comapp/features/categories/domain/repo/category_repo.dart';
import 'package:get/get.dart';

import '../../domain/model/specialCategoryProduct_model.dart';
import '../../domain/model/special_categories_model/special_categories_Uid_model.dart';
import '../../domain/model/special_categories_model/special_category_model.dart';

class CategoryController extends GetxController{
  CategoryController(this._categoryRepo);
  final CategoryRepo _categoryRepo;
  @override
  void onInit() {
    super.onInit();
    getCategories();
    getSpecialCategories();
    getSlider();
    getBanner();
  }

  final Rx<int> sliderIndex = 0.obs;
  final Rx<int> bannerIndex = 0.obs;
  var productCategories = <ProductCategoriesModel>[].obs; // full Product Categories
  var sliderList = <SliderModel>[].obs;
  var bannerList = <SliderModel>[].obs;
  var specialCategoryProductList = <SpecialCategoryProductModel>[].obs;
  var productList = <Products>[].obs;
  var specialCategoriesList = Rxn<List<SpecialCategoriesUidModel>>();
>>>>>>> e751dd7 ( product details screen change)
  var isLoading = false.obs;
  var index = 0 .obs;
  var clickSubItem = false.obs;
  var errorMessage = ''.obs;
<<<<<<< HEAD

=======
  void  updatePageIndicator(index){
    sliderIndex.value = index;
  }
>>>>>>> e751dd7 ( product details screen change)

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
<<<<<<< HEAD
            categoryList.assignAll(categories);
=======
            productCategories.assignAll(categories);
>>>>>>> e751dd7 ( product details screen change)
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
<<<<<<< HEAD
=======

  Future<void> getSpecialCategories() async{
    try{
      isLoading.value=true;
      update();
      final result = await _categoryRepo.getSpecialCategories();

      result.fold(
              (failure){
            errorMessage.value = failure.message;
            update();
          }
          ,
              (categories) async{
            specialCategoryProductList.assignAll(categories);
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

  Future<void> getSlider() async{
    try{
      isLoading.value=true;
      update();
      final result = await _categoryRepo.getSlider();

      result.fold(
              (failure){
            errorMessage.value = failure.message;
            update();
          }
          ,
              (slider){
                sliderList.assignAll(slider);
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

  Future<void> getBanner() async{
    try{
      isLoading.value=true;
      update();
      final result = await _categoryRepo.getBanner();

      result.fold(
              (failure){
            errorMessage.value = failure.message;
            update();
          }
          ,
              (banner){
                bannerList.assignAll(banner);
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

  Future<SpecialCategoriesUidModel> getProducts(String productId) async {
    try {
      isLoading.value = true;
      final result = await _categoryRepo.getProducts(productId);

      return result.fold(
            (failure) {
          errorMessage.value = failure.errorMessage;
          // Failure হলে Exception ছুড়ে দাও, অথবা empty model return করো
          throw Exception(failure.errorMessage); // ✅ এটা preferred
          // return SpecialCategoriesUidModel.empty(); // Optional fallback
        },
            (fetchedProducts) {
          specialCategoriesList.value = [fetchedProducts];
          return fetchedProducts;
        },
      );
    } finally {
      isLoading.value = false;
      update();
    }
  }




>>>>>>> e751dd7 ( product details screen change)
}