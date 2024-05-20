import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
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
  final _pledgeInfo = Get.find<MyBioDataController>().myBioData!.pledge;

  final List<String> _pledge = ['Yes', 'No'];

  @override
  void initState() {
    super.initState();
    if(_pledgeInfo != null){
      _pledgeController.selectedPledge1 = _pledgeInfo.parentKnowSubmission;
      _pledgeController.selectedPledge2 = _pledgeInfo.isAllInfoTrue;
      _pledgeController.selectedPledge3 = _pledgeInfo.falseInfoProven;
    }else{
      _pledgeController.selectedPledge1 = null;
      _pledgeController.selectedPledge2 = null;
      _pledgeController.selectedPledge3 = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _pledgeController.formKey,
      child: Column(
        children: [
          const InputTitleText(title: "Do your parents know that you are submitting Bio Data to the islamicmarriage.net website?"),
          Gap(4.h),
          CustomDropdownButton(
            value: _pledgeController.selectedPledge1,
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
            value: _pledgeController.selectedPledge2,
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
            value: _pledgeController.selectedPledge3,
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
