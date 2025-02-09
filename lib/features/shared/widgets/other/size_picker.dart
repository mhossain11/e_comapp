import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../categories/domain/model/Sizes.dart';
import '../dotted_line.dart';

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
  String? selectedPrice;

  @override
  Widget build(BuildContext context) {
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
              final size = widget.sizes[index].name;
              var prices = widget.sizes[index].mainPrice;
              final isActive = selectedSize?.toLowerCase() == size?.toLowerCase();
              return GestureDetector(
                onTap: () {
                  String? activeSize = size;
                  if (widget.onSelect != null) {
                    if (selectedSize?.toLowerCase() == activeSize) {
                      activeSize = null;
                    }
                    widget.onSelect!(activeSize);

                    if(widget.sizes[index].mainPrice!.isNotEmpty){
                      selectedPrice = prices;
                    }else {
                      prices = widget.sizes[0].mainPrice;

                    }
                    setState(() {
                      selectedSize = activeSize;
                      selectedPrice = prices;
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
                const Text('Price:'),
                Text('$selectedPrice'),
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
