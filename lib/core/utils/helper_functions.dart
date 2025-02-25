import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelperFunctions{

  static void navigationToScreen(BuildContext  context,Widget screen){
    Navigator.push(context, MaterialPageRoute(builder: (_)=> screen));
  }

  static String truncateText(String text,int maxLength){
    if(text.length<= maxLength){
      return text;
    }else{
      return '${text.substring(0,maxLength)}...';
    }
  }

  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize(){
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight(){
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth(){
    return MediaQuery.of(Get.context!).size.width;
  }

  double responsiveWidth(double value) {
   double screenWidth =MediaQuery.of(Get.context!).size.width;
    // Example base width (375.0) from a standard mobile device
    double baseWidth = 375.0;
    return (value / baseWidth) * screenWidth;
  }

  double responsiveHeight(double value) {
   double screenHeight= MediaQuery.of(Get.context!).size.height;
    // Example base height (812.0) from a standard mobile device
    double baseHeight = 812.0;
    return (value / baseHeight) * screenHeight;
  }

  static void showSnackBar(String message){
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message,)),
    );
  }


  static void showAlert(String title,String message){
    showDialog(
        context: Get.context!,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(onPressed: ()=> Navigator.of(context).pop,
                  child: const Text('OK'))
            ],
          );
        });
  }
/*  static void showModalBottomSheets(String title){
    showModalBottomSheet(
        context: Get.context!,
        builder: (BuildContext context){
          return BottomSheetItems(text: title,);
        });
  }*/

 /* static String getFormattedDate(DateTime date,{String format ='dd MMM yyyy'}){
    return DateFormat(format).format(date);
  }*/

  static List<T> removeDupliCates<T>(List<T> list){
    return list.toSet().toList();
  }
}