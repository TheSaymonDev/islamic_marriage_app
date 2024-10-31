import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/general_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class GeneralInfoForm extends StatefulWidget {
  const GeneralInfoForm({super.key});

  @override
  State<GeneralInfoForm> createState() => _GeneralInfoFormState();
}

class _GeneralInfoFormState extends State<GeneralInfoForm> {
  final List<DropdownItem> _bioDataType = [
    DropdownItem(title: "malesBioData".tr, value: 'maleBioData'),
    DropdownItem(title: "femalesBioData".tr, value: 'femaleBioData')
  ];
  final List<DropdownItem> _maritalStatus = [
    DropdownItem(title: "neverMarried".tr, value: "neverMarried"),
    DropdownItem(title: "married".tr, value: "married"),
    DropdownItem(title: "divorced".tr, value: "divorced"),
    DropdownItem(title: "widow".tr, value: "widow"),
    DropdownItem(title: "widower".tr, value: "widower"),
  ];
  final List<DropdownItem> _complexion = [
    DropdownItem(title: "black".tr, value: "black"),
    DropdownItem(title: "brown".tr, value: "brown"),
    DropdownItem(title: "lightBrown".tr, value: "lightBrown"),
    DropdownItem(title: "fair".tr, value: "fair"),
    DropdownItem(title: "veryFair".tr, value: "veryFair"),
  ];
  final List<DropdownItem> _bloodGroup = [
    DropdownItem(title: "aPositive".tr, value: "a+"),
    DropdownItem(title: "aNegative".tr, value: "a-"),
    DropdownItem(title: "bPositive".tr, value: "b+"),
    DropdownItem(title: "bNegative".tr, value: "b-"),
    DropdownItem(title: "oPositive".tr, value: "o+"),
    DropdownItem(title: "oNegative".tr, value: "o-"),
    DropdownItem(title: "abPositive".tr, value: "ab+"),
    DropdownItem(title: "abNegative".tr, value: "ab-"),
  ];
  final List<DropdownItem> _nationality = [
    DropdownItem(title: "bangladeshi".tr, value: "bangladeshi"),
    DropdownItem(title: "othersValue".tr, value: "others"),
  ];

  late List<DropdownItem> _height;
  late List<DropdownItem> _weight;

  List<DropdownItem> _createHeightList() {
    List<DropdownItem> heights = [];
    for (int feet = 4; feet <= 7; feet++) {
      for (int inches = 0; inches <= 11; inches++) {
        if (feet == 7 && inches > 0) {
          heights.add(DropdownItem(title: 'More than 7 feet', value: 'moreThan7Feet'));
          break; // Maximum height reached
        }
        String heightTitle = inches == 0 ? '$feet\'' : '$feet\' $inches"';
        String heightValue = '$feet\'$inches"';
        heights.add(DropdownItem(title: heightTitle, value: heightValue));
      }
    }
    heights.insert(0, DropdownItem(title: 'Less than 4 feet', value: 'lessThan4Feet'));
    return heights;
  }


  List<DropdownItem> _createWeightList() {
    List<DropdownItem> weights = [];
    for (int i = 30; i < 120; i++) {
      String weightTitle = '$i kg';
      String weightValue = '${i}kg';
      weights.add(DropdownItem(title: weightTitle, value: weightValue));
    }
    weights.insert(0, DropdownItem(title: 'Less than 30 kg', value: 'lessThan30kg'));
    weights.add(DropdownItem(title: 'More than 120 kg', value: 'moreThan120kg'));
    return weights;
  }


