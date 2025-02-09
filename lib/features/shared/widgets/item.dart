import 'package:e_comapp/core/extensions/string_extensions.dart';
import 'package:e_comapp/core/utils/constants/network_constants.dart';
import 'package:e_comapp/features/categories/domain/model/CategoryModel.dart';
import 'package:e_comapp/features/shared/widgets/roundedContainer.dart';
import 'package:e_comapp/features/wishlist/presentation/widgets/favorite_icon.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../core/res/styles/colors.dart';
import '../../../core/res/styles/sizes_padding.dart';
import '../../categories/domain/model/Products.dart';





class Item extends StatelessWidget {
  final Products items;
  final  int index;
  const Item({super.key, required this.items, required this.index});

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
                      image: NetworkImage('${items.images![index].image}'),
                  )
                ),
              ),
              Positioned(
                  right: 0,
                  child: FavouriteIcon(productId: items.uid!,)),
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
                  Text(items.name!.truncateWithEllipsis(15),
                  maxLines: 1,),
                  const Gap(6),
                ],
              ),
              Text('\$${items.sizes![index].mainPrice}'),

            ],
          ),
          )
        ],
      ),
    );
  }
}
