// import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
// import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_text_form_field.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
//
// class AddressSectionScreen extends StatefulWidget {
//   const AddressSectionScreen({super.key});
//
//   @override
//   State<AddressSectionScreen> createState() => _AddressSectionScreenState();
// }
//
// class _AddressSectionScreenState extends State<AddressSectionScreen> {
//
//   final CheckOutScreenController _checkOutScreenController = Get.find<CheckOutScreenController>();
//
//   final nameController = TextEditingController();
//   final mobileController = TextEditingController();
//   final addressController = TextEditingController();
//   final areaController = TextEditingController();
//   final cityController = TextEditingController();
//   final thanaController = TextEditingController();
//   final zipCodeController = TextEditingController();
//   final stateController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     Get.find<CheckOutScreenController>().addressId= _checkOutScreenController.readAddressModel!.id;
//     nameController.text =_checkOutScreenController.readAddressModel!.fullName ?? '';
//     mobileController.text =_checkOutScreenController.readAddressModel!.mobile ?? '';
//     addressController.text =_checkOutScreenController.readAddressModel!.address ?? '';
//     areaController.text =_checkOutScreenController.readAddressModel!.area ?? '';
//     cityController.text =_checkOutScreenController.readAddressModel!.city ?? '';
//     thanaController.text =_checkOutScreenController.readAddressModel!.thana ?? '';
//     zipCodeController.text =_checkOutScreenController.readAddressModel!.zip ?? '';
//     stateController.text =_checkOutScreenController.readAddressModel!.state ?? '';
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<CheckOutScreenController>(
//       builder: (controller) {
//         return Form(
//           key: controller.formKey,
//           child: Column(
//             children: [
//               CustomTextFormField(
//                   labelText: 'Full Name',
//                   controller: nameController,
//                 readOnly: true
//                ),
//               Gap(32.h),
//               CustomTextFormField(
//                 labelText: 'Mobile',
//                 controller: mobileController,
//                 keyBoardType: TextInputType.phone,
//                 readOnly: true
//               ),
//               Gap(32.h),
//               CustomTextFormField(
//                   labelText: 'Address',
//                   controller: addressController,
//                 readOnly: true),
//               Gap(32.h),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextFormField(
//                         labelText: 'Area',
//                         controller: areaController,
//                        readOnly: true),
//                   ),
//                   Gap(16.w),
//                   Expanded(
//                     child: CustomTextFormField(
//                         labelText: 'City',
//                         controller: cityController,
//                         readOnly: true),
//                   ),
//                 ],
//               ),
//               Gap(32.h),
//               Row(
//                 children: [
//                   Expanded(
//                     child: CustomTextFormField(
//                         labelText: 'Thana',
//                         controller: thanaController,
//                        readOnly: true),
//                   ),
//                   Gap(16.w),
//                   Expanded(
//                     child: CustomTextFormField(
//                         labelText: 'Zip Code',
//                         controller: zipCodeController,
//                        readOnly: true),
//                   ),
//                 ],
//               ),
//               Gap(32.h),
//               CustomTextFormField(
//                   labelText: 'State',
//                   controller: stateController,
//                  readOnly: true),
//             ],
//           ),
//         );
//       }
//     );
//   }
// }
