import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../categories/domain/model/Sizes.dart';
import '../../../shared/widgets/dotted_line.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({
    required this.sizes,
    required this.radius,
    this.onSelect,
    this.canScroll = false,
    this.spacing,
    this.padding,
    super.key,
  });

  final List<Sizes> sizes;
  final ValueChanged<String?>? onSelect;
  final double radius;
  final bool canScroll;
  final double? spacing;
  final EdgeInsetsGeometry? padding;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? selectedSize;
  String? selectedPrice ;
  String? selectedDiscount;

  @override
  void initState() {
    super.initState();

    setState(() {
      selectedPrice = widget.sizes[0].mainPrice;
      selectedDiscount = widget.sizes[0].discountPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: widget.radius * 2,
          child: Center(
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(2),
              physics: widget.canScroll ? null : const NeverScrollableScrollPhysics(),
              itemCount: widget.sizes.length,
              separatorBuilder: (_, __) => Gap(widget.spacing ?? 2),
              itemBuilder: (context, index) {

               // print('price1:$selectedPrice');
                final size = widget.sizes[index].name;
                selectedPrice = widget.sizes[index].mainPrice;
                selectedDiscount = widget.sizes[index].discountPrice;
                final isActive = selectedSize?.toLowerCase() == size?.toLowerCase();

                print('price2:$selectedPrice');
                return GestureDetector(
                  onTap: () {
                    String? activeSize = size;
                    if (widget.onSelect != null) {
                      if (selectedSize?.toLowerCase() == activeSize) {
                        activeSize = null;
                      }
                      widget.onSelect!(activeSize);

                     /* if(widget.sizes[index].mainPrice!.isNotEmpty){
                        selectedPrice = widget.sizes[index].mainPrice;
                        print('Print3:$selectedPrice');
                      }else {
                        selectedPrice = widget.sizes[0].mainPrice.toString();
                        print('price4:$selectedPrice');
                      }*/

                      setState(() {
                        selectedSize = activeSize;
                        selectedPrice = widget.sizes[index].mainPrice;
                        selectedDiscount = widget.sizes[index].discountPrice;

                      });
                    }
                  },
                  child: Container(
                    height: widget.radius * 2,
                    width: widget.radius * 2,
                    decoration: BoxDecoration(
                      //shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                      color: !isActive ? null : Colours.lightThemePrimaryColour,
                      border: Border.all(
                        color: context.isDarkMode
                            ? Colours.lightThemeTintStockColour
                            : Colours.lightThemeSecondaryTextColour,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        size!.toUpperCase(),
                        style: TextStyles.headingSemiBold.copyWith(
                          fontSize: 20,
                          color: isActive
                              ? Colours.lightThemeWhiteColour
                              : Colours.lightThemeSecondaryTextColour,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Gap(10),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text('Price:',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 14.sp,color: Colors.grey),),
        ),
        Gap(5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text( "${formatPrice(selectedPrice)} ৳",
                  style: TextStyle(
                decoration: TextDecoration.lineThrough,color: Colors.grey,
                fontWeight: FontWeight.normal,fontSize: 16.sp ),)),
            Gap(10),
            Center(child: Text('${formatPrice(selectedDiscount)} ৳'?? '',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.sp ),)),
          ],
        ),
        Gap(10)

      ],
    );
  }

  String formatPrice(String? price) {
    if (price == null || price.isEmpty) return '';
    final value = double.tryParse(price) ?? 0;
    // যদি দশমিক অংশ 0 হয় তাহলে শুধু পূর্ণসংখ্যা দেখাবে
    if (value == value.toInt()) {
      return value.toInt().toString();
    }
    return value.toString();
  }
}
