import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../widgets/registration_form.dart';
import 'login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const path = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyles.headingSemiBold,
        ),
        bottom: const AppBarBottom(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              children: [
                Text(
                  'Create an Account',
                  style: TextStyles.headingBold3.adaptiveColour(context),
                ),
                Text(
                  'Create a Ecommerce Account',
                  style: TextStyles.paragraphSubTextRegular1.grey,
                ),
                const Gap(40),
                const RegistrationForm(),
              ],
            ),
          ),
          const Gap(8),
          RichText(
            text: TextSpan(
              text: "Already have an account? ",
              style: TextStyles.paragraphSubTextRegular3.grey,
              children: [
                TextSpan(
                  text: 'Sign In',
                  style:
                      const TextStyle(color: Colours.lightThemePrimaryColour),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                    //  Get.toNamed(LoginScreen.path);
                      Get.to(() => const LoginScreen());
                    },
                ),
              ],
            ),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
