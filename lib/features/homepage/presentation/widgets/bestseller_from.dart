
import 'package:e_comapp/features/categories/domain/model/Products.dart';
import 'package:flutter/material.dart';
import '../../../../core/res/styles/colors.dart';
import '../../domain/model/bestsellerModel.dart';

import 'items.dart';

import '../../../categories/widgets/categoriesProduct_items.dart';



class SellerItemFrom extends StatelessWidget {
  final String txt;
  final void Function()? onPressed;
  final int itemCount;
  final List<Products> items;
  final bool priceIgnoring;
  final bool rating;
  const SellerItemFrom(
      {super.key,
      required this.onPressed,
      required this.txt,
      required this.itemCount,
      required this.items,
      required this.rating,
        this.priceIgnoring = true});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 10.0),
                child: Text(
                  txt,
                  style: const TextStyle(
                      color: Colours.darkThemeDarkSharpColour,
                      fontSize: 22,
                      fontWeight: FontWeight.w700),
                ),
              ),
               const Padding(
                 padding: EdgeInsets.only(right: 10.0),
                 child: Icon(Icons.arrow_forward,color: Colours.darkThemeBGDark,opticalSize: 4,),
               )
            ],
          ),
        ),
        SizedBox(
          height: rating == false? 320: media.height * .5,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 9),
              itemCount: itemCount,
              itemBuilder: (BuildContext context, int index) {
                var item = items[index];
                return GestureDetector(
                  onTap: (){
                    //'indexItemData':item.id'
                   // Get.toNamed(ProductDetails.path,arguments: {'productItem':item});
                  },
                  child: CategoriesProductItems(

                    item: item,
                    ignoring: rating,
                    priceIgnoring: priceIgnoring,
                  ),
                );
              }),
        )
      ],
    );
  }
}
