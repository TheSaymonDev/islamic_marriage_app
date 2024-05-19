// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:islamic_marriage/screens/checkout_screen/checkout_screen_components/address_section_screen.dart';
// import 'package:islamic_marriage/screens/checkout_screen/checkout_screen_components/delivery_type_section_screen.dart';
// import 'package:islamic_marriage/screens/checkout_screen/checkout_screen_components/payment_method_section_screen.dart';
// import 'package:islamic_marriage/screens/checkout_screen/checkout_screen_components/summary_section_screen.dart';
// import 'package:islamic_marriage/utils/app_colors.dart';
// import 'package:islamic_marriage/utils/app_text_styles.dart';
// import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
// import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/styles.dart';
//
// class CheckOutScreen extends StatefulWidget {
//
//   final List<CartItem> cartItemList;
//   final int totalAmount;
//   const CheckOutScreen(
//       {super.key, required this.cartItemList, required this.totalAmount});
//
//   @override
//   State<CheckOutScreen> createState() => _CheckOutScreenState();
// }
//
// class _CheckOutScreenState extends State<CheckOutScreen> {
//   int _currentStep = 0;
//   List<Step> _stepList() {
//     return [
//       Step(
//         isActive: _currentStep >= 0,
//         state: _currentStep > 0 ? StepState.complete : StepState.indexed,
//         title: Text(_currentStep == 0 ? 'Delivery' : '',
//             style: Get.textTheme.titleSmall),
//         content: const DeliveryTypeSectionScreen(),
//       ),
//       Step(
//         isActive: _currentStep >= 1,
//         state: _currentStep > 1 ? StepState.complete : StepState.indexed,
//         title: Text(_currentStep == 1 ? 'Address' : '',
//             style: Get.textTheme.titleSmall),
//         content: const AddressSectionScreen(),
//       ),
//       Step(
//         isActive: _currentStep >= 2,
//         state: _currentStep > 2 ? StepState.complete : StepState.indexed,
//         title: Text(_currentStep == 2 ? 'Summary' : '',
//             style: Get.textTheme.titleSmall),
//         content: SummarySectionScreen(
//           cartItemList: widget.cartItemList,
//           totalAmount: widget.totalAmount,
//         ),
//       ),
//       Step(
//         isActive: _currentStep >= 3,
//         state: _currentStep > 3 ? StepState.complete : StepState.indexed,
//         title: Text(_currentStep == 3 ? 'Payments' : '',
//             style: Get.textTheme.titleSmall),
//         content: const PaymentMethodSectionScreen(),
//       ),
//     ];
//   }
//
//   final CheckOutScreenController _checkOutScreenController =
//       Get.find<CheckOutScreenController>();
//
//   List<String> cartIdList = [];
//
//   _getCartId() {
//     for (int i = 0; i < widget.cartItemList.length; i++) {
//       CartItem cartItem = widget.cartItemList[i];
//       cartIdList.add(cartItem.id!);
//     }
//   }
//
//   /// 1. Address with `shippingAddress` set to true (if available)
//   /// 2. Address with the latest `createdAt` timestamp (if no shipping address)
//   void _getShippingAddress() {
//     final addressList = Get.find<AddressViewController>().addressList;
//     final shippingAddress = addressList.where((address) => address.shippingAddress == true).firstOrNull;
//     if(shippingAddress != null){
//       _checkOutScreenController.readAddressModel=shippingAddress;
//     }else{
//       _checkOutScreenController.readAddressModel = addressList.toList().asMap().entries.reduce((a, b) => a.value.createdAt!.compareTo(b.value.createdAt!) >= 0 ? a : b).value;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getCartId();
//     _getShippingAddress();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final isLastStep = _currentStep == _stepList().length - 1;
//     return Scaffold(
//       backgroundColor: AppColors.whiteClr,
//       appBar: AppbarTextviewWithBack(
//         onPressedBack: () {
//           Get.back();
//         },
//         title: 'Checkout',
//       ),
//       body: SizedBox(
//         height: double.infinity.h,
//         width: double.infinity.w,
//         child: Column(
//           children: [
//             Expanded(
//               child: Stepper(
//                 connectorColor: const MaterialStatePropertyAll(AppColors.purpleClr),
//                 connectorThickness: 3.h,
//                 steps: _stepList(),
//                 type: StepperType.horizontal,
//                 elevation: 0,
//                 currentStep: _currentStep,
//                 controlsBuilder: (context, details) {
//                   return const SizedBox();
//                 },
//               ),
//             ),
//             GetBuilder<OrderController>(builder: (controller) {
//               return controller.isLoading == true
//                   ? customCircularProgressIndicator
//                   : Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 25.w),
//                       child: Row(
//                         children: [
//                           if (_currentStep > 0)
//                             GestureDetector(
//                               onTap: () {
//                                 if (_currentStep == 0) {
//                                   return;
//                                 } else {
//                                   setState(() {
//                                     _currentStep = _currentStep - 1;
//                                   });
//                                 }
//                               },
//                               child: Container(
//                                 height: 55.h,
//                                 width: 146.w,
//                                 alignment: Alignment.center,
//                                 decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(4.r),
//                                     border: Border.all(
//                                         color: AppColors.purpleClr, width: 2.w),
//                                     color: AppColors.whiteClr),
//                                 child: Text('Back',
//                                     style: Get.textTheme.titleMedium),
//                               ),
//                             ),
//                           const Spacer(),
//                           GestureDetector(
//                             onTap: () async {
//                               final isLastStep =
//                                   _currentStep == _stepList().length - 1;
//                               if (isLastStep) {
//                                 final order = OrderModel(
//                                     carts: cartIdList,
//                                     address:
//                                         _checkOutScreenController.addressId,
//                                     amount: widget.totalAmount,
//                                     paymentMethod: 'CASH_ON_DELIVERY',
//                                     delivery: _checkOutScreenController
//                                         .selectedOption!.value,
//                                     note: 'Deliver This Product');
//                                 final result = await controller.createOrder(
//                                     orderModel: order);
//                                 if (result == true) {
//                                   Get.off(() => const PaymentSuccessScreen());
//                                 }
//                               } else {
//                                 setState(() {
//                                   _currentStep++;
//                                 });
//                               }
//                             },
//                             child: Container(
//                               height: 55.h,
//                               width: 146.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4.r),
//                                 color: AppColors.purpleClr,
//                               ),
//                               child: Text(isLastStep ? 'Confirm' : 'Next',
//                                   style: AppTextStyles.titleMedium(color: AppColors.whiteClr)),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//             }),
//             Gap(32.h),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // void _assignAddress() {
//   //   final addressLine1 = _checkOutScreenController.addressLine1Controller.text;
//   //   final addressLine2 = _checkOutScreenController.addressLine2Controller.text;
//   //   final division = _checkOutScreenController.selectedDivision ?? '';
//   //   final district = _checkOutScreenController.selectedDistrict ?? '';
//   //   final subDistrict = _checkOutScreenController.selectedSubDistrict ?? '';
//   //   final zipCode = _checkOutScreenController.zipCodeController.text;
//   //   _checkOutScreenController.finalAddress =
//   //       '$addressLine1, $addressLine2, $division, $district, $subDistrict-$zipCode';
//   // }
// }
