import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../categories/domain/model/Images.dart';
import '../../../categories/domain/model/Products.dart';

class ProductImage extends StatefulWidget {
 final List<Images> imageProducts;
   const ProductImage({super.key,required this.imageProducts});

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selectedImage =0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: AspectRatio(aspectRatio: 1,
          child: Image.network(widget.imageProducts[selectedImage].image!.toString(),),
          ),
        ),

        Gap(10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              ...List.generate(widget.imageProducts.length,
                  (index)=> buildSmallPreview(index))
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallPreview(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: selectedImage == index ? Colors.deepOrange:Colors.transparent)
        ),
        child: Image.network(widget.imageProducts[index].image.toString()),
      ),
      
    );
  }
}
