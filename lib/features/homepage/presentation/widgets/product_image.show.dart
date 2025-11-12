import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

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
            child: CachedNetworkImage(
              imageUrl: widget.product.images![selectImage].image.toString(),
              fit: BoxFit.cover,
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              errorWidget: (context, url, error) =>
              const Icon(Icons.error, size: 20, color: Colors.redAccent),
            ),

            //Image.network(imageUrl!,),
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
