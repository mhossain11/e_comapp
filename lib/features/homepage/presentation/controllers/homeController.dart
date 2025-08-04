import 'package:get/get.dart';

class HomeController extends GetxController{
  final Rx<int> sliderIndex = 0.obs;
  final Rx<int> selectTag = 0.obs;


  void  updatePageIndicator(index){
    sliderIndex.value = index;

  }
}