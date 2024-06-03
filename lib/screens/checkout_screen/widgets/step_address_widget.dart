import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class StepAddressWidget extends StatefulWidget {
  const StepAddressWidget({super.key});

  @override
  State<StepAddressWidget> createState() => _StepAddressWidgetState();
}

class _StepAddressWidgetState extends State<StepAddressWidget> {

  final nameController = TextEditingController();
  final mobileController = TextEditingController();
  final addressController = TextEditingController();
  final areaController = TextEditingController();
  final cityController = TextEditingController();
  final thanaController = TextEditingController();
  final zipCodeController = TextEditingController();
  final stateController = TextEditingController();

  //final _stepAddressController = Get.find<StepAddressController>();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Md. Saymon';
    mobileController.text = '01643831739';
    addressController.text = 'Bhani';
    areaController.text = 'Daroga Bari';
    cityController.text = 'Comilla';
    thanaController.text = 'Debidwar';
    zipCodeController.text = '3571';
    stateController.text = 'Chittagong';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
            hintText: 'Full Name',
            controller: nameController,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            hintText: 'Mobile',
            controller: mobileController,
            keyBoardType: TextInputType.phone,
            readOnly: true
        ),
        Gap(32.h),
        CustomTextFormField(
            hintText: 'Address',
            controller: addressController,
            readOnly: true),
        Gap(32.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  hintText: 'Area',
                  controller: areaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  hintText: 'City',
                  controller: cityController,
                  readOnly: true),
            ),
          ],
        ),
        Gap(32.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  hintText: 'Thana',
                  controller: thanaController,
                  readOnly: true),
            ),
            Gap(16.w),
            Expanded(
              child: CustomTextFormField(
                  hintText: 'Zip Code',
                  controller: zipCodeController,
                  readOnly: true),
            ),
          ],
        ),
        Gap(32.h),
        CustomTextFormField(
            hintText: 'State',
            controller: stateController,
            readOnly: true),
      ],
    );
  }
}
