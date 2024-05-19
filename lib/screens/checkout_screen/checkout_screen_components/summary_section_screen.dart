// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:darkak_e_commerce_app/controllers/checkout_screen_controller.dart';
// import 'package:darkak_e_commerce_app/core/utils/colors.dart';
// import 'package:darkak_e_commerce_app/core/utils/urls.dart';
// import 'package:darkak_e_commerce_app/models/final_cart_item.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
//
// class SummarySectionScreen extends StatefulWidget {
//   final List<CartItem> cartItemList;
//   final int totalAmount;
//   const SummarySectionScreen(
//       {super.key, required this.cartItemList, required this.totalAmount});
//
//   @override
//   State<SummarySectionScreen> createState() => _SummarySectionScreenState();
// }
//
// class _SummarySectionScreenState extends State<SummarySectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Flexible(
//           child: ListView.separated(
//               scrollDirection: Axis.vertical,
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 final item = widget.cartItemList[index];
//                 return SizedBox(
//                   width: double.infinity,
//                   height: 100.h,
//                   child: Row(
//                     children: [
//                       Container(
//                         width: 100.w,
//                         height: double.infinity.h,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(4.r),
//                             image: DecorationImage(
//                                 image: CachedNetworkImageProvider(
//                                     '${Urls.imgUrl}${item.products!.images![0].path}'),
//                                 fit: BoxFit.cover)),
//                       ),
//                       Gap(40.w),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             '${item.products!.name}',
//                             style: Get.textTheme.bodyLarge,
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                   '${Urls.takaSign}${item.products!.offerPrice}',
//                                   style: Get.textTheme.bodyMedium!
//                                       .copyWith(color: orangeClr)),
//                               Gap(48.w),
//                               Row(
//                                 children: [
//                                   Icon(
//                                     Icons.star,
//                                     color: yellowClr,
//                                     size: 20.sp,
//                                   ),
//                                   Text('4.5', style: Get.textTheme.bodyMedium)
//                                 ],
//                               )
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text(
//                                 'Size: ${item.size}',
//                                 style: Get.textTheme.bodyMedium,
//                               ),
//                               Gap(48.w),
//                               Text('Quantity: ${item.quantity.toString()}',
//                                   style: Get.textTheme.bodyMedium)
//                             ],
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//               separatorBuilder: (context, index) => Gap(16.h),
//               itemCount: widget.cartItemList.length),
//         ),
//         Divider(
//           color: orangeClr.withOpacity(0.3),
//           thickness: 1.h,
//         ),
//         Text(
//           'Shipping Address',
//           style: Get.textTheme.titleLarge,
//         ),
//         Gap(16.h),
//         GetBuilder<CheckOutScreenController>(builder: (controller) {
//           return Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(controller.readAddressModel!.fullName ?? '',
//                       style: Get.textTheme.titleMedium),
//                   Text(controller.readAddressModel!.mobile ?? '',
//                       style:
//                           Get.textTheme.titleMedium!.copyWith(color: greyClr))
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                       child: Text(
//                           '${controller.readAddressModel!.address ?? ''}, ${controller.readAddressModel!.area ?? ''}, ${controller.readAddressModel!.zip ?? ''}\n${controller.readAddressModel!.thana ?? ''}, ${controller.readAddressModel!.city ?? ''}, ${controller.readAddressModel!.state ?? ''}',
//                           style: Get.textTheme.bodyMedium)),
//                   Checkbox(
//                     value: true,
//                     onChanged: (newValue) {},
//                     activeColor: orangeClr,
//                     shape: const CircleBorder(),
//                   )
//                 ],
//               ),
//             ],
//           );
//         }),
//         Divider(
//           color: orangeClr.withOpacity(0.3),
//           thickness: 1.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('Delivery charge', style: Get.textTheme.bodyMedium),
//             Text('----------------------',
//                 style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)),
//             Text('${Urls.takaSign}50', style: Get.textTheme.bodyMedium)
//           ],
//         ),
//         Gap(16.h),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Text('Total Amount', style: Get.textTheme.bodyMedium),
//             Text('----------------------',
//                 style: Get.textTheme.bodyMedium!.copyWith(color: orangeClr)),
//             Text('${Urls.takaSign}${widget.totalAmount.toString()}',
//                 style: Get.textTheme.bodyMedium)
//           ],
//         ),
//         Divider(
//           color: orangeClr.withOpacity(0.3),
//           thickness: 1.h,
//         ),
//       ],
//     );
//   }
// }
