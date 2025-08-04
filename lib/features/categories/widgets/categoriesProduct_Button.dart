import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesProductButton extends StatelessWidget {
  const CategoriesProductButton({
    super.key,
    this.index = 0,
    required this.name,
    this.isSelected = 0,
  });

  final int index;
  final String name;
  final int isSelected;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 3,
      color: isSelected == index ? Colors.green : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        width: 100.w,
        height: 40.h,
        alignment: Alignment.center,
        child: Text(
          name,
          style: TextStyle(
            color: isSelected == index ? Colors.white : Colors.black,
          ),
        ),
      ),
    );

  }
}
