import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductPriceText extends StatelessWidget {
  const ProductPriceText({super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLines=1,
    this.isLarge = false,
    this.lineThrough = false});

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
    maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
      ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
      : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
    );
  }
}


class PriceProductCountText extends StatelessWidget {
  const PriceProductCountText({super.key,
    this.currencySign = '\$',
    required this.price,
    this.maxLines=1,
    this.isLarge = false,
    this.lineThrough = false,
    this.quantity =0,
    this.mainPrice=1000
  });

  final String currencySign, price;
  final int maxLines;
  final bool isLarge;
  final bool lineThrough;
  final int quantity ;
  final double? mainPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$currencySign$price',
          maxLines: maxLines,
          overflow: TextOverflow.ellipsis,
          style: isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.titleLarge!.apply(decoration: lineThrough ? TextDecoration.lineThrough : null),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(' $currencySign$price',
                maxLines: maxLines,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 14,color: Colors.grey,decoration:TextDecoration.lineThrough,decorationColor: Colors.grey, )
            ),
            Text('X $quantity',
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14,color: Colors.grey,fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
