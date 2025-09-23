import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:iconly/iconly.dart';

import '../widgets/sliderpiccell.dart';
import 'package:get/get.dart';
import '../../../categories/presentation/controller/category_controller.dart';
import '../../../categories/presentation/screen/banar_screen.dart';
import '../../../categories/presentation/screen/sliderpiccell_screen.dart';
import '../../../categories/presentation/screen/specialCategory_screen.dart';
import '../../../categories/presentation/screen/categories_section.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const path = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CategoryController categoryController = Get.find<CategoryController>();
final GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _refreshKey.currentState?.show();
    });
  }

Future<void> _onRefresh() async {
  await Future.delayed(const Duration(seconds: 2)); // simulate API call
  print('Data refreshed');
  await categoryController.getSpecialCategories();
}

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.white,

        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(IconlyBroken.notification)),
        ],
      ),


      body: RefreshIndicator(
        key:  _refreshKey,
        onRefresh: _onRefresh,
        child: SingleChildScrollView(
          physics:  const BouncingScrollPhysics(),
          child: Column(
            children:[
              const SliderPickCellScreen(),
              const Gap(10),
              const CategoriesSection(),
              const Gap(10),
              SpecialCategoryProductScreen(),
              const Gap(10),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: BannerScreen(),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
