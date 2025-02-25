import 'package:flutter/material.dart';
import '../../../categories/domain/model/product_color.dart';

class ColourPalette extends StatelessWidget {
  final List<ProductColor> colors;

  const ColourPalette({required this.colors});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Adjust for more/fewer colors per row
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: colors.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent, // Background color
              radius: 25,
              backgroundImage: NetworkImage(colors[index].image!), // Use color image
            ),
            const SizedBox(height: 5),
            Text(
              colors[index].name!,
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      },
    );
  }
}

