
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/circularContainer.dart';
<<<<<<< HEAD
import '../../controllers/homeController.dart';
=======
import '../controllers/homeController.dart';
>>>>>>> e751dd7 ( product details screen change)
import '../../domain/model/sliderModel.dart';


class SliderPickCell extends StatelessWidget {
  const SliderPickCell({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var controller = Get.find<HomeController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: CarouselSlider(
            options: CarouselOptions(
                height: 185,
                autoPlay: true,
                viewportFraction: 1,
                enlargeCenterPage: true,
                enlargeStrategy: CenterPageEnlargeStrategy.scale,
                onPageChanged: (index, _) {
                  controller.updatePageIndicator(index);
                }),
            items: sliderList
                .map((item) => Center(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            item.img,
                            fit: BoxFit.fitWidth,
                          )),
                    ))
                .toList(),
          ),
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < sliderList.length; i++)
                CircularContainer(
                  width: 5,
                  height: 4,
                  color: controller.sliderIndex.value == i
                      ? Colors.blue
                      : Colors.grey,
                  margin: const EdgeInsets.only(right: 10),
                )
            ],
          ),
        )
      ],
    );
  }
}
