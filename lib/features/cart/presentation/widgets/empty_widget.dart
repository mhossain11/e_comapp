import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:gap/gap.dart';
import '../../../../core/res/media.dart';
import '../../../../core/res/styles/text.dart';
import '../../../shared/widgets/app_bar_bottom.dart';

class BuildEmptyCartState extends StatelessWidget {
  const BuildEmptyCartState({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        text: 'My Cart',
        centerTitle: true,
        showBackArrow: false,
        txtOnPressed: () {},
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Lottie.asset(Media.AnimetEmptyCart, repeat: true),
              const Gap(5),
              Text('Oh! So empty', style: TextStyles.headingSemiBold.grey),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
