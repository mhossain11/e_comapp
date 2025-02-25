import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/features/shared/widgets/roundedContainer.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/res/styles/colors.dart';
import '../../../core/res/styles/sizes_padding.dart';
import '../../categories/domain/model/Products.dart';
import '../../wishlist/presentation/widgets/favorite_Icon.dart';





class Item extends StatelessWidget {
  final Products item;
  final  int index;
  final bool ignoring;
  final bool priceIgnoring;
  const Item({super.key,
    required this.item,
    this.index=0,
    required this.ignoring,
    required this.priceIgnoring,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  (context.width /2)-30,
      padding: const EdgeInsets.all(5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 228,
                width: (context.width / 2)- 30,
                decoration: BoxDecoration(
                  color: const Color(0xfff0f0f0),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage('${item.images![index].image}'),
                  )
                ),
              ),
              /*Positioned(
                  right: 0,
                  child: FavoriteIcon(productList: item,)),*/
              Positioned(
                  left: 0,
                  child: RoundedContainer(
                    radius: SizesPadding.sm,
                    backgroundColor: Colours.primary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: SizesPadding.sm,vertical: SizesPadding.xs),
                    child: Text('25%',style: Theme.of(context).textTheme.labelLarge!.apply(color: Colours.yellow),),
                  ),)
            ],
          ),
          const Gap(5),
          Padding(
            padding: const EdgeInsets.all(5).copyWith(top: 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(item.name!.truncateWithEllipsis(15),
                  maxLines: 1,),
                  const Gap(6),
                ],
              ),
              Text('\$${item.sizes![index].mainPrice}'),

            ],
          ),
          )
        ],
      ),
    );
  }
}
