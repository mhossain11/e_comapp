import 'package:e_comapp/core/extensions/text_style_extensions.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../../core/res/styles/text.dart';
import '../../../shared/widgets/rounded_button.dart';
import '../../../shared/widgets/vertical_label_field.dart';
import '../controller/auth_controllere.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obscurePasswordNotifier = ValueNotifier(true);

  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    obscurePasswordNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          VerticalLabelField(
            label: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(20),
          ValueListenableBuilder(
              valueListenable: obscurePasswordNotifier,
              builder: (_, value, __) {
                return VerticalLabelField(
                  label: 'Password',
                  hintText: 'Enter your password',
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      obscurePasswordNotifier.value = !obscurePasswordNotifier.value;
                    },
                    child: Icon(
                      value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  obscureText: value,
                );
              }),
          const Gap(20),
          SizedBox(
            width: double.maxFinite,
            child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    // context.push(ForgotPasswordScreen.path);
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyles.paragraphSubTextRegular1.primary,
                  ),
                )),
          ),
          const Gap(40),
          RoundedButton(
              onPressed: () async {
                // context.go('/', extra: 'home');
                if (formKey.currentState!.validate()) {
                  FocusManager.instance.primaryFocus?.unfocus();
                  final emailAddress = emailController.text.trim();

                  final password = passwordController.text.trim();

                  await _authController.login(
                    email: emailAddress,
                    password: password,
                  );
                }
              },
              text: 'Sign In'),
          GetBuilder<AuthController>(builder: (authController) {
            if (authController.isLoading.value) {
              return const CircularProgressIndicator(); // Show circular progress when loading
            }
             if (authController.errorMessage.value != null) {
               return Text(
                 authController.errorMessage.value!,
                 style: const TextStyle(color: Colors.red),
               );
             }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
