import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../categories/domain/model/Products.dart';
import '../../../categories/domain/model/product_color.dart';

class ColorPalette extends StatefulWidget {
  final List<ProductColor> colors;
  final ValueChanged<String?>? onSelect;
  const ColorPalette({super.key, required this.colors, this.onSelect});

  @override
  State<ColorPalette> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    print('ColorS:$selectedIndex');
    return SizedBox(
      height: 100,
      child: Center(
        child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget.colors.length,
          padding: const EdgeInsets.all(5),
          physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_,__) => const SizedBox(width:5),
            itemBuilder: (context,index){
              final item = widget.colors[index];
              final colorName =  item.name!;
              final isSelected = selectedIndex == index;
              final isActive =colorName.toLowerCase() == colorName.toLowerCase();

              return  GestureDetector(
                onTap: () {
                  String? activeColor = colorName;
                  if (widget.onSelect != null) {
                    if (colorName.toLowerCase() == isActive) {
                      activeColor = null;
                    }
                    widget.onSelect!(activeColor);
                    setState(() {
                      selectedIndex = index;
                    });
                  }
                },
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected ? Colors.blue : Colors.grey,
                          width: isSelected ? 2 : 1,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: CachedNetworkImage(
                        imageUrl: item.image!,
                        imageBuilder: (context, imageProvider) => CircleAvatar(
                          radius: 30,
                          backgroundImage: imageProvider,
                        ),
                        placeholder: (_, __) => const CircularProgressIndicator(),
                        errorWidget: (_, __, ___) => const Icon(Icons.broken_image),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      item.name!,
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: isSelected ? Colors.blue : Colors.black,
                      ),
                    ),
                  ],
                ),
              );
            },
        ),
      ),
    );
  }
}
