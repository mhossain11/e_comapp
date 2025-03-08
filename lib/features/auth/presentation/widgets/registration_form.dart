

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_formatter/formatters/formatter_utils.dart';
import 'package:flutter_multi_formatter/formatters/phone_input_formatter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/dropdownbutton.dart';
import '../../../shared/widgets/input_field.dart';
import '../../../shared/widgets/rounded_button.dart';
import '../../../shared/widgets/vertical_label_field.dart';
import '../../utils/authUtils.dart';
import '../controller/auth_controllere.dart';


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneController = TextEditingController();
 // final genderController = TextEditingController();
  final countryController = TextEditingController();
  final obscurePasswordNotifier = ValueNotifier(true);
  final obscureConfirmPasswordNotifier = ValueNotifier(true);
  final String gender='';

  final countryNotifier = ValueNotifier<Country?>(null);

  final AuthController _authController = Get.find<AuthController>();

  @override
  void initState() {
    super.initState();
    countryNotifier.addListener(() {
      if (countryNotifier.value == null) {
        phoneController.clear();
        countryController.clear();
      } else {
        countryController.text = countryNotifier.value!.phoneCode;
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
   // genderController.dispose();
    obscurePasswordNotifier.dispose();
    obscureConfirmPasswordNotifier.dispose();

    super.dispose();
  }

  void pickCountry() {
    AuthUtils.pickCountry(context, onSelect: (country) {
      if (country == countryNotifier.value) return;
      countryNotifier.value = country;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          VerticalLabelField(
            label: 'First Name',
            hintText: 'Enter your First name',
            controller: firstNameController,
            keyboardType: TextInputType.name,
          ),
          const Gap(20),
          VerticalLabelField(
            label: 'Last Name',
            hintText: 'Enter your Last name',
            controller: lastNameController,
            keyboardType: TextInputType.name,
          ),
          const Gap(20),
          VerticalLabelField(
            label: 'Email',
            hintText: 'Enter your email',
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: countryNotifier,
            builder: (_, country, __) {
              return VerticalLabelField(
                label: 'Phone',
                enabled: country != null,
                hintText: 'Enter your phone number',
                keyboardType: TextInputType.phone,
                controller: phoneController,
                validator: (value) {
                  if (!isPhoneValid(
                    value!,
                    defaultCountryCode: country?.countryCode,
                  )) {
                    return 'Invalid Phone number';
                  }
                  return null;
                },
                inputFormatters: [
                  PhoneInputFormatter(
                    defaultCountryCode: country?.countryCode,
                  ),
                ],
                mainFieldFlex: 3,
                prefix: InputField(
                  controller: countryController,
                  readOnly: true,
                  contentPadding: const EdgeInsets.only(left: 10),
                  suffixIcon: GestureDetector(
                    onTap: pickCountry,
                    child: const Icon(Icons.arrow_drop_down),
                  ),
                  validator: (value) {
                    if (!isPhoneValid(
                      phoneController.text,
                      defaultCountryCode: country?.countryCode,
                    )) {
                      return '';
                    }
                    return null;
                  },
                ),
              );
            },
          ),
        //  const Gap(20),
         // DropDownButtons(dropdownValue: gender,),
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
                    obscurePasswordNotifier.value =
                        !obscurePasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                obscureText: value,
              );
            },
          ),
          const Gap(20),
          ValueListenableBuilder(
            valueListenable: obscureConfirmPasswordNotifier,
            builder: (_, value, __) {
              return VerticalLabelField(
                label: 'Confirm Password',
                hintText: 'Re-enter your password',
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                suffixIcon: GestureDetector(
                  onTap: () {
                    obscureConfirmPasswordNotifier.value =
                        !obscureConfirmPasswordNotifier.value;
                  },
                  child: Icon(
                    value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
                obscureText: value,
                validator: (value) {
                  if (value! != passwordController.text.trim()) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              );
            },
          ),
          const Gap(40),
          RoundedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                FocusManager.instance.primaryFocus?.unfocus();
                final phoneNumber = phoneController.text.trim();
                final country = countryNotifier.value!;
                final formattedNumber ='+${country.phoneCode}${toNumericString(phoneNumber)}';
                final email = emailController.text.trim();
                final password = passwordController.text.trim();
                final confirmPassword = confirmPasswordController.text.trim();
                final firstName = firstNameController.text.trim();
                final lastName = lastNameController.text.trim();


                await _authController.register(
                    firstname: firstName,
                    lastname: lastName,
                    email: email,
                    phone: phoneNumber,
                    password: password,
                    confirmPassword: confirmPassword
                );
              }
            },
            text: 'Sign Up',
          ),

          /*GetBuilder<AuthController>(builder: (authController) {
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
          }),*/
        ],
      ),
    );
  }
}
