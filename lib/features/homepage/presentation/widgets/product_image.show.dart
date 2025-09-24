import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../categories/domain/model/Products.dart';

class ProductImage extends StatefulWidget {
  const ProductImage({super.key, required this.product});
  final Products product;

  @override
  State<ProductImage> createState() => _ProductImageState();
}

class _ProductImageState extends State<ProductImage> {
  int selectImage = 0;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
        children: [
          SizedBox(
            height:  media.width * 0.70,
            child: AspectRatio(
                aspectRatio: 1,
            child: Image.network(widget.product.images![selectImage].image.toString(),),
          ),
          ),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                ...List.generate(widget.product.images!.length, (index) => smallPreview(index))
                ],
              ),
            ],
          )
        ],


    );
  }

  Widget smallPreview(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectImage = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 5),
        padding: EdgeInsets.all(8),
        height: 48.h,
        width: 48.w,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color:selectImage == index ? Colors.deepOrange:Colors.transparent),
        ),
        child: Image.network(widget.product.images![index].image.toString(),),
      ),
    );
  }
}
