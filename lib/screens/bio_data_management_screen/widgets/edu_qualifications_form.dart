import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class EduQualificationsForm extends StatefulWidget {
  const EduQualificationsForm({super.key});

  @override
  State<EduQualificationsForm> createState() => _EduQualificationsFormState();
}

class _EduQualificationsFormState extends State<EduQualificationsForm> {
  final List<DropdownItem> _eduMethod = [
    DropdownItem(title: 'general'.tr, value: 'general'),
    DropdownItem(title: 'alia'.tr, value: 'alia'),
    DropdownItem(title: 'qawami'.tr, value: 'qawami'),
    DropdownItem(title: 'vocational'.tr, value: 'vocational'),
  ];
  final List<DropdownItem> _highestEduQualification = [
    DropdownItem(title: 'ssc'.tr, value: 'ssc'),
    DropdownItem(title: 'hsc'.tr, value: 'hsc'),
    DropdownItem(title: 'degree'.tr, value: 'degree'),
    DropdownItem(title: 'masters'.tr, value: 'masters'),
    DropdownItem(title: 'diploma'.tr, value: 'diploma'),
    DropdownItem(title: 'bsc'.tr, value: 'bsc'),
    DropdownItem(title: 'primaryIslamicEducation'.tr, value: 'primaryIslamicEducation'),
  ];
  final List<DropdownItem> _result = [
    DropdownItem(title: 'aPlus'.tr, value: 'A+'),
    DropdownItem(title: 'a'.tr, value: 'A'),
    DropdownItem(title: 'aMinus'.tr, value: 'A-'),
    DropdownItem(title: 'b'.tr, value: 'B'),
    DropdownItem(title: 'C'.tr, value: 'C'),
    DropdownItem(title: 'D'.tr, value: 'D'),
  ];

  @override
  void initState() {
    super.initState();
    final _eduQualificationData = Get.find<MyBioDataController>().currentUser?.data?.biodata?.educationInfo;

    if (_eduQualificationData != null) {
      _eduQualificationsController.selectedEduMethod = _eduMethod.firstWhereOrNull((item) => item.value == _eduQualificationData.educationMethod);
      _eduQualificationsController.selectedHighestEduQualification = _highestEduQualification.firstWhereOrNull((item) => item.value == _eduQualificationData.highestEducation);
      _eduQualificationsController.selectedResult = _result.firstWhereOrNull((item) => item.value == _eduQualificationData.result);
      _eduQualificationsController.passingYearController.text = _eduQualificationData.passingYear ?? '';
      _eduQualificationsController.institutionController.text = _eduQualificationData.institutionName ?? '';
      _eduQualificationsController.othersController.text = _eduQualificationData.otherEducation ?? '';
      _eduQualificationsController.religiousEduController.text = _eduQualificationData.religiousEducation ?? '';
    } else {
      _eduQualificationsController.selectedEduMethod = null;
      _eduQualificationsController.selectedHighestEduQualification = null;
      _eduQualificationsController.selectedResult = null;
      _eduQualificationsController.passingYearController.text = '';
      _eduQualificationsController.institutionController.text = '';
      _eduQualificationsController.othersController.text = '';
      _eduQualificationsController.religiousEduController.text = '';
    }
  }
  final _eduQualificationsController = Get.find<EduQualificationsController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _eduQualificationsController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: 'educationalMethodTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _eduQualificationsController.selectedEduMethod,
              validator: dropdownValidator,
              items: _eduMethod,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedEduMethod = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: 'highestEducationalTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _eduQualificationsController.selectedHighestEduQualification,
              validator: dropdownValidator,
              items: _highestEduQualification,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedHighestEduQualification = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: 'passingYearTitle'.tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _eduQualificationsController.passingYearController,
            keyBoardType: TextInputType.phone
          ),
          Gap(16.h),

          InputTitleText(title: 'resultTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _eduQualificationsController.selectedResult,
              validator: dropdownValidator,
              items: _result,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedResult = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: 'institutionNameTitle'.tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _eduQualificationsController.institutionController),
          Gap(16.h),

          InputTitleText(
            title: 'othersEducationTitle'.tr,
            isRequired: false
          ),
          Gap(4.h),
          CustomTextFormField(
            controller: _eduQualificationsController.othersController,
            maxLines: 5
          ),
          Gap(4.h),
          Text(
            'othersEducationNB'.tr,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)
          ),
          Gap(16.h),

          InputTitleText(
            title: 'religiousEducationTitle'.tr,
            isRequired: false,
          ),
          Gap(4.h),
          CustomTextFormField(
              controller: _eduQualificationsController.religiousEduController,
          ),
          Gap(16.h),
        ],
      ),
    );
  }
}
