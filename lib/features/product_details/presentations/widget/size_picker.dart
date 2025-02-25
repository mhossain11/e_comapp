import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
   // selectedPrice = widget.sizes[0].mainPrice;
    return Column(
      children: [
        SizedBox(
          height: widget.radius * 2,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.all(2),
            physics: widget.canScroll ? null : const NeverScrollableScrollPhysics(),
            itemCount: widget.sizes.length,
            separatorBuilder: (_, __) => Gap(widget.spacing ?? 2),
            itemBuilder: (context, index) {
              print('price1:$selectedPrice');
              final size = widget.sizes[index].name;
              selectedPrice = widget.sizes[0].mainPrice;
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

                    if(widget.sizes[index].mainPrice!.isNotEmpty){
                      selectedPrice = widget.sizes[index].mainPrice;
                      print('Print3:$selectedPrice');
                    }else {
                      selectedPrice = widget.sizes[0].mainPrice.toString();
                      print('price4:$selectedPrice');
                    }

                    setState(() {
                      selectedSize = activeSize;

                    });
                  }
                },
                child: Container(
                  height: widget.radius * 2,
                  width: widget.radius * 2,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
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
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
              ),
            ),
            Row(
              children: [
                const Text('Price:',style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20),),
                Text( selectedPrice.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20 ),),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
              ),
            ),
          ],
        )
      ],
    );
  }
}
