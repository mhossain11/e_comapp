import 'package:e_comapp/features/wishlist/presentation/controller/wishlist_controller.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import '../../../shared/widgets/empty_data.dart';
import '../widgets/wishlist_product_title.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});
  static const path = '/wishList';

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  final WishListController wishController = Get.find<WishListController>();
  Future<void> getUserWishlist() async {
    await wishController.fetchGetWishList();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
        getUserWishlist();
    });
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WishListController>(
        builder: (controller){
          return RefreshIndicator(
              onRefresh: getUserWishlist,
          child: Scaffold(
            appBar: AppBar(
                title: const Text('Saved Items'),
                centerTitle: true,
                automaticallyImplyLeading: false
            ),

            body: SafeArea(
                child: Builder(
                    builder: (context){
                      if(controller.isLoading.value){
                       /* return const Center(
                          child: CircularProgressIndicator.adaptive(
                            backgroundColor: Colors.lightBlue,
                          ),
                        );*/
                        return ListView.separated(
                          padding: const EdgeInsets.all(16),
                          itemBuilder: (context,index){
                            final product = controller.wishList[index];
                            return WishlistProductTile(product);
                          },
                          separatorBuilder: (_,__)=> const Gap(20),
                          itemCount: controller.wishList.length,
                        );
                      }else if(controller.wishList.isEmpty){
                        return const EmptyData('No Saved Product');
                      }/*else if(controller.errorMessage.isNotEmpty){
                        return Center(child: Text(
                            controller.errorMessage.value),);
                      }*/

                      return ListView.separated(
                        padding: const EdgeInsets.all(16),
                        itemBuilder: (context,index){
                          final product = controller.wishList[index];
                          return WishlistProductTile(product);
                        },
                        separatorBuilder: (_,__)=> const Gap(20),
                        itemCount: controller.wishList.length,
                      );

                    })
            ),
          ),
          );
        });
  }
}
