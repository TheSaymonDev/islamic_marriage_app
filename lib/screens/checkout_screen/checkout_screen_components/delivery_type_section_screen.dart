// import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
// import 'package:darkak_e_commerce_app/core/utils/colors.dart';
// import 'package:darkak_e_commerce_app/models/final_delivery_option_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
//
// class DeliveryTypeSectionScreen extends StatefulWidget {
//   const DeliveryTypeSectionScreen({super.key});
//   @override
//   State<DeliveryTypeSectionScreen> createState() =>
//       _DeliveryTypeSectionScreenState();
// }
// class _DeliveryTypeSectionScreenState extends State<DeliveryTypeSectionScreen> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Get.find<CheckOutScreenController>().deliveryTypeOnChanged(DeliveryOptions.deliveryOptionList[0]);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: List.generate(
//           DeliveryOptions.deliveryOptionList.length,
//           (index) => Padding(
//                 padding: EdgeInsets.only(bottom: 40.h),
//                 child:
//                     GetBuilder<CheckOutScreenController>(builder: (controller) {
//                   return RadioListTile<DeliveryOptions>(
//                     activeColor: orangeClr,
//                     tileColor: whiteClr,
//                     controlAffinity: ListTileControlAffinity.trailing,
//                     contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
//                     title: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           DeliveryOptions.deliveryOptionList[index].title,
//                           style: Get.textTheme.titleLarge,
//                         ),
//                         Gap(8.h),
//                       ],
//                     ),
//                     subtitle: Text(
//                       DeliveryOptions.deliveryOptionList[index].subTitle,
//                       style: Get.textTheme.bodyMedium,
//                     ),
//                     groupValue: controller.selectedOption,
//                     value: DeliveryOptions.deliveryOptionList[index],
//                     onChanged: (value) => controller.deliveryTypeOnChanged(value),
//                   );
//                 }),
//               )),
//     );
//   }
// }
