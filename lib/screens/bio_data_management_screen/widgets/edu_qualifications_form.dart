import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
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
    DropdownItem(title: 'othersValue'.tr, value: 'others'),
  ];
  final List<DropdownItem> _highestEduQualification = [
    DropdownItem(title: 'ssc'.tr, value: 'ssc'),
    DropdownItem(title: 'hsc'.tr, value: 'hsc'),
    DropdownItem(title: 'degree'.tr, value: 'degree'),
    DropdownItem(title: 'masters'.tr, value: 'masters'),
    DropdownItem(title: 'diploma'.tr, value: 'diploma'),
    DropdownItem(title: 'bsc'.tr, value: 'bsc'),
    DropdownItem(
        title: 'primaryIslamicEducation'.tr, value: 'primaryIslamicEducation'),
    DropdownItem(title: 'othersValue'.tr, value: 'others'),
  ];

  final _eduQualificationsController = Get.find<EduQualificationsController>();

  @override
  void initState() {
    super.initState();
    final _eduQualificationData = Get.find<CurrentUserBioDataController>()
        .currentUserBioData
        ?.data
        ?.biodata
        ?.educationInfo;

    if (_eduQualificationData != null) {
      _assignData(_eduQualificationData);
    } else {
      _clearData();
    }
  }

  void _assignData(dynamic _eduQualificationData) {
    _eduQualificationsController.selectedEduMethod =
        _eduMethod.firstWhereOrNull(
            (item) => item.value == _eduQualificationData.educationMethod);

    if (_eduQualificationsController.selectedEduMethod?.value == "others") {
      _eduQualificationsController.isOtherEduMethod = true;
      _eduQualificationsController.otherEduMethodController.text =
          _eduQualificationData.othersEducationMethod ?? '';
    } else {
      _eduQualificationsController.isOtherEduMethod = false;
      _eduQualificationsController.otherEduMethodController.clear();
    }

    _eduQualificationsController.selectedHighestEduQualification =
        _highestEduQualification.firstWhereOrNull(
            (item) => item.value == _eduQualificationData.highestEducation);
    if (_eduQualificationsController.selectedHighestEduQualification?.value ==
        "others") {
      _eduQualificationsController.isOtherHighestEduMethod = true;
      _eduQualificationsController.otherHighestEduMethodController.text =
          _eduQualificationData.othersHighestEducation ?? '';
    } else {
      _eduQualificationsController.isOtherHighestEduMethod = false;
      _eduQualificationsController.otherHighestEduMethodController.clear();
    }

    _eduQualificationsController.resultController.text =
        _eduQualificationData.result ?? '';
    _eduQualificationsController.passingYearController.text =
        _eduQualificationData.passingYear ?? '';
    _eduQualificationsController.institutionController.text =
        _eduQualificationData.institutionName ?? '';
    _eduQualificationsController.othersController.text =
        _eduQualificationData.otherEducation ?? '';
    _eduQualificationsController.religiousEduController.text =
        _eduQualificationData.religiousEducation ?? '';
  }

  void _clearData() {
    _eduQualificationsController.selectedEduMethod = null;
    _eduQualificationsController.otherEduMethodController.clear();
    _eduQualificationsController.selectedHighestEduQualification = null;
    _eduQualificationsController.otherHighestEduMethodController.clear();
    _eduQualificationsController.resultController.clear();
    _eduQualificationsController.passingYearController.clear();
    _eduQualificationsController.institutionController.clear();
    _eduQualificationsController.othersController.clear();
    _eduQualificationsController.religiousEduController.clear();
  }

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
                if (newValue?.value == "others") {
                  _eduQualificationsController.isOtherEduMethod = true;
                } else {
                  _eduQualificationsController.isOtherEduMethod = false;
                  _eduQualificationsController.otherEduMethodController.clear();
                }
              });
            },
          ),
          // Display text field if "Other" is selected for Educational Method
          if (_eduQualificationsController.isOtherEduMethod)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomTextFormField(
                controller:
                    _eduQualificationsController.otherEduMethodController,
                validator: (value) {
                  if (_eduQualificationsController.isOtherEduMethod &&
                      (value == null || value.isEmpty)) {
                    return "otherEduMethodHint".tr;
                  }
                  return null;
                },
                hintText: 'otherEduMethodHint'.tr,
              ),
            ),
          Gap(16.h),

          InputTitleText(title: 'highestEducationalTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _eduQualificationsController.selectedHighestEduQualification,
            validator: dropdownValidator,
            items: _highestEduQualification,
            onChanged: (newValue) {
              setState(() {
                _eduQualificationsController.selectedHighestEduQualification =
                    newValue;
                if (newValue?.value == "others") {
                  _eduQualificationsController.isOtherHighestEduMethod = true;
                } else {
                  _eduQualificationsController.isOtherHighestEduMethod = false;
                  _eduQualificationsController.otherHighestEduMethodController
                      .clear();
                }
              });
            },
          ),
          // Display text field if "Other" is selected for Highest Educational Method
          if (_eduQualificationsController.isOtherHighestEduMethod)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomTextFormField(
                controller: _eduQualificationsController
                    .otherHighestEduMethodController,
                validator: (value) {
                  if (_eduQualificationsController.isOtherHighestEduMethod &&
                      (value == null || value.isEmpty)) {
                    return "otherHighestEduMethodHint".tr;
                  }
                  return null;
                },
                hintText: 'otherHighestEduMethodHint'.tr,
              ),
            ),
          Gap(16.h),

          InputTitleText(title: 'passingYearTitle'.tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _eduQualificationsController.passingYearController,
              keyBoardType: TextInputType.phone),
          Gap(16.h),

          InputTitleText(title: 'resultTitle'.tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _eduQualificationsController.resultController),
          Gap(16.h),

          InputTitleText(title: 'institutionNameTitle'.tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _eduQualificationsController.institutionController),
          Gap(16.h),

          InputTitleText(title: 'othersEducationTitle'.tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _eduQualificationsController.othersController,
              maxLines: 5),
          Gap(4.h),
          Text('othersEducationNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(
              title: 'religiousEducationTitle'.tr, isRequired: false),
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
