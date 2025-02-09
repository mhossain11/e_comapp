import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../categories/widgets/categories_section.dart';
import '../../domain/model/bestsellerModel.dart';
import '../widgets/bestseller_from.dart';
import '../widgets/category_list_products.dart';
import '../widgets/sliderpiccell.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const path = '/home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SliderPickCell(),
            Gap(10),
            CategoriesSection(),
            Gap(10),
           // CategoryListProducts()

            
        
        
          ],
        ),
      ),
    );
  }
}
