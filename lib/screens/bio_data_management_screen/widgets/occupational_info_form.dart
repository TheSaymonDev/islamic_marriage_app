import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/current_user_biodata_model.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class OccupationalInfoForm extends StatefulWidget {
  const OccupationalInfoForm({super.key});

  @override
  State<OccupationalInfoForm> createState() => _OccupationalInfoFormState();
}

class _OccupationalInfoFormState extends State<OccupationalInfoForm> {
  final _occupationalInfoController = Get.find<OccupationalInfoController>();

  @override
  void initState() {
    super.initState();
    final _occupationalInfoData = Get.find<CurrentUserBioDataController>()
        .currentUserBioData
        ?.data
        ?.biodata
        ?.occupationInfo;

    if (_occupationalInfoData != null) {
      _assignData(_occupationalInfoData);
    } else {
      _clearData();
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
              maxLines: 5),
          Gap(4.h),
          Text('descriptionOfProfessionNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),
          InputTitleText(title: "monthlyIncomeTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              keyBoardType: TextInputType.phone,
              controller: _occupationalInfoController.incomeController),
          Gap(16.h),
        ],
      ),
    );
  }

  void _assignData(OccupationInfo _occupationalInfoData) {
    _occupationalInfoController.occupationController.text =
        _occupationalInfoData.occupation ?? '';
    _occupationalInfoController.descriptionController.text =
        _occupationalInfoData.descriptionOfProfession ?? '';
    _occupationalInfoController.incomeController.text =
        _occupationalInfoData.monthlyIncome ?? '';
  }

  void _clearData() {
    _occupationalInfoController.occupationController.clear();
    _occupationalInfoController.descriptionController.clear();
    _occupationalInfoController.incomeController.clear();
  }
}
