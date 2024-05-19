import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';

class PledgeForm extends StatefulWidget {
  const PledgeForm({super.key});

  @override
  State<PledgeForm> createState() => _PledgeFormState();
}

class _PledgeFormState extends State<PledgeForm> {

  final PledgeController _pledgeController = Get.find<PledgeController>();

  final List<String> _pledge = ['Yes', 'No'];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _pledgeController.formKey,
      child: Column(
        children: [
          const InputTitleText(title: "Do your parents know that you are submitting Bio Data to the islamicmarriage.net website?"),
          Gap(4.h),
          CustomDropdownButton(
            validator: dropdownValidator,
              items: _pledge, onChanged: (newValue){
            setState(() {
              _pledgeController.selectedPledge1= newValue;
            });
          }),
          Gap(16.h),

          const InputTitleText(title: "By Allah, testify that all the information given is true."),
          Gap(4.h),
          CustomDropdownButton(
            validator: dropdownValidator,
              items: _pledge, onChanged: (newValue){
            setState(() {
              _pledgeController.selectedPledge2= newValue;
            });
          }),
          Gap(16.h),

          const InputTitleText(title: "If you provide any false information, islamicmarriage.net will not take any responsibility for the conventional law and the hereafter. Do you agree?"),
          Gap(4.h),
          CustomDropdownButton(
              validator: dropdownValidator,
              items: _pledge, onChanged: (newValue){
            setState(() {
              _pledgeController.selectedPledge3= newValue;
            });
          }),
          Gap(16.h),
        ],
      ),
    );
  }
}
