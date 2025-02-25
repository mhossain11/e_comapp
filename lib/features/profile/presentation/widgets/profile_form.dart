/*
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:swift_shop/features/profile/domain/models/user_model.dart';

import '../../../../core/utils/typedefs.dart';
import '../../../shared/widgets/vertical_label_field.dart';
import '../controller/profile_controller.dart';
import '../../domain/model/profilemodel.dart';
import '../controller/profilecontroller.dart';

class ProfileForm extends StatefulWidget {
  const ProfileForm({
    required this.nameFocusNode,
    required this.nameNotifier,
    required this.changeNotifier,
    required this.updateContainer,
    super.key,
  });

  final ValueNotifier<String> nameNotifier;
  final FocusNode nameFocusNode;
  final ValueNotifier<bool> changeNotifier;
  final DataMap updateContainer;

  @override
  State createState() => _ProfileFormState();
}

class _ProfileFormState extends State<ProfileForm> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late ProfileModel currentUser;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final controller = Get.find<ProfileController>();
   // currentUser = controller.user.value;

    nameController = TextEditingController(text: currentUser.name.trim())
      ..addListener(() {
        widget.nameNotifier.value = nameController.text.trim();
        if (nameController.text.toLowerCase().trim() != currentUser.name.toLowerCase().trim()) {
          widget.changeNotifier.value = true;
          widget.updateContainer['name'] = nameController.text.trim();
        }
      });

    emailController = TextEditingController(text: currentUser.email.trim())
      ..addListener(() {
        if (emailController.text.toLowerCase().trim() != currentUser.email.toLowerCase().trim()) {
          widget.changeNotifier.value = true;
          widget.updateContainer['email'] = emailController.text.trim();
        }
      });

    phoneController = TextEditingController(text: currentUser.phone?.trim())
      ..addListener(() {
        if (phoneController.text.toLowerCase().trim() != currentUser.phone?.toLowerCase().trim()) {
          widget.changeNotifier.value = true;
          widget.updateContainer['phone'] = phoneController.text.trim();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        VerticalLabelField(
          label: 'Full Name',
          focusNode: widget.nameFocusNode,
          controller: nameController,
          hintText: 'Enter your full name',
        ),
        const Gap(15),
        VerticalLabelField(
          label: 'Email',
          controller: emailController,
          hintText: 'Enter your email',
        ),
        const Gap(15),
        VerticalLabelField(
          label: 'Phone',
          controller: phoneController,
          hintText: 'Enter your phone number',
        ),
      ],
    );
  }
}

*/
