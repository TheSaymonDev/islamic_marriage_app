import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class OccupationalInfoForm extends StatefulWidget {
  const OccupationalInfoForm({super.key});

  @override
  State<OccupationalInfoForm> createState() =>
      _OccupationalInfoFormState();
}

class _OccupationalInfoFormState extends State<OccupationalInfoForm> {

  final _occupationalInfoController = Get.find<OccupationalInfoController>();

  @override
  void initState() {
    super.initState();
    final _occupationalInfoData = Get.find<CurrentUserBioDataController>().currentUserData?.data?.biodata?.occupationInfo;

    if (_occupationalInfoData != null) {
      _occupationalInfoController.occupationController.text = _occupationalInfoData.occupation ?? '';
      _occupationalInfoController.descriptionController.text = _occupationalInfoData.descriptionOfProfession ?? '';
      _occupationalInfoController.incomeController.text = _occupationalInfoData.monthlyIncome ?? '';
    } else {
      _occupationalInfoController.occupationController.text = '';
      _occupationalInfoController.descriptionController.text = '';
      _occupationalInfoController.incomeController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _occupationalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "occupationTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _occupationalInfoController.occupationController),
          Gap(16.h),

          InputTitleText(title: "descriptionOfProfessionTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _occupationalInfoController.descriptionController,
            maxLines: 5
          ),
          Gap(4.h),
          Text(
              'descriptionOfProfessionNB'.tr,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)),
          Gap(16.h),
          InputTitleText(
            title: "monthlyIncomeTitle".tr,
            isRequired: true
          ),
          Gap(4.h),
          CustomTextFormField(
              keyBoardType: TextInputType.phone,
              validator: requiredValidator,
              controller: _occupationalInfoController.incomeController),
          Gap(16.h),
        ],
      ),
    );
  }
}
