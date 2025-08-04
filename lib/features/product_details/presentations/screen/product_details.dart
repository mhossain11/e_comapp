import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/core/extensions/widget_extensions.dart';
<<<<<<< HEAD
=======
import 'package:e_comapp/features/product_details/presentations/widget/selected_imagecolor.dart';
>>>>>>> e751dd7 ( product details screen change)
import 'package:e_comapp/features/shared/widgets/dotted_line.dart';
import 'package:e_comapp/features/product_details/presentations/widget/size_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
<<<<<<< HEAD
import '../../../../core/app/cache/cache_helper.dart';
import '../../../../core/di/injection_container.main.dart';
=======
import '../../../../core/res/styles/colors.dart';
>>>>>>> e751dd7 ( product details screen change)
import '../../../../core/res/styles/text.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../cart/presentation/controller/cart_controller.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../../../shared/widgets/roundedImage.dart';
import '../../../shared/widgets/rounded_button.dart';
<<<<<<< HEAD
import '../../../wishlist/presentation/widgets/favorite_Icon.dart';
import '../controller/product_details_controller.dart';
import '../widget/color_pallete_widget.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key,
    required this.productId,});

  final String productId;
  static const path='/product-detail';
=======
import '../../../shared/widgets/two_side_rounded_button.dart';
import '../../../wishlist/presentation/widgets/favorite_Icon.dart';
import '../controller/product_details_controller.dart';
import '../widget/product_image.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key, required this.productId});

  final String productId;
  static const path = '/product-detail';

>>>>>>> e751dd7 ( product details screen change)
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
<<<<<<< HEAD

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
=======
  final ProductDetailsController productController =
      Get.find<ProductDetailsController>();
  final CartController cartController = Get.find<CartController>();
  String? selectedSize;
  Color? selectedColour;
  bool addToCart = false;
  final int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    CoreUtils.postFrameCall(
      () => productController.fetchProduct(widget.productId),
    );
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
              title:
                  controller.isLoading.value
                      ? SizedBox(
                        width: 200,
                        height: 50,
                        child: Shimmer.fromColors(
                          baseColor: Colors.yellow,
                          highlightColor: Colors.grey,
                          child: const Text(
                            'Shimmer',
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                      : Text(
                        '${controller.selectedProduct.value?.name.toString()}',
                      ),
              bottom: const AppBarBottom(),
              actions: [
                //  if (controller.selectedProduct.value != null)
                //  FavoriteIcon(productList: controller.selectedProduct.value!),
              ],
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
>>>>>>> e751dd7 ( product details screen change)
                    return Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
<<<<<<< HEAD
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
=======
                                //Image
                                /*Padding(
                                      padding: const EdgeInsets.all(10.0),

                                      child: Center(
                                          child: RoundedImage(
                                            isNetworkImage: true,
                                            imageUrl: controller.selectedProduct.value!.images![0].image.toString(),
                                            height: media.width * 0.70,
                                            fit: BoxFit.fitWidth,)
                                      ),
                                    ),*/
                                ProductImage(
                                  imageProducts:
                                      controller.selectedProduct.value!.images!,
                                ),
                                Gap(30),
                                //name
                                Center(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      '${controller.selectedProduct.value?.name.toString()}',
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),


                                /*
                                //Dot Line
                                Padding(

                                      padding: const EdgeInsets.only(left: 5.0,right: 10.0,top: 5),
                                      child: CustomPaint(
                                        size: const Size(double.infinity, 1),
                                        painter: DottedLine(width: 1, spacing: 5, color: Colors.grey),
                                      ),
                                    ),*/
                                Gap(10),
                                //description
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Description:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Gap(5),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    '${controller.selectedProduct.value!.description}',
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                                Gap(15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [


                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0,top: 15),
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.center,
                                          color: Colors.white,

                                          child: TwoSideRoundedButton(
                                              text: '-',fontSize: 21,
                                              press: (){
                                                //  cartController.decrement(widget.item,widget.item.productUid);
                                                print('-');
                                              }),
                                        ),
                                      ),
                                    ),

                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 15),
                                        child: Text("10",
                                          style: const TextStyle(fontSize:27,fontWeight: FontWeight.bold),),
                                      ),
                                    ),
                                    //+
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5.0,top: 15),
                                        child: Container(
                                          width: 100,
                                          alignment: Alignment.center,
                                          color: Colors.white,

                                          child: TwoSideRoundedButton(text: '+',fontSize: 21,
                                              press: (){
                                                // cartController.increment(widget.item,widget.item.productUid);
                                                //  cartController.addToCarts(widget.item);

                                                print('+');
                                              }),
                                        ),
                                      ),
                                    ),
                                    Gap(5),

                                  ],
                                ),

                                //Size
                                Gap(10),
                                const Padding(
                                  padding: EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    'Size:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
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

                                //Color
                                const Padding(
                                  padding: EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    'Colors:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                if (product.colors != null &&
                                    product.colors!.isNotEmpty) ...[
                                  SelectedImageColors(
                                    colors: product.colors!,
                                    spacing: 8,
                                    isActive:
                                        _selectedIndex ==
                                        product.colors![0].image!.length,
                                    onSelect: (index) {
                                      setState(() {
                                        int _selectedIndex =
                                            product.colors![0].image!.length;
                                      });
                                    },
                                    radius: 28,
                                  ),
                                ],
                              ],
                            ),
                            //Favorite Icon
                            Positioned(
                              right: 0,
                              child: FavoriteIcon(productList: product),
                            ),
                          ],
                        ),
                        //Button
                        Padding(
                          padding: const EdgeInsets.all(
                            20,
                          ).copyWith(bottom: 40),
>>>>>>> e751dd7 ( product details screen change)
                          child: GetBuilder<CartController>(
                            builder: (cartController) {
                              return RoundedButton(
                                height: 50,
                                onPressed: () {
<<<<<<< HEAD
                                  if (product.colors!.isNotEmpty && selectedColour == null) {
=======
                                  /* if (product.colors!.isNotEmpty && selectedColour == null) {
>>>>>>> e751dd7 ( product details screen change)
                                    CoreUtils.showSnackBar(
                                      context,
                                      message: 'Pick a colour',
                                      backgroundColour: Colors.red.withOpacity(.8),
                                    );
                                    return;
<<<<<<< HEAD
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
=======
                                  } else*/
                                  if (product.sizes!.isNotEmpty &&
                                      selectedSize == null) {
                                    CoreUtils.showSnackBar(
                                      context,
                                      message: 'Pick a size',
                                      backgroundColour: Colors.red.withOpacity(
                                        .8,
                                      ),
                                    );
                                    return;
                                  } else {
                                    print(addToCart);
                                    print('added');
                                    cartController.addToCart(
                                      productUid: product.uid!,
                                      imageUid: product.images![0].uid!,
                                      sizeUid: product.sizes![0].uid!,
                                      colorUid: product.colors![0].uid!,
                                      quantity: cartController.quantity.value,
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
>>>>>>> e751dd7 ( product details screen change)
                              ).loading(cartController.isAddingToCart.value);
                            },
                          ),
                        ),
<<<<<<< HEAD
                      ],

                    );
                }
                return const SizedBox.shrink();
              }

              ),
            ),
          );

        }
=======


                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          );
        }
      },
>>>>>>> e751dd7 ( product details screen change)
    );
  }
}
