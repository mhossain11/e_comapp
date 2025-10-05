import 'package:e_comapp/features/homepage/domain/model/searchmodel.dart';
import 'package:e_comapp/features/homepage/domain/repo/home_repo.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  HomeController(this.homeRepo);
  final HomeRepo homeRepo;

  var isLoading = false.obs;
  final Rx<int> sliderIndex = 0.obs;
  final Rx<int> selectTag = 0.obs;
  var errorMessage = ''.obs;
  RxList<SearchModel> searchList = <SearchModel>[].obs;


  void  updatePageIndicator(index){
    sliderIndex.value = index;

  }

  Future<void> searchData(String query) async{

    try{
      isLoading.value =true;
      final result = await homeRepo.searchData(query);
      result.fold(
              (failure){
            errorMessage.value = failure.errorMessage;
          },
              (fetchedData){
            searchList.assignAll(fetchedData);
              });

    }finally{
      isLoading.value = false;
    }
  }
}