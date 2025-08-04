import 'package:e_comapp/features/categories/domain/model/special_categories_model/special_categories_Uid_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/res/styles/colors.dart';
import '../domain/model/specialCategoryProduct_model.dart';

class SpecialItems extends StatelessWidget {
  final SpecialCategoryProductModel item;
  final bool ignoring;
  final bool priceIgnoring;
  const SpecialItems({super.key,
    required this.item,
    required this.ignoring,
    required this.priceIgnoring,
  });


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    // print('P-${media.height * 0.25}');
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        //width: media.width * 0.32,
       // width:  200,
       // height: 256,

        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 3)
              )
            ]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Gap(5),
                if(item.productImage!.isEmpty)
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
                if(item.productImage!.isNotEmpty)
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
                        child: Image.network(
                          '${item.productImage}',
                          // width: media.width * 0.32,
                          height: media.width * 0.40,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                const Gap(5),
                Text(
                  item.productName.toString(),
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colours.lightThemeSecondaryTextColour, fontSize: 13, fontWeight: FontWeight.w700),
                ),
                /*            const Gap(5),
                Text(
                  item.name.toString(),
                  maxLines: 1,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colours.lightThemePrimaryTextColour,
                    fontSize: 11,
                  ),
                ),*/
               // const Gap(5),
               /* Visibility(
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
                ),*/
                const Gap(5),
                Visibility(
                  visible: priceIgnoring,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Price: ',style: TextStyle(
                          color: Colors.black,
                          fontSize: 13,fontWeight: FontWeight.bold
                      )),
                      Text(
                        item.mainPrice.toString(),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}