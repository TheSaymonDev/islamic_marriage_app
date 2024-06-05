import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_flutter_switch.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class AddressManagementScreen extends StatefulWidget {
  final String title;
  const AddressManagementScreen({super.key, required this.title});

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _addressController = TextEditingController();
  final _areaController = TextEditingController();
  final _cityController = TextEditingController();
  final _thanaController = TextEditingController();
  final _zipCodeController = TextEditingController();
  final _stateController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isDefault = false;

  @override
  void dispose() {
    _nameController.dispose();
    _mobileController.dispose();
    _stateController.dispose();
    _zipCodeController.dispose();
    _thanaController.dispose();
    _cityController.dispose();
    _areaController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = 'Md. Saymon';
    _mobileController.text = '01643831739';
    _addressController.text = 'Bhani';
    _areaController.text = 'Daroga Bari';
    _cityController.text = 'Cumilla';
    _thanaController.text = 'Devidwar';
    _zipCodeController.text = '3511';
    _stateController.text = 'Chittagong';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: widget.title,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: widget.title == 'Update Address'
            ? SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Gap(16.h),
                      CustomTextFormField(
                          hintText: 'Full Name',
                          controller: _nameController,
                          validator: (value) => notEmptyValidator(
                                  value, 'Please enter your full name')),
                      Gap(32.h),
                      CustomTextFormField(
                        hintText: 'Mobile',
                        controller: _mobileController,
                        keyBoardType: TextInputType.phone,
                        validator: mobileValidator,
                      ),
                      Gap(32.h),
                      CustomTextFormField(
                          hintText: 'Address',
                          controller: _addressController,
                          validator: (value) => notEmptyValidator(
                                  value, 'Please enter your correct address')),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                hintText: 'Area',
                                controller: _areaController,
                                validator: (value) => notEmptyValidator(
                                        value, 'Please enter area')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                hintText: 'City',
                                controller: _cityController,
                                validator: (value) => notEmptyValidator(
                                        value, 'Please enter city')),
                          ),
                        ],
                      ),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                hintText: 'Thana',
                                controller: _thanaController,
                                validator: (value) => notEmptyValidator(
                                        value, 'Please enter thana')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: CustomTextFormField(
                                hintText: 'Zip Code',
                                controller: _zipCodeController,
                                keyBoardType: TextInputType.number,
                                validator: (value) => notEmptyValidator(
                                        value, 'Please enter zipcode')),
                          ),
                        ],
                      ),
                      Gap(32.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                hintText: 'State',
                                controller: _stateController,
                                validator: (value) => notEmptyValidator(
                                        value, 'Please enter state')),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Default Address',
                                    style: Get.textTheme.bodyMedium),
                                CustomFlutterSwitch(
                                  onToggle: (value) {
                                    isDefault = value;
                                    setState(() {
                                    });
                                  },
                                  value: isDefault,
                                )
                              ]
                            ),
                          ),
                        ],
                      ),
                      Gap(48.h),
                      CustomElevatedButton(onPressed: (){}, buttonName: 'Update Address'),
                      Gap(32.h),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(16.h),
                CustomTextFormField(
                    hintText: 'Full Name',
                    controller: _nameController,
                    validator: (value) => notEmptyValidator(
                        value, 'Please enter your full name')),
                Gap(32.h),
                CustomTextFormField(
                  hintText: 'Mobile',
                  controller: _mobileController,
                  keyBoardType: TextInputType.phone,
                  validator: mobileValidator,
                ),
                Gap(32.h),
                CustomTextFormField(
                    hintText: 'Address',
                    controller: _addressController,
                    validator: (value) => notEmptyValidator(
                        value, 'Please enter your correct address')),
                Gap(32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          hintText: 'Area',
                          controller: _areaController,
                          validator: (value) => notEmptyValidator(
                              value, 'Please enter area')),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: CustomTextFormField(
                          hintText: 'City',
                          controller: _cityController,
                          validator: (value) => notEmptyValidator(
                              value, 'Please enter city')),
                    ),
                  ],
                ),
                Gap(32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          hintText: 'Thana',
                          controller: _thanaController,
                          validator: (value) => notEmptyValidator(
                              value, 'Please enter thana')),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: CustomTextFormField(
                          hintText: 'Zip Code',
                          controller: _zipCodeController,
                          keyBoardType: TextInputType.number,
                          validator: (value) => notEmptyValidator(
                              value, 'Please enter zipcode')),
                    ),
                  ],
                ),
                Gap(32.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                          hintText: 'State',
                          controller: _stateController,
                          validator: (value) => notEmptyValidator(
                              value, 'Please enter state')),
                    ),
                    Gap(16.w),
                    Expanded(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Default Address',
                                style: Get.textTheme.bodyMedium),
                            CustomFlutterSwitch(
                              onToggle: (value) {
                                isDefault = value;
                                setState(() {
                                });
                              },
                              value: isDefault,
                            )
                          ]
                      ),
                    ),
                  ],
                ),
                Gap(48.h),
                CustomElevatedButton(onPressed: (){}, buttonName: 'Update Address'),
                Gap(32.h),
              ],
            ),
          ),
        )
      ),
    );
  }

  // void _formOnSubmitC(CreateAddressController controller, context) async {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     final createAddressModel = CreateAddress(
  //         fullName: _nameController.text.trim(),
  //         mobile: _mobileController.text.trim(),
  //         address: _addressController.text.trim(),
  //         area: _areaController.text.trim(),
  //         city: _cityController.text.trim(),
  //         thana: _thanaController.text.trim(),
  //         zip: _zipCodeController.text.trim(),
  //         state: _stateController.text.trim(),
  //         shippingAddress: controller.shippingAddress);
  //     bool result =
  //         await controller.addAddress(createAddress: createAddressModel);
  //     if (result == true) {
  //       Get.find<AddressViewController>().getAddressList();
  //       Navigator.pop(context);
  //     }
  //   }
  // }
  //
  // void _formOnSubmitU(AddressUpdateController controller, context) async {
  //   if (_formKey.currentState?.validate() ?? false) {
  //     final updateAddressModel = CreateAddress(
  //         fullName: _nameController.text.trim(),
  //         mobile: _mobileController.text.trim(),
  //         address: _addressController.text.trim(),
  //         area: _areaController.text.trim(),
  //         city: _cityController.text.trim(),
  //         thana: _thanaController.text.trim(),
  //         zip: _zipCodeController.text.trim(),
  //         state: _stateController.text.trim(),
  //         shippingAddress: controller.shippingAddress);
  //     bool result = await controller.updateAddress(
  //         id: widget.shippingAddress!.id!, updateAddress: updateAddressModel);
  //     if (result == true) {
  //       Get.find<AddressViewController>().getAddressList();
  //       Navigator.pop(context);
  //     }
  //   }
  // }
}
