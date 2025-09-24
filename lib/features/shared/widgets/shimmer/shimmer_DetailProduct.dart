import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmer(BuildContext context) {
  var media = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child:  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Product Image Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: MediaQuery.of(context).size.width * 0.6,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),

        // Product Name Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 20,
            width: 200,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),

        // Description Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 14,
            width: double.infinity,
            margin: const EdgeInsets.only(right: 50),
            color: Colors.white,
          ),
        ),

        const SizedBox(height: 6),
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 14,
            width: double.infinity,
            margin: const EdgeInsets.only(right: 100),
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        // Size Placeholder
        Row(
          children: List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 50,
                  height: 30,
                  color: Colors.white,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 20),

        // Color Placeholder
        Row(
          children: List.generate(4, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 30),

        // Add to Cart Button Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Review Section Placeholder
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            height: 70,
            width: double.infinity,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}
