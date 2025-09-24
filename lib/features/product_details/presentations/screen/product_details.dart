import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/extensions/widget_extensions.dart';
import 'package:e_comapp/features/product_details/presentations/widget/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../core/res/styles/colors.dart';

import '../../../../core/res/styles/text.dart';
import '../../../../core/router/app_router.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../homepage/presentation/widgets/product_image.show.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/rounded_button.dart';

import '../../../wishlist/presentation/widgets/favorite_Icon.dart';
import '../controller/product_details_controller.dart';
import '../widget/color_pallete_widget.dart';


class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final String productId;
  static const path = '/product-detail';


  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


  final ProductDetailsController productController = Get.find<ProductDetailsController>();
  String? selectedSize;
  Color? selectedColour;
  bool addToCart = false;
  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productController.fetchProduct(widget.productId);
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return GetBuilder<ProductDetailsController>(
        builder: (controller) {
          if (controller.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator.adaptive(
                backgroundColor: Colours.lightThemePrimaryColour,
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),

              ),

              body: SingleChildScrollView(
                child: Builder(
                    builder: (context) {
                      if (controller.isLoading.value) {
                        return SizedBox(
                          width: 200,
                          height: 200,
                          child: Shimmer.fromColors(
                            baseColor: Colors.yellow,
                            highlightColor: Colors.grey,
                            child: const Text(''),
                          ),
                        );
                      } else if (controller.selectedProduct.value != null) {
                        final product = controller.selectedProduct.value!;

                        return Column(
                          children: [
                            Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.all(10.0),

                                        child: Center(
                                          child: ProductImage(product: controller.selectedProduct.value!,),
                                      ),
                                      ),

                                      Center(child: Text(
                                        controller.selectedProduct.value!.name.toString(),
                                        maxLines: 2,
                                        style: TextStyle(fontSize: 18.sp,
                                            fontWeight: FontWeight.bold),)),
                                      Gap(15),
                                  //Description
                                       Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text('Description:',
                                          style: TextStyle(fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5.0),
                                        child: Text(
                                          '${ controller.selectedProduct.value!.description}',
                                          style: TextStyle(fontSize: 16.sp,
                                              fontWeight: FontWeight
                                                  .normal),),
                                      ),
                                       Gap(5),
                                    //  Size
                                       Padding(
                                        padding: EdgeInsets.only(left: 5.0),
                                        child: Text('Size:', style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),),
                                      ),
                                      if (product.sizes!.isNotEmpty) ...[
                                        //const Gap(15),
                                        SizePicker(
                                          sizes: product.sizes!,
                                          radius: 28,
                                          canScroll: true,
                                          spacing: 8,
                                          onSelect: (size) {
                                            selectedSize = size;
                                          },
                                        ),


                                      ],
                                      if (product.colors!.isNotEmpty)
                                        Center(
                                          child: ColourPalette(
                                            colors: product.colors!,
                                            radius: 35,
                                            canScroll: true,
                                            spacing: 8,
                                            onSelect: (color) {
                                              selectedColour = color;
                                            },

                                          ),
                                        ),


                                    ],
                                  ),
                                  Positioned(
                                      right: 0,
                                      child: FavoriteIcon(productList: product,)
                                  )
                                ]
                            ),

                            //Button
                            Padding(
                              padding: const EdgeInsets.all(
                                20,
                              ).copyWith(bottom: 40),
                              child: GetBuilder<CartController>(
                                builder: (cartController) {
                                  return RoundedButton(
                                    height: 50,
                                    onPressed: () {
                                      /* if (product.colors!.isNotEmpty && selectedColour == null) {
                                    CoreUtils.showSnackBar(
                                      context,
                                      message: 'Pick a colour',
                                      backgroundColour: Colors.red.withOpacity(.8),
                                    );
                                    return;
                                  } else*/
                                      if (product.sizes!.isNotEmpty &&
                                          selectedSize == null) {
                                        CoreUtils.showSnackBar(
                                          context,
                                          message: 'Pick a size',
                                          backgroundColour: Colors.red
                                              .withOpacity(
                                            .8,),
                                        );
                                        return;
                                      } else {
                                        print('added');
                                        cartController.addToCart(
                                          productUid: product.uid!,
                                          imageUid: product.images![0].uid!,
                                          sizeUid: product.sizes![0].uid!,
                                          colorUid: product.colors![0].uid!,
                                          quantity: cartController.quantity
                                              .value,
                                        );
                                        addToCart = true;
                                        print(addToCart);
                                        return;
                                      }
                                    },
                                    text:
                                    addToCart ? 'Added to Cart' : 'Add to Cart',
                                    textStyle:
                                    TextStyles.buttonTextHeadingSemiBold
                                        .copyWith(fontSize: 16)
                                        .white,
                                  ).loading(
                                      cartController.isAddingToCart.value);
                                },
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5.0, right: 8),
                              child: SizedBox(
                                height: 70,
                                child: Card(
                                  elevation: 5,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Reviews(${productController.reviewList.length})',
                                          style: TextStyle(fontSize: 16,
                                              fontWeight: FontWeight.bold),),
                                      ),
                                      IconButton(onPressed: () {
                                        Get.toNamed(
                                            AppRoutes.productReviewScreen);
                                      }, icon: Icon(Icons.arrow_forward_ios))
                                    ],
                                  ),
                                ),
                              ),
                            )

                          ],

                        );
                      }
                      return const SizedBox.shrink();
                    }

                ),
              ),
            );
          }
        }
    );
  }


}