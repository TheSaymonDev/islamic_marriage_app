import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/family_info_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets//input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class FamilyInfoForm extends StatefulWidget {
  const FamilyInfoForm({super.key});

  @override
  State<FamilyInfoForm> createState() => _FamilyInfoFormState();
}

class _FamilyInfoFormState extends State<FamilyInfoForm> {

  final FamilyInfoController _familyInfoController =
  Get.find<FamilyInfoController>();
  final _familyInfo = Get.find<MyBioDataController>().myBioData!.familyInformation;

  final List<String> _alive = ["Yes, Alive", "Not Alive"];
  final List<String> _brotherCount = ["No Brother","1", "2", "3", "4", "5", "more than 5"];
  final List<String> _sisterCount = ["No Sister","1", "2", "3", "4", "5", "more than 5"];

  @override
  void initState() {
    super.initState();
    if(_familyInfo != null){
      _familyInfoController.fathersNameController.text = _familyInfo.fatherName!;
      _familyInfoController.selectedFatherAlive = _familyInfo.isFatherAlive;
      _familyInfoController.fathersProfessionController.text = _familyInfo.fatherOccupation!;
      _familyInfoController.mothersNameController.text = _familyInfo.motherName!;
      _familyInfoController.selectedMotherAlive = _familyInfo.isMotherAlive;
      _familyInfoController.mothersProfessionController.text = _familyInfo.motherOccupation!;
      _familyInfoController.selectedBrotherCount = _familyInfo.brothersCount;
      _familyInfoController.brothersInfoController.text = _familyInfo.brotherInformation!;
      _familyInfoController.selectedSisterCount = _familyInfo.sistersCount;
      _familyInfoController.sistersInfoController.text = _familyInfo.sisterInformation!;
      _familyInfoController.professionOfUnclesController.text = _familyInfo.occupationOfUnclesAndAunts!;
      _familyInfoController.descriptionOfFinancialConditionController.text = _familyInfo.familyIncome!;
      _familyInfoController.religiousConditionController.text = _familyInfo.familyReligionEnvironment!;
    }else{
      _familyInfoController.fathersNameController.text = '';
      _familyInfoController.selectedFatherAlive = null;
      _familyInfoController.fathersProfessionController.text = '';
      _familyInfoController.mothersNameController.text = '';
      _familyInfoController.selectedMotherAlive = null;
      _familyInfoController.mothersProfessionController.text = '';
      _familyInfoController.selectedBrotherCount = null;
      _familyInfoController.brothersInfoController.text = '';
      _familyInfoController.selectedSisterCount = null;
      _familyInfoController.sistersInfoController.text = '';
      _familyInfoController.professionOfUnclesController.text = '';
      _familyInfoController.descriptionOfFinancialConditionController.text = '';
      _familyInfoController.religiousConditionController.text = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _familyInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(title: "Father's Name"),
          Gap(4.h),
          CustomTextFormField(
              hintText: "Father's Name",
              controller: _familyInfoController.fathersNameController,
          validator: (value)=> notEmptyValidator(value, 'Please enter your father name'),),
          Gap(4.h),
          Text('Only for authority',
              style:
                  AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Is your father alive?"),
          Gap(4.h),
          CustomDropdownButton(
            value: _familyInfoController.selectedFatherAlive,
            validator: dropdownValidator,
              items: _alive,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedFatherAlive = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: "Description of Father's Profession"),
          Gap(4.h),
          CustomTextFormField(
              hintText: "Father's Profession",
              controller: _familyInfoController.fathersProfessionController,
            validator: (value)=> notEmptyValidator(value, 'Please enter your father profession'),
          ),
          Gap(4.h),
          Text(
              "Don't write only 'Businessman' or 'Job'. If he is an employee, write the type of organization and title and if he is a businessman, what kind of business he does etc",
              style:
                  AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Mother's Name"),
          Gap(4.h),
          CustomTextFormField(
              hintText: "Mother's Name", controller: _familyInfoController.mothersNameController,
            validator: (value)=> notEmptyValidator(value, 'Please enter your mother name'),),
          Gap(4.h),
          Text('Only for authority',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Is your mother alive?"),
          Gap(4.h),
          CustomDropdownButton(
            value: _familyInfoController.selectedMotherAlive,
            validator: dropdownValidator,
              items: _alive,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedMotherAlive = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: "Description of Mother's Profession"),
          Gap(4.h),
          CustomTextFormField(
              hintText: "Mother's Profession",
              controller: _familyInfoController.mothersProfessionController,
            validator: (value)=> notEmptyValidator(value, 'Please enter your mother profession')),
          Gap(16.h),

          const InputTitleText(title: "How many brothers do you have?"),
          Gap(4.h),
          CustomDropdownButton(
            value: _familyInfoController.selectedBrotherCount,
            validator: dropdownValidator,
              items: _brotherCount,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedBrotherCount = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: "Brother's Information"),
          Gap(4.h),
          CustomTextFormField(
            hintText: "Brother's Information",
            controller: _familyInfoController.brothersInfoController,
            maxLines: 5,
          ),
          Gap(16.h),
          const InputTitleText(title: "How many sisters do you have?"),
          Gap(4.h),
          CustomDropdownButton(
            value: _familyInfoController.selectedSisterCount,
            validator: dropdownValidator,
              items: _sisterCount,
              onChanged: (newValue) {
                setState(() {
                  _familyInfoController.selectedSisterCount = newValue!;
                });
              }),
          Gap(16.h),
          const InputTitleText(title: "Sister's Information"),
          Gap(4.h),
          CustomTextFormField(
            hintText: "Sister's Information",
            controller: _familyInfoController.sistersInfoController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
              "Write down educational qualifications, marital status and occupation. If you have more than one sister, write in a separate line with a comma.",
              style:
                  AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
              title: "Profession of Uncle's", isRequired: false),
          Gap(4.h),
          CustomTextFormField(
            hintText: "Profession of Uncle's",
            controller: _familyInfoController.professionOfUnclesController,
            maxLines: 5,
          ),
          Gap(16.h),
          const InputTitleText(
            title: "Description of Financial Condition",
          ),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter description'),
            hintText: "Description",
            controller: _familyInfoController.descriptionOfFinancialConditionController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
              "Mention the details such as residential house (rented or owned), land or family business details if any etc. Many people consider this to be very important for matching Kufu.",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
            title: "How is your family's religious Condition?",
          ),
          Gap(4.h),
          CustomTextFormField(
            validator: (value)=> notEmptyValidator(value, 'Please enter religious condition details'),
            hintText: "Religious Condition",
            controller: _familyInfoController.religiousConditionController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
              "Write about your family member's religious practices and environment of maintaining mahram & non-mahram",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }
}
