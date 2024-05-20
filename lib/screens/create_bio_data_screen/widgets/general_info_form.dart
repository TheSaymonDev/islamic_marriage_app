import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/general_info_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets//input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class GeneralInfoForm extends StatefulWidget {
  const GeneralInfoForm({super.key});

  @override
  State<GeneralInfoForm> createState() => _GeneralInfoFormState();
}

class _GeneralInfoFormState extends State<GeneralInfoForm> {
  final List<String> _bioDataType = ["groom", "bride"];
  final List<String> _maritalStatus = [
    "single",
    "married",
    "divorced",
    "widowed",
    "separated"
  ];
  late List<String> _height;
  final List<String> _complexion = [
    "black",
    "brown",
    "lightBrown",
    "fair",
    "veryFair"
  ];
  late List<String> _weight;
  final List<String> _bloodGroup = [
    "A+",
    "A-",
    "B+",
    "B-",
    "O+",
    "O-",
    "AB+",
    "AB-"
  ];
  final List<String> _nationality = ["American", "Bangladeshi"];

  final GeneralInfoController _generalInfoController =
      Get.find<GeneralInfoController>();
  final  _generalInfo = Get.find<MyBioDataController>().myBioData!.personalInformation;

  @override
  void initState() {
    super.initState();
    _height = _createHeightList();
    _weight = _createWeightList();
    if (_generalInfo != null) {
      _generalInfoController.selectedBioDataType =
          _generalInfo.typeOfBiodata;
      _generalInfoController.selectedMaritalStatus =
          _generalInfo.maritalStatus;
      _generalInfoController.dateOfBirthController.text =
          formatDate(_generalInfo.dateOfBirth!);
      _generalInfoController.selectedHeight =
          _generalInfo.height;
      _generalInfoController.selectedComplexion =
          _generalInfo.complexion;
      _generalInfoController.selectedWeight =
          _generalInfo.weight;
      _generalInfoController.selectedBloodGroup =
          _generalInfo.bloodGroup;
      _generalInfoController.selectedNationality =
          _generalInfo.nationality;
    } else {
      print('general Info is null');
      _generalInfoController.selectedBioDataType = null;
      _generalInfoController.selectedMaritalStatus = null;
      _generalInfoController.dateOfBirthController.text = '';
      _generalInfoController.selectedHeight = null;
      _generalInfoController.selectedComplexion = null;
      _generalInfoController.selectedWeight = null;
      _generalInfoController.selectedBloodGroup = null;
      _generalInfoController.selectedNationality = null;
    }
  }

  String formatDate(String dobString) {
    try {
      final date = DateTime.parse(dobString);
      final formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(date);
    } catch (error) {
      // Handle parsing error (optional)
      print("Error parsing date: $error");
      return dobString; // Or return a default value
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _generalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: 'Bio Data Type'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedBioDataType,
              validator: dropdownValidator,
              items: _bioDataType,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedBioDataType =
                  newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Marital Status'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedMaritalStatus,
              validator: dropdownValidator,
              items: _maritalStatus,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedMaritalStatus =
                  newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Date of Birth'),
          Gap(4.h),
          CustomTextFormField(
            validator: dobValidator,
            hintText: 'Date of Birth',
            controller: _generalInfoController.dateOfBirthController,
            suffixIcon: IconButton(
                onPressed: () async {
                  dateSelection();
                },
                icon: Icon(Icons.calendar_today,
                    size: 20.sp, color: AppColors.violetClr)),
            readOnly: true,
          ),
          Gap(16.h),
          const InputTitleText(title: 'Height'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedHeight,
              validator: dropdownValidator,
              items: _height,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedHeight = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Complexion'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedComplexion,
              validator: dropdownValidator,
              items: _complexion,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedComplexion =
                  newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Weight'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedWeight,
              validator: dropdownValidator,
              items: _weight,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedWeight = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Blood Group'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedBloodGroup,
              validator: dropdownValidator,
              items: _bloodGroup,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedBloodGroup =
                  newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Nationality'),
          Gap(4.h),
          CustomDropdownButton(
              value: _generalInfoController.selectedNationality,
              validator: dropdownValidator,
              items: _nationality,
              onChanged: (newValue) {
                setState(() {
                  _generalInfoController.selectedNationality =
                  newValue!;
                });
              }),
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
      // Update your controller with the selected date
      _generalInfoController.dateOfBirthController.text =
          DateFormat('yyyy-MM-dd').format(selectedDate);
    }
  }

  List<String> _createHeightList() {
    List<String> heights = [];
    for (int feet = 4; feet <= 7; feet++) {
      for (int inches = 0; inches <= 11; inches++) {
        if (feet == 7 && inches > 0) {
          heights.add('more than 7 feet');
          break; // Maximum height reached
        }
        String heightStr = inches == 0 ? '$feet\'' : '$feet\' $inches"';
        heights.add(heightStr);
      }
    }
    heights.insert(0, 'less than 4 feet');
    return heights;
  }

  List<String> _createWeightList() {
    List<String> weights = [];

    for (int i = 30; i < 120; i++) {
      String weightStr = '$i kg';
      weights.add(weightStr);
    }
    weights.insert(0, 'less than 30 kg');
    weights.add('more than 120 kg');

    return weights;
  }
}
