import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class EduQualificationsForm extends StatefulWidget {
  const EduQualificationsForm({super.key});

  @override
  State<EduQualificationsForm> createState() => _EduQualificationsFormState();
}

class _EduQualificationsFormState extends State<EduQualificationsForm> {

  final EduQualificationsController _eduQualificationsController =
      Get.find<EduQualificationsController>();
  final _eduQualifications = Get.find<MyBioDataController>().myBioData!.education;

  final List<String> _eduMethod = ['general', 'qawmi', 'alia'];
  final List<String> _highestEduQualification = [
    'belowSSC',
    'SSC',
    'HSC',
    'diplomaRunning',
    'diploma',
    'undergraduate',
    'graduate',
    'postGraduate',
    'doctorate'
  ];
  final List<String> _group = ['science', 'commerce', 'arts', 'vocational'];
  final List<String> _result = ['A+', 'A', 'A-', 'B', 'C', 'D'];
  final List<String> _title = [
    "Hafez",
    "Maolana",
    "Mufti",
    "Mufassir",
    "Adib",
  ];

  @override
  void initState() {
    super.initState();
    if(_eduQualifications != null){
      _eduQualificationsController.selectedEduMethod= _eduQualifications.medium;
      _eduQualificationsController.selectedHighestEduQualification= _eduQualifications.qualification;
      _eduQualificationsController.passingYearController.text= _eduQualifications.passingYear!;
      _eduQualificationsController.selectedGroup= _eduQualifications.category;
      _eduQualificationsController.selectedResult= _eduQualifications.result;
      _eduQualificationsController.institutionController.text= _eduQualifications.institution!;
      _eduQualificationsController.othersController.text= _eduQualifications.otherQualifications!;
      _eduQualificationsController.selectedTitle= _eduQualifications.religiousEducation;
    }else{
      _eduQualificationsController.selectedEduMethod= null;
      _eduQualificationsController.selectedHighestEduQualification= null;
      _eduQualificationsController.passingYearController.text= '';
      _eduQualificationsController.selectedGroup= null;
      _eduQualificationsController.selectedResult= null;
      _eduQualificationsController.institutionController.text= '';
      _eduQualificationsController.othersController.text= '';
      _eduQualificationsController.selectedTitle= null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _eduQualificationsController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: 'Educational Method'),
          Gap(4.h),
          CustomDropdownButton(
            value: _eduQualificationsController.selectedEduMethod,
              validator: dropdownValidator,
              items: _eduMethod,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedEduMethod = newValue;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Highest Educational Qualification'),
          Gap(4.h),
          CustomDropdownButton(
            value: _eduQualificationsController.selectedHighestEduQualification,
              validator: dropdownValidator,
              items: _highestEduQualification,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedHighestEduQualification =
                      newValue;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Passing Year'),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            hintText: 'Passing Year',
            controller: _eduQualificationsController.passingYearController,
            keyBoardType: TextInputType.phone,
          ),
          Gap(16.h),
          const InputTitleText(title: 'Group', isRequired: false),
          Gap(4.h),
          CustomDropdownButton(
            value: _eduQualificationsController.selectedGroup,
              items: _group,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedGroup = newValue;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Result'),
          Gap(4.h),
          CustomDropdownButton(
            value: _eduQualificationsController.selectedResult,
              items: _result,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedResult = newValue;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: 'Institution'),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
              hintText: 'Institution Name',
              controller: _eduQualificationsController.institutionController),
          Gap(16.h),
          const InputTitleText(
            title: 'Other Educational Qualification',
            isRequired: false,
          ),
          Gap(4.h),
          CustomTextFormField(
            hintText: 'Others',
            controller: _eduQualificationsController.othersController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
            'Write the details including the name of the educational institute, subject, passing year. If there is nothing, leave it empty',
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
          const InputTitleText(
            title: 'Islamic Educational Title',
            isRequired: false,
          ),
          Gap(4.h),
          CustomDropdownButton(
            value: _eduQualificationsController.selectedTitle,
              items: _title,
              onChanged: (newValue) {
                setState(() {
                  _eduQualificationsController.selectedTitle = newValue;
                });
              }),
          Gap(4.h),
          Text(
            'Leave the field blank if you do not have a title. If yes, you can select one',
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
        ],
      ),
    );
  }
}
