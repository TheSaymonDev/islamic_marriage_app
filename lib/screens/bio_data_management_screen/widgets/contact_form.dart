import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/contact_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {

  final _contactController = Get.find<ContactController>();

  @override
  void initState() {
    super.initState();
    final _contactData = Get.find<MyBioDataController>().currentUser!.data!.biodata!.contactInfo;

    if (_contactData != null) {
      _contactController.nameController.text = _contactData.groomName ?? '';
      _contactController.guardiansMobileController.text = _contactData.guardianMobile ?? '';
      _contactController.relationshipController.text = _contactData.relationShipWithGuardian ?? '';
      _contactController.emailController.text = _contactData.email ?? '';
    } else {
      _contactController.nameController.text = '';
      _contactController.guardiansMobileController.text = '';
      _contactController.relationshipController.text = '';
      _contactController.emailController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _contactController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "brideOrGroomNameTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _contactController.nameController
          ),
          Gap(4.h),
          Text('brideOrGroomNameNB'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "guardiansPhoneTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: phoneValidator,
              keyBoardType: TextInputType.phone,
              controller: _contactController.guardiansMobileController),
          Gap(4.h),
          Text(
              'guardiansPhoneNB'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "relationshipWithGuardianTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _contactController.relationshipController),
          Gap(16.h),

          InputTitleText(title: "emailToReceivedBioDataTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: emailValidator,
              controller: _contactController.emailController),
          Gap(4.h),
          Text(
              "emailToReceivedBioDataNB".tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }
}
