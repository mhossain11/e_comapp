import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/extensions/widget_extensions.dart';
import 'package:e_comapp/features/shared/widgets/dotted_line.dart';
import 'package:e_comapp/features/product_details/presentations/widget/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/rounded_button.dart';
import '../../../wishlist/presentation/widgets/favorite_Icon.dart';
import '../controller/product_details_controller.dart';
import '../widget/color_pallete_widget.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key,
    required this.productId,});

  final String productId;
  static const path='/product-detail';
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {

 final ProductDetailsController productController =Get.find<ProductDetailsController>();
 String? selectedSize;
 Color? selectedColour;

 @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
        productController.fetchProduct(widget.productId);
    });
  }


  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return  GetBuilder<ProductDetailsController>(
        builder: (controller){
          return Scaffold(
            appBar: AppBar(
              title:controller.isLoading.value ? SizedBox(
                width: 200,
                height: 50,
                child: Shimmer.fromColors(
                    baseColor: Colors.yellow,
                    highlightColor: Colors.grey,
                              child: const Text('Shimmer',textAlign: TextAlign.start,)),
              )
                      :Text('${controller.selectedProduct.value?.name.toString()}'),
              bottom: const AppBarBottom(),
              actions: [
                  if (controller.selectedProduct.value != null)
                    FavoriteIcon(productList: controller.selectedProduct.value!),
                ],
            ),
            body: SingleChildScrollView(
              child: Builder(
                  builder: (context){
                if(controller.isLoading.value){
                  return  SizedBox(
                    width: 200,
                    height: 200,
                    child: Shimmer.fromColors(
                      baseColor: Colors.yellow,
                      highlightColor: Colors.grey,
                      child: const Text(''),),);
                }else if(controller.selectedProduct.value !=null){
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
                                      child: RoundedImage(
                                        isNetworkImage: true,
                                    imageUrl: controller.selectedProduct.value!.images![0].image.toString(),
                                    height: media.width * 0.70,
                                    fit: BoxFit.fitWidth,)
                                  ),
                                ),

                                Center(child: Text('${controller.selectedProduct.value?.name.toString()}',
                                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
                                  child: CustomPaint(
                                    size: const Size(double.infinity, 1),
                                    painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text('Description:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text( '${ controller.selectedProduct.value!.description}',
                                    style: const TextStyle(fontSize:15,fontWeight: FontWeight.normal),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
                                  child: CustomPaint(
                                    size: const Size(double.infinity, 1),
                                    painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text('Size:',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                                ),
                                if (product.sizes!.isNotEmpty) ...[
                                  const Gap(15),
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
                                  ColourPalette(
                                    colors: product.colors!, radius: 10,

                                  ),



                              ],
                            ),
                            /*Positioned(
                                right: 0,
                                child: FavoriteIcon(productList: product,))*/
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20).copyWith(bottom: 40),
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              return RoundedButton(
                                height: 50,
                                onPressed: () {
                                  if (product.colors!.isNotEmpty && selectedColour == null) {
                                    CoreUtils.showSnackBar(
                                      context,
                                      message: 'Pick a colour',
                                      backgroundColour: Colors.red.withOpacity(.8),
                                    );
                                    return;
                                  } else if (product.sizes!.isNotEmpty && selectedSize == null) {
                                    CoreUtils.showSnackBar(
                                      context,
                                      message: 'Pick a size',
                                      backgroundColour: Colors.red.withOpacity(.8),
                                    );
                                    return;
                                  }

                                 /* cartController.addToCart(
                                    userId: '${sl<CacheHelper>().getUserId()}',
                                    cartProduct: const CartProductModel.empty().copyWith(
                                      productId: product.id,
                                      quantity: 1,
                                      selectedSize: selectedSize,
                                      selectedColour: selectedColour,
                                    ), productUid: '',
                                  );*/
                                },
                                text: 'Add to Cart',
                                textStyle: TextStyles.buttonTextHeadingSemiBold.copyWith(fontSize: 16).white,
                              ).loading(cartController.isAddingToCart.value);
                            },
                          ),
                        ),
                      ],

                    );
                }
                return const SizedBox.shrink();
              }

              ),
            ),
          );

        }
    );
  }
}
