import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BottomBarShimmer extends StatelessWidget {
  const BottomBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        color: Colors.green.shade50,
        surfaceTintColor: Colors.green.shade50,
        shadowColor: Colors.green.shade100,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.green.shade50),
        ),
        elevation: 5,
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: SizedBox(
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      children: [
                        Container(height: 14, width: 40, color: Colors.white),
                        const SizedBox(width: 8),
                        Container(height: 14, width: 30, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 14, width: 40, color: Colors.white),
                          const SizedBox(width: 6),
                          Container(height: 14, width: 50, color: Colors.white),
                          const SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(height: 12, width: 60, color: Colors.white),
                          const SizedBox(width: 6),
                          Container(height: 12, width: 40, color: Colors.white),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
