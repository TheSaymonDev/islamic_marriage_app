import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class MarriageRelatedInfoForm extends StatefulWidget {
  const MarriageRelatedInfoForm({super.key});

  @override
  State<MarriageRelatedInfoForm> createState() =>
      _MarriageRelatedInfoFormState();
}

class _MarriageRelatedInfoFormState
    extends State<MarriageRelatedInfoForm> {
  final MarriageRelatedInfoController _marriageInfoController =
      Get.find<MarriageRelatedInfoController>();
  final _marriageRelatedInfo = Get.find<MyBioDataController>().myBioData!.marriageInfo;

  @override
  void initState() {
    super.initState();
   if(_marriageRelatedInfo != null){
     _marriageInfoController.guardiansAgreeController.text = _marriageRelatedInfo.guardiansPermission!;
     _marriageInfoController.veilController.text = _marriageRelatedInfo.veilAfterMarriage!;
     _marriageInfoController.afterStudyController.text = _marriageRelatedInfo.partnerEducationPermission!;
     _marriageInfoController.afterJobController.text = _marriageRelatedInfo.partnerJobPermission!;
     _marriageInfoController.whereLiveController.text = _marriageRelatedInfo.liveInformationAfterMarriage!;
     _marriageInfoController.giftController.text = _marriageRelatedInfo.expectedGift!;
     _marriageInfoController.getMarriedController.text = _marriageRelatedInfo.thoughtAboutMarriage!;
   }else{
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
          const InputTitleText(
              title: "Do your guardians agree to your marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Description",
              controller: _marriageInfoController.guardiansAgreeController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Will you be able to keep your wife in the veil after marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Veil",
              controller: _marriageInfoController.veilController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Would you like to allow your wife to study after marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Study",
              controller: _marriageInfoController.afterStudyController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Would you like to allow your wife to do any job after marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Job",
              controller: _marriageInfoController.afterJobController),
          Gap(16.h),
          const InputTitleText(
              title: "Where will you live with your wife after marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Where lived",
              controller: _marriageInfoController.whereLiveController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Would you or your family expect any gift from the bride's family?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Expect Gift",
              controller: _marriageInfoController.giftController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Why are you getting married? What are your thoughts on marriage?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Get Married",
              controller: _marriageInfoController.getMarriedController,
              maxLines: 5),
          Gap(16.h),
        ],
      ),
    );
  }
}
