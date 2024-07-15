import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';

class PledgeForm extends StatefulWidget {
  const PledgeForm({super.key});

  @override
  State<PledgeForm> createState() => _PledgeFormState();
}

class _PledgeFormState extends State<PledgeForm> {
  final List<DropdownItem> _pledge = [
    DropdownItem(title: 'yes'.tr, value: 'yes'),
    DropdownItem(title: 'no'.tr, value: 'no')
  ];

  final _pledgeController = Get.find<PledgeController>();

  @override
  void initState() {
    super.initState();
    final _pledgeData = Get.find<MyBioDataController>().currentUser!.data!.biodata!.pledgeInfo;

    if (_pledgeData != null) {
      _pledgeController.selectedParentalAwareness = _pledge.firstWhereOrNull((item) => item.value == _pledgeData.parentalAwareness);
      _pledgeController.selectedInformationTruth = _pledge.firstWhereOrNull((item) => item.value == _pledgeData.informationTruth);
      _pledgeController.selectedAgreement = _pledge.firstWhereOrNull((item) => item.value == _pledgeData.agreement);
    } else {
      _pledgeController.selectedParentalAwareness = null;
      _pledgeController.selectedInformationTruth = null;
      _pledgeController.selectedAgreement = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _pledgeController.formKey,
      child: Column(
        children: [
          InputTitleText(title: "parentalAwarenessTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _pledgeController.selectedParentalAwareness,
              validator: dropdownValidator,
              items: _pledge,
              onChanged: (newValue) {
                setState(() {
                  _pledgeController.selectedParentalAwareness = newValue;
                });
              }),
          Gap(16.h),
          InputTitleText(title: "informationTruthTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _pledgeController.selectedInformationTruth,
              validator: dropdownValidator,
              items: _pledge,
              onChanged: (newValue) {
                setState(() {
                  _pledgeController.selectedInformationTruth = newValue;
                });
              }),
          Gap(16.h),
          InputTitleText(title: "agreementTitle".tr),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _pledgeController.selectedAgreement,
              validator: dropdownValidator,
              items: _pledge,
              onChanged: (newValue) {
                setState(() {
                  _pledgeController.selectedAgreement = newValue;
                });
              }),
          Gap(16.h),
        ],
      ),
    );
  }
}
