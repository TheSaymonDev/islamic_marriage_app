import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
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

  @override
  void initState() {
    super.initState();
    final _marriageRelatedInfoData = Get.find<CurrentUserBioDataController>().currentUserData?.data?.biodata?.marriageInfo;

    if (_marriageRelatedInfoData != null) {
      _marriageInfoController.guardiansAgreeController.text = _marriageRelatedInfoData.guardianAgree ?? '';
      _marriageInfoController.veilController.text = _marriageRelatedInfoData.wifeInVeil ?? '';
      _marriageInfoController.afterStudyController.text = _marriageRelatedInfoData.studyAfterMarriage ?? '';
      _marriageInfoController.afterJobController.text = _marriageRelatedInfoData.jobAfterMarriage ?? '';
      _marriageInfoController.whereLiveController.text = _marriageRelatedInfoData.livingPlaceAfterMarriage ?? '';
      _marriageInfoController.giftController.text = _marriageRelatedInfoData.expectGiftFromBrideFamily ?? '';
      _marriageInfoController.getMarriedController.text = _marriageRelatedInfoData.thoughtAboutMarriage ?? '';
    } else {
      _marriageInfoController.guardiansAgreeController.text = '';
      _marriageInfoController.veilController.text = '';
      _marriageInfoController.afterStudyController.text = '';
      _marriageInfoController.afterJobController.text = '';
      _marriageInfoController.whereLiveController.text = '';
      _marriageInfoController.giftController.text = '';
      _marriageInfoController.getMarriedController.text = '';
    }
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

          InputTitleText(title: "wifeInVeilTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.veilController),
          Gap(16.h),

          InputTitleText(
              title: "afterStudyTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.afterStudyController),
          Gap(16.h),

          InputTitleText(title: "afterJobTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.afterJobController),
          Gap(16.h),

          InputTitleText(title: "livingPlaceTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.whereLiveController),
          Gap(16.h),

          InputTitleText(title: "expectedGiftTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.giftController),
          Gap(16.h),

          InputTitleText(title: "thoughAboutTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _marriageInfoController.getMarriedController,
              maxLines: 5),
          Gap(16.h),
        ],
      ),
    );
  }
}
