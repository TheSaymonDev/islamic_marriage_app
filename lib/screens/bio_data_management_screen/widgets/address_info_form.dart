import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/address_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/all_divisions.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class AddressForm extends StatefulWidget {
  const AddressForm({super.key});

  @override
  State<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends State<AddressForm> {
  late List<Division> divisions;

  @override
  void initState() {
    super.initState();
    final _addressInfoData = Get.find<MyBioDataController>().currentUser!.data!.biodata!.permanentAddress;
    if (_addressInfoData != null) {
      _addressInfoController.selectedDivision.text = _addressInfoData.division ?? '';
      _addressInfoController.selectedDistrict.text = _addressInfoData.district ?? '';
      _addressInfoController.selectedSubDistrict.text = _addressInfoData.subDistrict ?? '';

      _addressInfoController.selectedDivision1.text = _addressInfoData.division ?? '';
      _addressInfoController.selectedDistrict1.text = _addressInfoData.district ?? '';
      _addressInfoController.selectedSubDistrict1.text = _addressInfoData.subDistrict ?? '';
    } else {
      _addressInfoController.selectedDivision.text = '';
      _addressInfoController.selectedDistrict.text = '';
      _addressInfoController.selectedSubDistrict.text = '';

      _addressInfoController.selectedDivision1.text = '';
      _addressInfoController.selectedDistrict1.text = '';
      _addressInfoController.selectedSubDistrict1.text = '';
    }
  }

  final _addressInfoController = Get.find<AddressInfoController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _addressInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: 'permanentAddressTitle'.tr),
          Gap(4.h),
          // CustomDropdownButton1<Division>(
          //   validator: dropdownValidator,
          //   value: _addressInfoController.selectedDivision,
          //   items: divisions,
          //   onChanged: (value) {
          //     setState(() {
          //       _addressInfoController.selectedDivision = value;
          //       _addressInfoController.selectedDistrict = null;
          //       _addressInfoController.selectedSubDistrict = null;
          //     });
          //   },
          // ),
          CustomTextFormField(
            hintText: 'Division',
              controller: _addressInfoController.selectedDivision,
              validator: requiredValidator),
          Gap(8.h),
          Row(
            children: [
              Expanded(
                  child: CustomTextFormField(
                    hintText: 'District',
                      controller: _addressInfoController.selectedDistrict,
                      validator: requiredValidator)),
              // Expanded(
              //   child: CustomDropdownButton1<District>(
              //     validator: dropdownValidator,
              //     value: _addressInfoController.selectedDistrict,
              //     items: _addressInfoController.selectedDivision?.districts ?? [],
              //     onChanged: (value) {
              //       setState(() {
              //         _addressInfoController.selectedDistrict = value;
              //         _addressInfoController.selectedSubDistrict = null;
              //       });
              //     },
              //   ),
              // ),
              Gap(8.w),
              Expanded(
                  child: CustomTextFormField(
                    hintText: 'Sub-District',
                      controller: _addressInfoController.selectedSubDistrict,
                      validator: requiredValidator)),
              // Expanded(
              //   child: CustomDropdownButton1<SubDistrict>(
              //     validator: dropdownValidator,
              //     value: _addressInfoController.selectedSubDistrict,
              //     items: _addressInfoController.selectedDistrict?.subDistricts ?? [],
              //     onChanged: (value) {
              //       setState(() {
              //         _addressInfoController.selectedSubDistrict = value;
              //       });
              //     },
              //   ),
              // ),
            ],
          ),
          // Gap(8.h),
          // CustomTextFormField(
          //     hintText: 'Area Name',
          //     controller: _addressController.permanentAreaController),
          // Gap(4.h),
          // Text(
          //     'Write the name of the village or area without entering the house number. Example- Mirpur 10, Baghmara',
          //     style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          InputTitleText(title: 'presentAddressTitle'.tr),
          Row(
            children: [
              Checkbox(
                  value: _addressInfoController.isSameAsPermanent,
                  onChanged: (newValue) {
                    setState(() {
                      _addressInfoController.isSameAsPermanent = newValue!;
                    });
                  },
                  checkColor: lightBgClr,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  activeColor: violetClr),
              Text('sameAsPermanentAddressTitle'.tr,
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          Visibility(
            visible: _addressInfoController.isSameAsPermanent,
            replacement: Column(
              children: [
                CustomTextFormField(
                  hintText: 'Division',
                    controller: _addressInfoController.selectedDivision1,
                    validator: requiredValidator),
                // CustomDropdownButton1<Division>(
                //   validator: dropdownValidator,
                //   value: _addressInfoController.selectedDivision1,
                //   items: divisions,
                //   onChanged: (value) {
                //     setState(() {
                //       _addressInfoController.selectedDivision1 = value;
                //       _addressInfoController.selectedDistrict1 = null;
                //       _addressInfoController.selectedSubDistrict1 = null;
                //     });
                //   },
                // ),
                Gap(8.h),
                Row(
                  children: [
                    Expanded(
                        child: CustomTextFormField(
                          hintText: 'District',
                            controller: _addressInfoController.selectedDistrict1,
                            validator: requiredValidator)),
                    // Expanded(
                    //   child: CustomDropdownButton1<District>(
                    //     validator: dropdownValidator,
                    //     value: _addressInfoController.selectedDistrict,
                    //     items: _addressInfoController.selectedDivision?.districts ?? [],
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _addressInfoController.selectedDistrict = value;
                    //         _addressInfoController.selectedSubDistrict = null;
                    //       });
                    //     },
                    //   ),
                    // ),
                    Gap(8.w),
                    Expanded(
                        child: CustomTextFormField(
                          hintText: 'Sub-District',
                            controller: _addressInfoController.selectedSubDistrict1,
                            validator: requiredValidator)),
                    // Expanded(
                    //   child: CustomDropdownButton1<SubDistrict>(
                    //     validator: dropdownValidator,
                    //     value: _addressInfoController.selectedSubDistrict,
                    //     items: _addressInfoController.selectedDistrict?.subDistricts ?? [],
                    //     onChanged: (value) {
                    //       setState(() {
                    //         _addressInfoController.selectedSubDistrict = value;
                    //       });
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                // Gap(8.h),
                // CustomTextFormField(
                //     hintText: 'Area Name', controller: _addressController.presentAreaController),
                // Gap(4.h),
                // Text(
                //     'Write the name of the village or area without entering the house number. Example- Mirpur 10, Baghmara',
                //     style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
              ],
            ),
            child: const SizedBox(),
          ),
          Gap(16.h),
          InputTitleText(title: 'growUpTitle'.tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _addressInfoController.growUpController),
          Gap(16.h),
        ],
      ),
    );
  }
}
