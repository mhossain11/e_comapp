import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart' show RatingBarIndicator;

class CRatingbar extends StatelessWidget {
  const CRatingbar({
    super.key, required this.rating,
  });
  final int rating;

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
        rating: rating.toDouble(),
        itemSize: 20,
        unratedColor: Colors.grey,
        itemBuilder: (_,__)=> Icon(Icons.star,color: Colors.blue,));
  }
}