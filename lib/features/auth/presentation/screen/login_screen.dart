import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:e_comapp/features/auth/presentation/screen/register_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';



import '../../../../core/res/styles/colors.dart';
import '../../../../core/res/styles/text.dart';
import '../../../shared/widgets/app_bar_bottom.dart';
import '../widgets/login_form.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const path = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
          style: TextStyles.headingSemiBold,
        ),
<<<<<<< HEAD
        bottom: const AppBarBottom(),
      ),
=======
        automaticallyImplyLeading: true,
       /* leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),*/
        bottom: const AppBarBottom(),
      ),

>>>>>>> e751dd7 ( product details screen change)
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              children: [
                Text(
                  'Hello!!',
                  style: TextStyles.headingBold3.adaptiveColour(context),
                ),
                Text(
                  'Sign in with your account details',
                  style: TextStyles.paragraphSubTextRegular1.grey,
                ),
                const Gap(40),
                //login form
                const LoginForm()
              ],
            ),
          ),
          const Gap(8),
          RichText(
            text: TextSpan(
                text: "Don't have an account?",
                style: TextStyles.paragraphSubTextRegular3.grey,
                children: [
                  TextSpan(
                      text: 'Create Account',
                      style: const TextStyle(
                          color: Colours.lightThemePrimaryColour),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(() => const RegisterScreen());
                        }),
                ]),
          ),
          const Gap(16),
        ],
      ),
    );
  }
}
