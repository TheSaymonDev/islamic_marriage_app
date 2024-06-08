import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/contact_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final ContactController _contactController = Get.find<ContactController>();
  final _contact = Get.find<MyBioDataController>().myBioData!.contact;

  @override
  void initState() {
    super.initState();
    if (_contact != null) {
      _contactController.nameController.text = _contact.groomName!;
      _contactController.guardiansMobileController.text = _contact.guardianMobile!;
      _contactController.relationshipController.text = _contact.guardianRelationship!;
      _contactController.emailController.text = _contact.email!;
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
          const InputTitleText(title: "Groom's Name"),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            hintText: "Name",
            controller: _contactController.nameController,
          ),
          Gap(4.h),
          Text('Please enter full name',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Guardian's mobile number"),
          Gap(4.h),
          CustomTextFormField(
              validator: mobileValidator,
              keyBoardType: TextInputType.phone,
              hintText: "Mobile",
              controller: _contactController.guardiansMobileController),
          Gap(4.h),
          Text(
              'This number will be given if anyone wants to contact your guardian. After verifying by calling this number, the Bio Data will be approved. If you write the number of your friend, colleague, cousin or yourself here, Bio Data will be permanently banned.',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Relationship with guardian"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Relationship",
              controller: _contactController.relationshipController),
          Gap(16.h),
          const InputTitleText(title: "E-mail to received Bio Data"),
          Gap(4.h),
          CustomTextFormField(
              validator: emailValidator,
              hintText: "Email",
              controller: _contactController.emailController),
          Gap(4.h),
          Text(
              "To avoid unwanted incidents, enter the guardian's email address if possible",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }
}
