import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';

class ExpectedLifePartnerForm extends StatefulWidget {
  const ExpectedLifePartnerForm({super.key});

  @override
  State<ExpectedLifePartnerForm> createState() =>
      _ExpectedLifePartnerFormState();
}

class _ExpectedLifePartnerFormState extends State<ExpectedLifePartnerForm> {
  final ExpectedLifePartnerController _expectedLifePartnerController =
      Get.find<ExpectedLifePartnerController>();
  final _expectedLifePartner =
      Get.find<MyBioDataController>().myBioData!.partner;

  RangeValues? _ageRange;

  @override
  void initState() {
    super.initState();
    if (_expectedLifePartner != null) {
      _ageRange = RangeValues(_expectedLifePartner.ageRange![0].toDouble(),
          _expectedLifePartner.ageRange![1].toDouble());
      _expectedLifePartnerController.selectedAgeRange =
          _expectedLifePartner.ageRange;
      _expectedLifePartnerController.selectedComplexion =
          _expectedLifePartner.complexion!;
      _expectedLifePartnerController.heightController.text =
          _expectedLifePartner.height!;
      _expectedLifePartnerController.educationalQualificationController.text =
          _expectedLifePartner.educationalQualification!;
      _expectedLifePartnerController.districtController.text =
          _expectedLifePartner.district!;
      _expectedLifePartnerController.selectedMaritalStatus =
          _expectedLifePartner.maritalStatus!;
      _expectedLifePartnerController.professionController.text =
          _expectedLifePartner.profession!;
      _expectedLifePartnerController.financialConditionController.text =
          _expectedLifePartner.financialCondition!;
      _expectedLifePartnerController.expectedQualityController.text =
          _expectedLifePartner.expectedQuality!;
    } else {
      _ageRange = const RangeValues(18, 30);
      _expectedLifePartnerController.selectedAgeRange = [
        _ageRange!.start.toInt(),
        _ageRange!.end.toInt()
      ];
      _expectedLifePartnerController.selectedComplexion = [];
      _expectedLifePartnerController.heightController.text = '';
      _expectedLifePartnerController.educationalQualificationController.text =
          '';
      _expectedLifePartnerController.districtController.text = '';
      _expectedLifePartnerController.selectedMaritalStatus = [];
      _expectedLifePartnerController.professionController.text = '';
      _expectedLifePartnerController.financialConditionController.text = '';
      _expectedLifePartnerController.expectedQualityController.text = '';
    }
  }

  final List<String> _complexions = [
    'black',
    'brown',
    'lightBrown',
    'fair',
    'veryFair'
  ];

  final List<String> _maritalStatus = [
    'single',
    'married',
    'divorced',
    'widowed',
    'separated'
  ];

  final MultiSelectController<String> _complexionC = MultiSelectController();
  final MultiSelectController<String> _maritalStatusC = MultiSelectController();

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
                    values: _ageRange!,
                    min: 18,
                    max: 70, // Adjust based on your price range
                    divisions: 70,
                    activeColor: AppColors.violetClr,
                    inactiveColor: AppColors.violetClr.withOpacity(0.3),
                    labels: RangeLabels(
                      _ageRange!.start.toStringAsFixed(0),
                      _ageRange!.end.toStringAsFixed(0),
                    ),
                    onChanged: (newRange) {
                      setState(() {
                        _ageRange = newRange;
                        _expectedLifePartnerController.selectedAgeRange = [
                          _ageRange!.start.toInt(),
                          _ageRange!.end.toInt()
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
          MultiSelectDropDown<String>(
            controller: _complexionC, // Assuming your controller instance
            clearIcon: null,
            options: _complexions
                .map<ValueItem<String>>((complexion) => ValueItem(
                      label: complexion,
                      value: complexion,
                    ))
                .toList(),
            onOptionSelected: (options) {
              setState(() {
                final selectedComplexionStrings = options
                    .where((option) =>
                        option.value != null) // Filter out null values
                    .map((option) =>
                        option.value!) // Use null-assertion operator
                    .toList();
                _expectedLifePartnerController.selectedComplexion =
                    selectedComplexionStrings;
              });
            },
            onOptionRemoved: (index, option) {
              setState(() {
                _expectedLifePartnerController.selectedComplexion
                    .remove(option);
              });
            },
            maxItems: 4,
            chipConfig: ChipConfig(
                wrapType: WrapType.wrap, backgroundColor: AppColors.violetClr),
            optionBuilder: (context, valueItem, isSelected) {
              return ListTile(
                title: Text(valueItem.label),
                trailing: isSelected
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.radio_button_unchecked),
              );
            },
            inputDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.violetClr, width: 2.w),
            ),
          ),
          Gap(16.h),
          const InputTitleText(title: "Height"),
          Gap(4.h),
          CustomTextFormField(
              validator: (value) =>
                  notEmptyValidator(value, 'Please enter expected height'),
              hintText: "Height",
              controller: _expectedLifePartnerController.heightController),
          Gap(4.h),
          Text("Don't write 'Any' or 'Adjustable'",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Educational Qualification"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value) => notEmptyValidator(
                value, 'Please enter expected edu qualification'),
            hintText: "Education",
            controller: _expectedLifePartnerController
                .educationalQualificationController,
          ),
          Gap(16.h),
          const InputTitleText(title: "District"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value) =>
                notEmptyValidator(value, 'Please enter expected district'),
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
          MultiSelectDropDown<String>(
            controller: _maritalStatusC, // Assuming your controller instance
            clearIcon: null,
            options: _maritalStatus
                .map<ValueItem<String>>((maritalStatus) => ValueItem(
                      label: maritalStatus,
                      value: maritalStatus,
                    ))
                .toList(),
            onOptionSelected: (options) {
              setState(() {
                final selectedMaritalStatusStrings = options
                    .where((option) =>
                        option.value != null) // Filter out null values
                    .map((option) =>
                        option.value!) // Use null-assertion operator
                    .toList();
                _expectedLifePartnerController.selectedMaritalStatus =
                    selectedMaritalStatusStrings;
              });
            },
            onOptionRemoved: (index, option) {
              setState(() {
                _expectedLifePartnerController.selectedMaritalStatus
                    .remove(option);
              });
            },
            maxItems: 4,
            chipConfig: ChipConfig(
                wrapType: WrapType.wrap, backgroundColor: AppColors.violetClr),
            optionBuilder: (context, valueItem, isSelected) {
              return ListTile(
                title: Text(valueItem.label),
                trailing: isSelected
                    ? const Icon(Icons.check_circle)
                    : const Icon(Icons.radio_button_unchecked),
              );
            },
            inputDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppColors.violetClr, width: 2.w),
            ),
          ),
          Gap(16.h),
          const InputTitleText(title: "Profession"),
          Gap(4.h),
          CustomTextFormField(
            validator: (value) =>
                notEmptyValidator(value, 'Please enter expected profession'),
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
            validator: (value) => notEmptyValidator(
                value, 'Please enter expected finance condition'),
            hintText: "Condition",
            controller:
                _expectedLifePartnerController.financialConditionController,
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
            validator: (value) =>
                notEmptyValidator(value, 'Please enter expected quality'),
            hintText: "Quality",
            controller:
                _expectedLifePartnerController.expectedQualityController,
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
