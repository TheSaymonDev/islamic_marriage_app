import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/family_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class FamilyInfoForm extends StatefulWidget {
  const FamilyInfoForm({super.key});

  @override
  State<FamilyInfoForm> createState() => _FamilyInfoFormState();
}

class _FamilyInfoFormState extends State<FamilyInfoForm> {
  final List<DropdownItem> _alive = [
    DropdownItem(title: 'yesAlive'.tr, value: 'yes'),
    DropdownItem(title: 'notAlive'.tr, value: 'no')
  ];

  final List<DropdownItem> _familyIncomeStatus = [
    DropdownItem(title: 'lowerClass'.tr, value: 'lowerClass'),
    DropdownItem(title: 'lowerMiddleClass'.tr, value: 'lowerMiddleClass'),
    DropdownItem(title: 'middleClass'.tr, value: 'middleClass'),
    DropdownItem(title: 'upperMiddleClass'.tr, value: 'upperMiddleClass'),
    DropdownItem(title: 'upperClass'.tr, value: 'upperClass'),
    DropdownItem(title: 'workingClass'.tr, value: 'workingClass'),
    DropdownItem(title: 'wealthy'.tr, value: 'wealthy'),
  ];

  final _familyInfoController = Get.find<FamilyInfoController>();

  @override
  void initState() {
    super.initState();
    final _familyInfoData = Get.find<CurrentUserBioDataController>().currentUserBioData?.data?.biodata?.familyInfo;

    if (_familyInfoData != null) {
      _familyInfoController.fathersNameController.text = _familyInfoData.fatherName ?? '';
      _familyInfoController.selectedFatherAlive = _alive.firstWhereOrNull((item) => item.value == _familyInfoData.fatherAlive);
      _familyInfoController.fathersProfessionController.text = _familyInfoData.fatherOccupation ?? '';
      _familyInfoController.mothersNameController.text = _familyInfoData.motherName ?? '';
      _familyInfoController.selectedMotherAlive = _alive.firstWhereOrNull((item) => item.value == _familyInfoData.motherAlive);
      _familyInfoController.mothersProfessionController.text = _familyInfoData.motherOccupation ?? '';
      _familyInfoController.brotherCountController.text = _familyInfoData.brotherCount ?? '';
      _familyInfoController.brothersInfoController.text = _familyInfoData.brothersInfo ?? '';
      _familyInfoController.sisterCountController.text = _familyInfoData.sisterCount ?? '';
      _familyInfoController.sistersInfoController.text = _familyInfoData.sistersInfo ?? '';
      _familyInfoController.professionOfUnclesController.text = _familyInfoData.uncleAuntOccuption ?? '';
      _familyInfoController.selectedFamilyIncomeStatus = _familyIncomeStatus.firstWhereOrNull((item) => item.value == _familyInfoData.familyStatus);
      _familyInfoController.religiousConditionController.text = _familyInfoData.familyReligiousEnvironment ?? '';
    } else {
      _familyInfoController.fathersNameController.text = '';
      _familyInfoController.selectedFatherAlive = null;
      _familyInfoController.fathersProfessionController.text = '';
      _familyInfoController.mothersNameController.text = '';
      _familyInfoController.selectedMotherAlive = null;
      _familyInfoController.mothersProfessionController.text = '';
      _familyInfoController.brotherCountController.text = '';
      _familyInfoController.brothersInfoController.text = '';
      _familyInfoController.sisterCountController.text = '';
      _familyInfoController.sistersInfoController.text = '';
      _familyInfoController.professionOfUnclesController.text = '';
      _familyInfoController.selectedFamilyIncomeStatus = null;
      _familyInfoController.religiousConditionController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _familyInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "fathersNameTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            controller: _familyInfoController.fathersNameController,
            validator: requiredValidator,
          ),
          Gap(4.h),
          Text('onlyForAuthority'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "fatherAliveTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _familyInfoController.selectedFatherAlive,
              validator: dropdownValidator,
              items: _alive,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedFatherAlive = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: "fathersProfessionTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            controller: _familyInfoController.fathersProfessionController,
            validator: requiredValidator
          ),
          Gap(4.h),
          Text('fathersProfessionNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),
          InputTitleText(title: "mothersNameTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              controller: _familyInfoController.mothersNameController,
              validator: requiredValidator),
          Gap(4.h),
          Text('onlyForAuthority'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),
          InputTitleText(title: "mothersAliveTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _familyInfoController.selectedMotherAlive,
              validator: dropdownValidator,
              items: _alive,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedMotherAlive = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: "mothersProfessionTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              controller: _familyInfoController.mothersProfessionController,
              validator: requiredValidator),
          Gap(16.h),

          InputTitleText(title: "brothersCountTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _familyInfoController.brotherCountController,
              keyBoardType: TextInputType.phone),
          Gap(16.h),

          InputTitleText(title: "brothersInfoTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _familyInfoController.brothersInfoController,
              maxLines: 5),
          Gap(16.h),

          InputTitleText(title: "sistersCountTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _familyInfoController.sisterCountController,
              keyBoardType: TextInputType.phone),
          Gap(16.h),
          InputTitleText(title: "sistersInfoTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _familyInfoController.sistersInfoController,
              maxLines: 5),
          Gap(4.h),
          Text('sistersInfoNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),
          InputTitleText(title: "professionOfUnclesTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _familyInfoController.professionOfUnclesController,
              maxLines: 5),
          Gap(16.h),
          InputTitleText(title: "familyIncomeStatusTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _familyInfoController.selectedFamilyIncomeStatus,
              validator: dropdownValidator,
              items: _familyIncomeStatus,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedFamilyIncomeStatus = newValue;
                });
              }),
          Gap(16.h),
          InputTitleText(
            title: "familyReligiousConditionTitle".tr,
          ),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _familyInfoController.religiousConditionController,
              maxLines: 5),
          Gap(4.h),
          Text('familyReligiousConditionNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }
}
