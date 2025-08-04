import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/res/styles/colors.dart';
import '../../../categories/domain/model/product_color.dart';
import '../../../shared/widgets/dotted_line.dart';

class SelectedImageColors extends StatefulWidget {
   SelectedImageColors({
    super.key,
    required this.colors,
     required this.radius,
    this.isActive = false,
     this.onSelect,
    this.canScroll = false,
     this.spacing, this.padding,
  });
   final List<ProductColor> colors;
   final double radius;
   bool isActive;
  final ValueChanged<String?>? onSelect;
   final bool? canScroll;
   final double? spacing;
   final EdgeInsetsGeometry? padding;

  @override
  State<SelectedImageColors> createState() => _SelectedImageColorsState();
}

class _SelectedImageColorsState extends State<SelectedImageColors> {
  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            height: widget.radius * 2,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(2),
              physics: widget.canScroll! ? null : const NeverScrollableScrollPhysics(),
              itemCount: widget.colors.length,
              separatorBuilder: (_, __) => Gap(widget.spacing ?? 2),
              itemBuilder: (context, index) {
                final size = widget.colors[index].name;
               // final isActive = selectedSize?.toLowerCase() == size?.toLowerCase();

                return GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    height: widget.radius * 2,
                    width: widget.radius * 2,
                    decoration: BoxDecoration(
                      //shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.circular(10),
                     // color: !isActive ? null : Colours.lightThemePrimaryColour,
                      border: Border.all(
                        color: context.isDarkMode
                            ? Colours.lightThemeTintStockColour
                            : Colours.lightThemeSecondaryTextColour,
                      ),
                    ),
                    child:  Center(
                      child: ClipOval(
                        child: Image.network(
                          widget.colors[index].image.toString(),
                          width: 40, // Adjust size
                          height: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );



/*    GestureDetector(
     // onTap: press,
        onTap: () {
          String? activeColour = widget.colors[0].image;
          if (widget.onSelect != null) {
          }
        },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: widget.isActive ? const EdgeInsets.all(4) : null,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: widget.isActive
              ? Border.all(color: Theme.of(context).primaryColor, width: 2)
              : null,
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  widget.isActive= true;
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  //shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(35),
                  color: widget.isActive ? null : Colours.lightThemePrimaryColour,
                  border: Border.all(
                    color: context.isDarkMode
                        ? Colours.lightThemeTintStockColour
                        : Colours.lightThemeSecondaryTextColour,
                  ),
                ),
                child: ClipOval(
                  child: Image.network(
                    widget.imageUrl,
                    width: 40, // Adjust size
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            //DottedLine
            Padding(
              padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
              child: CustomPaint(
                size: const Size(double.infinity, 1),
                painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );*/
  }
}
