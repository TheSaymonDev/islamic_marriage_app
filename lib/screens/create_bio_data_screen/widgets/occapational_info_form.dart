import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/occupational_info_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class OccupationalInfoForm extends StatefulWidget {
  const OccupationalInfoForm({super.key});

  @override
  State<OccupationalInfoForm> createState() =>
      _OccupationalInfoFormState();
}

class _OccupationalInfoFormState extends State<OccupationalInfoForm> {
  final List<String> _occupations = [
    'imam',
    'madrasaTeacher',
    'teacher',
    'doctor',
    'engineer',
    'businessman',
    'governmentGob',
    'privateJob',
    'freelancer',
    'student',
    'expatriate',
    'others',
    'noProfession',
  ];
  final OccupationalInfoController _occupationalInfoController =
      Get.find<OccupationalInfoController>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _occupationalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: "Occupation"),
          Gap(4.h),
          CustomDropdownButton(
              validator: dropdownValidator,
              items: _occupations,
              onChanged: (newValue) {
                setState(() {
                  _occupationalInfoController.selectedOccupation = newValue;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: "Description of Profession"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value) =>
                notEmptyValidator(value, 'Please describe your occupation'),
            hintText: "Description",
            controller: _occupationalInfoController.descriptionController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
              'You may write where your working place is, which company you are working in whether your earnings are halal or not etc.',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
            title: "Monthly Income",
            isRequired: false,
          ),
          Gap(4.h),
          CustomTextFormField(
              keyBoardType: TextInputType.phone,
              validator: (value) =>
                  notEmptyValidator(value, 'Please enter your monthly income'),
              hintText: "Income",
              controller: _occupationalInfoController.incomeController),
          Gap(16.h),
        ],
      ),
    );
  }
}
