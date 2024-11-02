import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/current_user_biodata_model.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class MarriageRelatedInfoForm extends StatefulWidget {
  const MarriageRelatedInfoForm({super.key});

  @override
  State<MarriageRelatedInfoForm> createState() =>
      _MarriageRelatedInfoFormState();
}

class _MarriageRelatedInfoFormState extends State<MarriageRelatedInfoForm> {
  final _marriageInfoController = Get.find<MarriageRelatedInfoController>();
  String? _bioDataType;

  @override
  void initState() {
    super.initState();
    final currentBioData = Get.find<CurrentUserBioDataController>()
        .currentUserBioData
        ?.data
        ?.biodata;
    _bioDataType = currentBioData?.generalInfo?.bioDataType;
    final _marriageRelatedInfoData = currentBioData?.marriageInfo;
    if (_marriageRelatedInfoData != null) {
      _assignData(_marriageRelatedInfoData);
    } else {
      _clearData();
    }
  }

  Widget _maleBioDataWidget() {
    _marriageInfoController.femaleStudyController.clear();
    _marriageInfoController.femaleJobController.clear();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTitleText(title: "wifeInVeilTitle".tr),
        Gap(4.h),
        CustomTextFormField(
            validator: requiredValidator,
            controller: _marriageInfoController.veilController),
        Gap(16.h),
        InputTitleText(title: "afterStudyTitle".tr, isRequired: false),
        Gap(4.h),
        CustomTextFormField(
            controller: _marriageInfoController.afterStudyController),
        Gap(16.h),
        InputTitleText(title: "afterJobTitle".tr, isRequired: false),
        Gap(4.h),
        CustomTextFormField(
            controller: _marriageInfoController.afterJobController),
        Gap(16.h),
        InputTitleText(title: "livingPlaceTitle".tr, isRequired: false),
        Gap(4.h),
        CustomTextFormField(
            controller: _marriageInfoController.whereLiveController),
        Gap(16.h),
      ],
    );
  }

  Widget _femaleBioDataWidget() {
    _marriageInfoController.veilController.clear();
    _marriageInfoController.afterJobController.clear();
    _marriageInfoController.afterStudyController.clear();
    _marriageInfoController.whereLiveController.clear();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTitleText(title: "femaleJobTitle".tr),
        Gap(4.h),
        CustomTextFormField(
            validator: requiredValidator,
            controller: _marriageInfoController.femaleJobController),
        Gap(16.h),
        InputTitleText(title: "femaleStudyTitle".tr),
        Gap(4.h),
        CustomTextFormField(
            validator: requiredValidator,
            controller: _marriageInfoController.femaleStudyController),
        Gap(16.h),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _marriageInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "guardianAgreeTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.guardiansAgreeController),
          Gap(16.h),
          _bioDataType == 'malesBioData'
              ? _maleBioDataWidget()
              : _femaleBioDataWidget(),
          InputTitleText(title: "expectedGiftTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.giftController),
          Gap(16.h),
          InputTitleText(title: "thoughAboutTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _marriageInfoController.getMarriedController,
              maxLines: 5),
          Gap(16.h),
        ],
      ),
    );
  }

  void _assignData(MarriageInfo _marriageRelatedInfoData) {
    _marriageInfoController.guardiansAgreeController.text =
        _marriageRelatedInfoData.guardianAgree ?? '';
    _marriageInfoController.veilController.text =
        _marriageRelatedInfoData.wifeInVeil ?? '';
    _marriageInfoController.afterStudyController.text =
        _marriageRelatedInfoData.studyAfterMarriage ?? '';
    _marriageInfoController.afterJobController.text =
        _marriageRelatedInfoData.jobAfterMarriage ?? '';
    _marriageInfoController.whereLiveController.text =
        _marriageRelatedInfoData.livingPlaceAfterMarriage ?? '';
    _marriageInfoController.giftController.text =
        _marriageRelatedInfoData.expectGiftFromBrideFamily ?? '';
    _marriageInfoController.getMarriedController.text =
        _marriageRelatedInfoData.thoughtAboutMarriage ?? '';
    _marriageInfoController.femaleStudyController.text =
        _marriageRelatedInfoData.studyFemale ?? '';
    _marriageInfoController.femaleJobController.text =
        _marriageRelatedInfoData.jobFemale ?? '';
  }

  void _clearData() {
    _marriageInfoController.guardiansAgreeController.clear();
    _marriageInfoController.veilController.clear();
    _marriageInfoController.afterStudyController.clear();
    _marriageInfoController.afterJobController.clear();
    _marriageInfoController.whereLiveController.clear();
    _marriageInfoController.femaleJobController.clear();
    _marriageInfoController.femaleStudyController.clear();
    _marriageInfoController.giftController.clear();
    _marriageInfoController.getMarriedController.clear();
  }
}
