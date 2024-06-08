import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/checkout_screen/widgets/step_address_widget.dart';
import 'package:islamic_marriage/screens/checkout_screen/widgets/step_delivery_type_widget.dart';
import 'package:islamic_marriage/screens/checkout_screen/widgets/step_payment_method_widget.dart';
import 'package:islamic_marriage/screens/checkout_screen/widgets/step_summary_widget.dart';
import 'package:islamic_marriage/screens/home_screen/home_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';

class CheckOutScreen extends StatefulWidget {

  //final List<CartItem> cartItemList;
  final int totalAmount;
  const CheckOutScreen(
      {super.key,required this.totalAmount});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _currentStep = 0;
  List<Step> _stepList() {
    return [
      Step(
        isActive: _currentStep >= 0,
        state: _currentStep > 0 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 0 ? 'Delivery' : '',
            style: AppTextStyles.titleSmall()),
        content: const StepDeliveryTypeWidget(),
      ),
      Step(
        isActive: _currentStep >= 1,
        state: _currentStep > 1 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 1 ? 'Address' : '',
            style: AppTextStyles.titleSmall()),
        content: const StepAddressWidget(),
      ),
      Step(
        isActive: _currentStep >= 2,
        state: _currentStep > 2 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 2 ? 'Summary' : '',
            style: AppTextStyles.titleSmall()),
        content: StepSummaryWidget(
          //totalAmount: widget.totalAmount,
        ),
      ),
      Step(
        isActive: _currentStep >= 3,
        state: _currentStep > 3 ? StepState.complete : StepState.indexed,
        title: Text(_currentStep == 3 ? 'Payments' : '',
            style: AppTextStyles.titleSmall()),
        content: const StepPaymentMethodWidget(),
      ),
    ];
  }



  // List<String> cartIdList = [];
  // List<String> packageCodeList = [];
  // _getCartIdAndPackageCode() {
  //   for (int i = 0; i < widget.cartItemList.length; i++) {
  //     CartItem cartItem = widget.cartItemList[i];
  //     cartIdList.add(cartItem.id!);
  //     packageCodeList.add(Get.find<OrderPackageController>().packageCode!);
  //   }
  // }

  // String? _addressId;


  // @override
  // void initState() {
  //   super.initState();
  //   Get.find<StepAddressController>().getShippingAddress();
  //   _addressId = Get.find<StepAddressController>().readAddress!.id;
  //   Get.find<OrderPackageController>().getPackageData();
  //   _getCartIdAndPackageCode();
  // }



  @override
  Widget build(BuildContext context) {
    final isLastStep = _currentStep == _stepList().length - 1;
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: (){}, title: 'Checkout',),
      body: SizedBox(
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                connectorColor: const WidgetStatePropertyAll(AppColors.violetClr),
                connectorThickness: 3.h,
                steps: _stepList(),
                type: StepperType.horizontal,
                elevation: 0,
                currentStep: _currentStep,
                controlsBuilder: (context, details) {
                  return const SizedBox();
                },
              ),
            ),
            // GetBuilder<OrderController>(builder: (controller) {
            //   return controller.isLoading == true
            //       ? customCircularProgressIndicator
            //       : Padding(
            //     padding: EdgeInsets.symmetric(horizontal: 25.w),
            //     child: Row(
            //       children: [
            //         if (_currentStep > 0)
            //           GestureDetector(
            //             onTap: () {
            //               if (_currentStep == 0) {
            //                 return;
            //               } else {
            //                 setState(() {
            //                   _currentStep = _currentStep - 1;
            //                 });
            //               }
            //             },
            //             child: Container(
            //               height: 55.h,
            //               width: 146.w,
            //               alignment: Alignment.center,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(4.r),
            //                   border: Border.all(
            //                       color: AppColors.violetClr, width: 2.w),
            //                   color: AppColors.whiteClr),
            //               child: Text('Back',
            //                   style: Get.textTheme.titleMedium),
            //             ),
            //           ),
            //         const Spacer(),
            //         GestureDetector(
            //           onTap: () async {
            //             final isLastStep =
            //                 _currentStep == _stepList().length - 1;
            //             if (isLastStep) {
            //               final createOrder = CreateOrder(
            //                   carts: cartIdList,
            //                   address: _addressId,
            //                   amount: widget.totalAmount,
            //                   paymentMethod:'CASH_ON_DELIVERY',
            //                   note: 'Deliver This Product',
            //                   delivery:  Get.find<StepDeliveryTypeController>().selectedOption!.value,
            //                   packageCode: packageCodeList
            //               );
            //               final result = await controller.createOrder(
            //                   orderModel: createOrder);
            //               if (result == true) {
            //                 Get.off(() => const PaymentSuccessScreen());
            //               }
            //             } else {
            //               setState(() {
            //                 _currentStep++;
            //               });
            //             }
            //           },
            //           child: Container(
            //             height: 55.h,
            //             width: 146.w,
            //             alignment: Alignment.center,
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(4.r),
            //               color: AppColors.violetClr,
            //             ),
            //             child: Text(isLastStep ? 'Confirm' : 'Next',
            //                 style: Get.textTheme.titleMedium!
            //                     .copyWith(color: AppColors.whiteClr)),
            //           ),
            //         ),
            //       ],
            //     ),
            //   );
            // }),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    GestureDetector(
                      onTap: () {
                        if (_currentStep == 0) {
                          return;
                        } else {
                          setState(() {
                            _currentStep = _currentStep - 1;
                          });
                        }
                      },
                      child: Container(
                        height: 55.h,
                        width: 146.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.r),
                            color: AppColors.violetClr),
                        child: Text('Back',
                            style: AppTextStyles.titleMedium(color: AppColors.whiteClr)),
                      ),
                    ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () async {
                      final isLastStep =
                          _currentStep == _stepList().length - 1;
                      if (isLastStep) {
                       Get.offAll(()=> HomeScreen());
                      } else {
                        setState(() {
                          _currentStep++;
                        });
                      }
                    },
                    child: Container(
                      height: 55.h,
                      width: 146.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.r),
                        color: AppColors.violetClr,
                      ),
                      child: Text(isLastStep ? 'Confirm' : 'Next',
                          style: AppTextStyles.titleMedium(color: AppColors.whiteClr)),
                    ),
                  ),
                ],
              ),
            ),
            Gap(32.h),
          ],
        ),
      ),
    );
  }
}
