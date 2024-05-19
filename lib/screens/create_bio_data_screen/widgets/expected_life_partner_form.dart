import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/expected_life_partner_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class ExpectedLifePartnerForm extends StatefulWidget {
  const ExpectedLifePartnerForm({super.key});

  @override
  State<ExpectedLifePartnerForm> createState() => _ExpectedLifePartnerFormState();
}

class _ExpectedLifePartnerFormState extends State<ExpectedLifePartnerForm> {
  final ExpectedLifePartnerController _expectedLifePartnerController =
      Get.find<ExpectedLifePartnerController>();

  RangeValues _ageRange = const RangeValues(18, 30); // Initial range
  final List<String> _complexion = [
    'black',
    'brown',
    'lightBrown',
    'fair',
    'veryFair'
  ];
  final List<String> _maritalStatus = ['single', 'married', 'divorced', 'widowed', 'separated'];


  void _toggleComplexionSelection(String complexion) {
    setState(() {
      if (_expectedLifePartnerController.selectedComplexion
          .contains(complexion)) {
        _expectedLifePartnerController.selectedComplexion.remove(complexion);
      } else {
        _expectedLifePartnerController.selectedComplexion.add(complexion);
      }
    });
  }

  void _toggleMaritalStatusSelection(String maritalStatus) {
    setState(() {
      if (_expectedLifePartnerController.selectedMaritalStatus.contains(maritalStatus)) {
        _expectedLifePartnerController.selectedMaritalStatus.remove(maritalStatus);
      } else {
        _expectedLifePartnerController.selectedMaritalStatus.add(maritalStatus);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _expectedLifePartnerController.selectedAgeRange = [
      _ageRange.start.toInt(),
      _ageRange.end.toInt()
    ];

    if(_expectedLifePartnerController.expectedLifePartner != null){
      _expectedLifePartnerController.selectedAgeRange = _expectedLifePartnerController.selectedAgeRange;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _expectedLifePartnerController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: "Age"),
          Row(
            children: [
              Text('18',
                  style: AppTextStyles.bodySmall(color: AppColors.greyColor)),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 2.h,
                      valueIndicatorColor: AppColors.violetClr,
                      valueIndicatorTextStyle:
                          AppTextStyles.titleSmall(color: AppColors.whiteClr)),
                  child: RangeSlider(
                    values: _ageRange,
                    min: 18,
                    max: 70, // Adjust based on your price range
                    divisions: 70,
                    activeColor: AppColors.violetClr,
                    inactiveColor: AppColors.violetClr.withOpacity(0.3),
                    labels: RangeLabels(
                      _ageRange.start.toStringAsFixed(0),
                      _ageRange.end.toStringAsFixed(0),
                    ),
                    onChanged: (newRange) {
                      setState(() {
                        _ageRange = newRange;
                        _expectedLifePartnerController.selectedAgeRange = [
                          _ageRange.start.toInt(),
                          _ageRange.end.toInt()
                        ];
                      });
                    },
                  ),
                ),
              ),
              Text('70',
                  style: AppTextStyles.bodySmall(color: AppColors.greyColor)),
            ],
          ),
          const InputTitleText(title: "Complexion"),
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (String complexion in _complexion)
                GestureDetector(
                  onTap: () => _toggleComplexionSelection(complexion),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: _expectedLifePartnerController.selectedComplexion
                              .contains(complexion)
                          ? AppColors.violetClr
                          : AppColors.whiteClr,
                      border: Border.all(color: AppColors.violetClr, width: 1.w),
                    ),
                    child: Text(
                      complexion,
                      style: AppTextStyles.bodySmall(
                          color: _expectedLifePartnerController.selectedComplexion
                                  .contains(complexion)
                              ? AppColors.whiteClr
                              : AppColors.blackClr),
                    ),
                  ),
                ),
            ],
          ),
          Gap(16.h),
          const InputTitleText(title: "Height"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected height'),
              hintText: "Height",
              controller: _expectedLifePartnerController.heightController),
          Gap(4.h),
          Text("Don't write 'Any' or 'Adjustable'",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Educational Qualification"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected edu qualification'),
            hintText: "Education",
            controller: _expectedLifePartnerController.educationalQualificationController,
          ),
          Gap(16.h),
          const InputTitleText(title: "District"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected district'),
            hintText: "District",
            controller: _expectedLifePartnerController.districtController,
          ),
          Gap(4.h),
          Text(
              "Don't write 'Any District'. Mention specific districts in consultation with family",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Marital Status"),
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (String maritalStatus in _maritalStatus)
                GestureDetector(
                  onTap: () => _toggleMaritalStatusSelection(maritalStatus),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.r),
                      color: _expectedLifePartnerController.selectedMaritalStatus.contains(maritalStatus)
                          ? AppColors.violetClr
                          : AppColors.whiteClr,
                      border: Border.all(color: AppColors.violetClr, width: 1.w),
                    ),
                    child: Text(
                      maritalStatus,
                      style: AppTextStyles.bodySmall(
                          color: _expectedLifePartnerController.selectedMaritalStatus.contains(maritalStatus)
                              ? AppColors.whiteClr
                              : AppColors.blackClr),
                    ),
                  ),
                ),
            ],
          ),
          Gap(16.h),
          const InputTitleText(title: "Profession"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected profession'),
            hintText: "Profession",
            controller: _expectedLifePartnerController.professionController,
          ),
          Gap(4.h),
          Text("Don't write 'Any' or 'Adjustable' or 'Any Halal Occupation'",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Financial Condition"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected finance condition'),
            hintText: "Condition",
            controller: _expectedLifePartnerController.financialConditionController,
          ),
          Gap(4.h),
          Text(
            "Be specific rather than 'Any'",
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
          const InputTitleText(
              title: "Expected qualities or attributes of life partner."),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter expected quality'),
            hintText: "Quality",
            controller: _expectedLifePartnerController.expectedQualityController,
          ),
          Gap(4.h),
          Text(
              "You may right your expectation in detail. Also, you may mention if there is any special condition",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }
}
