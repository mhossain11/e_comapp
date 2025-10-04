import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:iconly/iconly.dart';
import 'package:get/get.dart';
import '../../../categories/presentation/controller/category_controller.dart';
import '../../../categories/presentation/screen/banar_screen.dart';
import '../../../categories/presentation/screen/sliderpiccell_screen.dart';
import '../../../categories/presentation/screen/specialCategory_screen.dart';
import '../../../categories/presentation/screen/categories_section.dart';
import '../widgets/search_bottomsheet.dart';


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

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(IconlyBroken.notification)),
          IconButton(onPressed: (){
            Get.to(SearchView(),
                fullscreenDialog: true,
                transition: Transition.downToUp,
                duration: Duration(milliseconds: 600)
            );
          }, icon: const Icon(IconlyBroken.search)),
        ],
      ),


      body: SingleChildScrollView(
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
    );
  }
}
