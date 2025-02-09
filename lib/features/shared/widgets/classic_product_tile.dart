import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ClassicProductTile extends StatelessWidget {
  const ClassicProductTile({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: (context.width/2) -30,
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 228,
                  width: (context.width/2)-30,
                  decoration: BoxDecoration(
                    color: const Color(0xfff0f0f0),
                    borderRadius: BorderRadius.circular(16),
                   // image: DecorationImage(image: NetworkImage(url))
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
