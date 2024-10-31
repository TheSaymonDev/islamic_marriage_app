import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ExpectedLifePartnerForm extends StatefulWidget {
  const ExpectedLifePartnerForm({super.key});

  @override
  State<ExpectedLifePartnerForm> createState() =>
      _ExpectedLifePartnerFormState();
}

class _ExpectedLifePartnerFormState extends State<ExpectedLifePartnerForm> {
  RangeValues? _ageRange;

  final List<DropdownItem> _maritalStatus = [
    DropdownItem(title: "neverMarried".tr, value: "neverMarried"),
    DropdownItem(title: "married".tr, value: "married"),
    DropdownItem(title: "divorced".tr, value: "divorced"),
    DropdownItem(title: "widow".tr, value: "widow"),
    DropdownItem(title: "widower".tr, value: "widower"),
    DropdownItem(title: "anyValue".tr, value: "any"),
  ];
  final List<DropdownItem> _complexion = [
    DropdownItem(title: "black".tr, value: "black"),
    DropdownItem(title: "brown".tr, value: "brown"),
    DropdownItem(title: "lightBrown".tr, value: "lightBrown"),
    DropdownItem(title: "fair".tr, value: "fair"),
    DropdownItem(title: "veryFair".tr, value: "veryFair"),
    DropdownItem(title: "anyValue".tr, value: "any"),
  ];


  final _expectedPartnerController = Get.find<ExpectedLifePartnerController>();

  @override
  void initState() {
    super.initState();
    final _expectedLifePartnerData = Get.find<CurrentUserBioDataController>().currentUserBioData?.data?.biodata?.expectedLifePartnerInfo;

    if (_expectedLifePartnerData != null) {
      _expectedPartnerController.expectedMinAge = int.parse(_expectedLifePartnerData.expectedMinAge!);
      _expectedPartnerController.expectedMaxAge = int.parse(_expectedLifePartnerData.expectedMaxAge!);
      _ageRange = RangeValues(
        _expectedPartnerController.expectedMinAge?.toDouble() ?? 18,
        _expectedPartnerController.expectedMaxAge?.toDouble() ?? 30,
      );
      _expectedPartnerController.expectedComplexion = _complexion.firstWhereOrNull((item) => item.value == _expectedLifePartnerData.expectedComplexion);
      _expectedPartnerController.expectedHeight.text = _expectedLifePartnerData.expectedHeight ?? '';
      _expectedPartnerController.expectedEducation.text = _expectedLifePartnerData.exptectedEducation ?? '';
      _expectedPartnerController.expectedDistrict.text = _expectedLifePartnerData.exptectedDistrict ?? '';
      _expectedPartnerController.expectedMaritalStatus = _maritalStatus.firstWhereOrNull((item) => item.value == _expectedLifePartnerData.expectedMaritialStatus);
      _expectedPartnerController.expectedProfession.text = _expectedLifePartnerData.expectedProfession ?? '';
      _expectedPartnerController.expectedFinancialCondition.text = _expectedLifePartnerData.expectedFinancialCondition ?? '';
      _expectedPartnerController.expectedQualityAttributes.text = _expectedLifePartnerData.expectedAttributes ?? '';
    } else {
      _ageRange = RangeValues(18, 30);
      _expectedPartnerController.expectedComplexion = null;
      _expectedPartnerController.expectedHeight.text = '';
      _expectedPartnerController.expectedEducation.text = '';
      _expectedPartnerController.expectedDistrict.text = '';
      _expectedPartnerController.expectedMaritalStatus = null;
      _expectedPartnerController.expectedProfession.text = '';
      _expectedPartnerController.expectedFinancialCondition.text = '';
      _expectedPartnerController.expectedQualityAttributes.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _expectedPartnerController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "expectedAgeTitle".tr),
          Row(
            children: [
              Text('18',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: greyClr)),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 2.h,
                      valueIndicatorColor: violetClr,
                      valueIndicatorTextStyle: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: lightBgClr)),
                  child: RangeSlider(
                    values: _ageRange!,
                    min: 18,
                    max: 70, // Adjust based on your price range
                    divisions: 70,
                    activeColor: violetClr,
                    inactiveColor: violetClr.withValues(alpha: 0.3),
                    labels: RangeLabels(
                      _ageRange!.start.toStringAsFixed(0),
                      _ageRange!.end.toStringAsFixed(0),
                    ),
                    onChanged: (newRange) {
                      setState(() {
                        _ageRange = newRange;
                        _expectedPartnerController.expectedMinAge =
                            newRange.start.toInt();
                        _expectedPartnerController.expectedMaxAge =
                            newRange.end.toInt();
                      });
                    },
                  ),
                ),
              ),
              Text('70',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: greyClr)),
            ],
          ),
          InputTitleText(title: "expectedComplexionTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _expectedPartnerController.expectedComplexion,
            validator: dropdownValidator,
            items: _complexion,
            onChanged: (newValue) {
              setState(() {
                _expectedPartnerController.expectedComplexion = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: "expectedHeightTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _expectedPartnerController.expectedHeight),
          //Gap(4.h),
          // Text("expectedHeightNB".tr,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "expectedEducationTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _expectedPartnerController.expectedEducation),
          Gap(16.h),

          InputTitleText(title: "expectedDistrictTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _expectedPartnerController.expectedDistrict
          ),
          //Gap(4.h),
          // Text("expectedDistrictNB".tr,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "expectedMaritalStatusTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _expectedPartnerController.expectedMaritalStatus,
            validator: dropdownValidator,
            items: _maritalStatus,
            onChanged: (newValue) {
              setState(() {
                _expectedPartnerController.expectedMaritalStatus = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: "expectedProfessionTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _expectedPartnerController.expectedProfession
          ),
          //Gap(4.h),
          // Text("expectedProfessionNB".tr,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "expectedFinancialConditionTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator:requiredValidator,
            controller: _expectedPartnerController.expectedFinancialCondition
          ),
          // Gap(4.h),
          // Text("expectedFinancialConditionNB".tr,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "expectedAttributesTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _expectedPartnerController.expectedQualityAttributes
          ),
          Gap(4.h),
          Text("expectedAttributesNB".tr,
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
