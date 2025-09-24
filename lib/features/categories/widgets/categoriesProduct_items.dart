
import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/res/media.dart';
import '../../../core/res/styles/colors.dart';

class CategoriesProductItems extends StatelessWidget {
  final Products item;
  final bool ignoring;
  final bool priceIgnoring;
  const CategoriesProductItems({super.key,
    required this.item,
    required this.ignoring,
    required this.priceIgnoring,
  });


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
   // print('P-${media.height * 0.25}');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      //width: media.width * 0.32,
      width:  200.w,
      height: 256.h,

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3,
            blurRadius: 10,
            offset: const Offset(0, 3)
          )
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const Gap(5),
            if(item.images!.isEmpty)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.white38, offset: Offset(0, 2), blurRadius: 5)
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                   // width: media.width * 0.32,
                    height: media.width * 0.40,
                  ),
                ),
              ),
            ),
            if(item.images!.isNotEmpty)
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.white38, offset: Offset(0, 2), blurRadius: 5)
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: CachedNetworkImage(
                      imageUrl: item.images![0].image ?? '',
                      height: media.width * 0.40,
                      fit: BoxFit.fitWidth,

                      // Shimmer while loading
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: media.width * 0.40,
                          width: double.infinity,
                          color: Colors.white,
                        ),
                      ),

                      // Show error icon if failed
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.broken_image),
                    ),
                  ),
                ),
              ),
            const Gap(2),
            Text(
              item.name.toString(),
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold),
            ),

            const Gap(5),
            Visibility(
              visible: ignoring,
              child: RatingBar.builder(
                  initialRating: 5,
                  maxRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 15,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colours.lightThemePrimaryTextColour,
                      ),
                  onRatingUpdate: (rating) {}),
            ),
            const Gap(5),
            Visibility(
              visible: priceIgnoring,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /*const Text('Price: ',style: TextStyle(
                    color: Colors.black,
                    fontSize: 10,fontWeight: FontWeight.bold,
                  )),*/
                  Text(
                    item.sizes![0].mainPrice.toString(),
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      decoration:TextDecoration.lineThrough,
                      color: Colors.black,
                      fontSize: 11,
                    ),
                  ),
                  SizedBox(
                      height: 15,
                      child: Image.asset(Media.takaPng)),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               /* const Text('Price: ',style: TextStyle(
                    color: Colors.black,
                    fontSize: 13,fontWeight: FontWeight.bold
                )),*/
                Text(
                  item.sizes![0].discountPrice.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                  ),
                ),
                SizedBox(
                    height: 15,
                    child: Image.asset(Media.takaPng)),
              ],
            )

          ],
        ),
      ),
    );
  }
}