  @override
  void initState() {
    super.initState();
    _height = _createHeightList();
    _weight = _createWeightList();

    final _generalInfoData = Get.find<CurrentUserBioDataController>().currentUserBioData?.data?.biodata?.generalInfo;

    if (_generalInfoData != null) {
      _generalInfoController.selectedBioDataType = _bioDataType.firstWhereOrNull((item) => item.value == _generalInfoData.bioDataType);
      _generalInfoController.selectedMaritalStatus = _maritalStatus.firstWhereOrNull((item) => item.value == _generalInfoData.maritialStatus);
      _generalInfoController.selectedComplexion = _complexion.firstWhereOrNull((item) => item.value == _generalInfoData.complexion);
      _generalInfoController.selectedHeight = _height.firstWhereOrNull((item) => item.value == _generalInfoData.height);
      _generalInfoController.selectedWeight = _weight.firstWhereOrNull((item) => item.value == _generalInfoData.weight);
      _generalInfoController.selectedBloodGroup = _bloodGroup.firstWhereOrNull((item) => item.value == _generalInfoData.bloodGroup);
      _generalInfoController.selectedNationality = _nationality.firstWhereOrNull((item) => item.value == _generalInfoData.nationality);
      if (_generalInfoController.selectedNationality?.value == "others") {
        _generalInfoController.isOtherNationality = true;
      } else {
        _generalInfoController.isOtherNationality = false;
      }
      _generalInfoController.dateOfBirthController.text = _generalInfoData.dateOfBirth ?? '';
      _generalInfoController.otherNationalityController.text = _generalInfoData.othersNationality ?? '';
    } else {
      // Set default values when _generalInfoData is null
      _generalInfoController.selectedBioDataType = null;
      _generalInfoController.selectedMaritalStatus = null;
      _generalInfoController.selectedComplexion = null;
      _generalInfoController.selectedHeight = null;
      _generalInfoController.selectedWeight = null;
      _generalInfoController.selectedBloodGroup = null;
      _generalInfoController.selectedNationality = null;
      _generalInfoController.dateOfBirthController.text = '';
      _generalInfoController.otherNationalityController.text = '';
    }
  }


  final _generalInfoController = Get.find<GeneralInfoController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _generalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: 'bioDataTypeTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedBioDataType,
            validator: dropdownValidator,
            items: _bioDataType,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedBioDataType = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: 'maritalStatusTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedMaritalStatus,
            validator: dropdownValidator,
            items: _maritalStatus,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedMaritalStatus = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: 'dateOfBirthTitle'.tr),
          Gap(4.h),
          CustomTextFormField(
            validator: dobValidator,
            hintText: 'dateOfBirthHint'.tr,
            controller: _generalInfoController.dateOfBirthController,
            suffixIcon: IconButton(
              onPressed: () async {
                dateSelection();
              },
              icon: Icon(Icons.calendar_today, size: 20.sp, color: violetClr),
            ),
            readOnly: true,
          ),
          Gap(16.h),

          InputTitleText(title: 'heightTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedHeight,
            validator: dropdownValidator,
            items: _height,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedHeight = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: 'complexionTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedComplexion,
            validator: dropdownValidator,
            items: _complexion,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedComplexion = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: 'weightTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedWeight,
            validator: dropdownValidator,
            items: _weight,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedWeight = newValue;
              });
            },
          ),
          Gap(16.h),

          InputTitleText(title: 'bloodGroupTitle'.tr, isRequired: false),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedBloodGroup,
            // validator: dropdownValidator,
            items: _bloodGroup,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedBloodGroup = newValue;
              });
            },
          ),
          Gap(16.h),

          // InputTitleText(title: 'nationalityTitle'.tr),
          // Gap(4.h),
          // CustomDropdownButtonTest(
          //   value: _generalInfoController.selectedNationality,
          //   validator: dropdownValidator,
          //   items: _nationality,
          //   onChanged: (newValue) {
          //     setState(() {
          //       _generalInfoController.selectedNationality = newValue;
          //     });
          //   },
          // ),

          // Nationality Dropdown
          InputTitleText(title: 'nationalityTitle'.tr),
          Gap(4.h),
          CustomDropdownButtonTest(
            value: _generalInfoController.selectedNationality,
            validator: dropdownValidator,
            items: _nationality,
            onChanged: (newValue) {
              setState(() {
                _generalInfoController.selectedNationality = newValue;
                if (newValue?.value == "others") {
                  _generalInfoController.isOtherNationality = true;
                } else {
                  _generalInfoController.isOtherNationality = false;
                  _generalInfoController.otherNationalityController.clear();
                }
              });
            },
          ),

          // Display text field if "Other" is selected
          if (_generalInfoController.isOtherNationality)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: CustomTextFormField(
                controller: _generalInfoController.otherNationalityController,
                validator: (value) {
                  if (_generalInfoController.isOtherNationality && (value == null || value.isEmpty)) {
                    return "nationalityHint".tr;
                  }
                  return null;
                },
                hintText: 'nationalityHint'.tr,
              ),
            ),
          Gap(16.h),
        ],
      ),
    );
  }

  void dateSelection() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      _generalInfoController.dateOfBirthController.text = DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }
}
