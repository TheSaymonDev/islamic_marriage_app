// import 'package:darkak_e_commerce_app/core/utils/colors.dart';
// import 'package:darkak_e_commerce_app/core/utils/urls.dart';
// import 'package:darkak_e_commerce_app/views/widgets/common_widgets/custom_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:gap/gap.dart';
// import 'package:get/get.dart';
// import 'package:lottie/lottie.dart';
//
// class PaymentMethodSectionScreen extends StatefulWidget {
//   const PaymentMethodSectionScreen({super.key});
//
//   @override
//   State<PaymentMethodSectionScreen> createState() =>
//       _PaymentMethodSectionScreenState();
// }
//
// class _PaymentMethodSectionScreenState extends State<PaymentMethodSectionScreen>
//     with TickerProviderStateMixin {
//   List<String> mobileBankingImgPath = [
//     'assets/images/bkash.svg',
//     'assets/images/rocket.svg',
//     'assets/images/nagad.svg'
//   ];
//   int _currentMobileBankingMediumIndex = 0;
//
//   List<String> bankingImgPath = [
//     'assets/images/visa.png',
//     'assets/images/master_card.png',
//     'assets/images/american_express.png'
//   ];
//   int _currentCardMediumIndex = 0;
//
//   late final TabController _tabController;
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 700.h,
//       child: Column(
//         children: [
//           TabBar(
//             padding: EdgeInsets.zero,
//             controller: _tabController,
//             indicatorColor: orangeClr,
//             tabs: [
//               Tab(
//                 icon: SvgPicture.asset(
//                   'assets/images/saved-card.svg',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               Tab(
//                 icon: SvgPicture.asset(
//                   'assets/images/mobile-banking.svg',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               Tab(
//                 icon: SvgPicture.asset(
//                   'assets/images/credit-card.svg',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//               Tab(
//                 icon: SvgPicture.asset(
//                   'assets/images/wallet.svg',
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             ],
//           ),
//           Gap(16.h),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 SizedBox(
//                   height: 400.h,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Lottie.asset(Urls.cashOnDeliveryLottie),
//                       Text('Cash on delivery is available now',
//                           style: Get.textTheme.bodyLarge),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: double.infinity.w,
//                   height: 400.h,
//                   child: Stack(
//                     children: [
//                       Column(
//                         children: List.generate(
//                           mobileBankingImgPath.length,
//                           (index) => Padding(
//                             padding: EdgeInsets.only(bottom: 16.h),
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _currentMobileBankingMediumIndex = index;
//                                 });
//                               },
//                               child: CustomCard(
//                                 width: double.infinity.w,
//                                 height: 70.h,
//                                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                                 border: Border.all(
//                                     width: 2.w,
//                                     color: _currentMobileBankingMediumIndex ==
//                                             index
//                                         ? orangeClr
//                                         : Colors.transparent),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(),
//                                     SizedBox(
//                                       height: 60.h,
//                                       width: 80.w,
//                                       child: SvgPicture.asset(
//                                         mobileBankingImgPath[index],
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.done_all,
//                                       color: _currentMobileBankingMediumIndex ==
//                                               index
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                       size: 25.sp,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           child: Container(
//                               alignment: Alignment.center,
//                               height: double.infinity.h,
//                               width: double.infinity.w,
//                               color: Colors.white70,
//                               child: Image.asset(
//                                 Urls.lockPng,
//                                 width: 100.w,
//                               )))
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   width: double.infinity.w,
//                   height: 400.h,
//                   child: Stack(
//                     children: [
//                       Column(
//                         children: List.generate(
//                           bankingImgPath.length,
//                           (index) => Padding(
//                             padding: EdgeInsets.only(bottom: 16.h),
//                             child: GestureDetector(
//                               onTap: () {
//                                 setState(() {
//                                   _currentCardMediumIndex = index;
//                                 });
//                               },
//                               child: CustomCard(
//                                 width: double.infinity.w,
//                                 height: 70.h,
//                                 padding: EdgeInsets.symmetric(horizontal: 16.w),
//                                 border: Border.all(
//                                     width: 2.w,
//                                     color: _currentCardMediumIndex == index
//                                         ? orangeClr
//                                         : Colors.transparent),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     const SizedBox(),
//                                     SizedBox(
//                                       height: 60.h,
//                                       width: 80.w,
//                                       child: Image.asset(
//                                         bankingImgPath[index],
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     Icon(
//                                       Icons.done_all,
//                                       color: _currentCardMediumIndex == index
//                                           ? Colors.green
//                                           : Colors.transparent,
//                                       size: 25.sp,
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                           child: Container(
//                               alignment: Alignment.center,
//                               height: double.infinity.h,
//                               width: double.infinity.w,
//                               color: Colors.white70,
//                               child: Image.asset(
//                                 Urls.lockPng,
//                                 width: 100.w,
//                               )))
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 400.h,
//                   child: Stack(
//                     children: [
//                       Center(
//                         child: Text('Wallet', style: Get.textTheme.bodyLarge),
//                       ),
//                       Positioned(
//                           child: Container(
//                               alignment: Alignment.center,
//                               height: double.infinity.h,
//                               width: double.infinity.w,
//                               color: Colors.white70,
//                               child: Image.asset(
//                                 Urls.lockPng,
//                                 width: 100.w,
//                               )))
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
