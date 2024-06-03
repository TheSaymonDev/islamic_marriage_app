import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/checkout_screen/controller/step_delivery_type_controller.dart';
import 'package:islamic_marriage/screens/checkout_screen/model/delivery_option.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class StepDeliveryTypeWidget extends StatefulWidget {
  const StepDeliveryTypeWidget({super.key});
  @override
  State<StepDeliveryTypeWidget> createState() =>
      _StepDeliveryTypeWidgetState();
}
class _StepDeliveryTypeWidgetState extends State<StepDeliveryTypeWidget> {


  @override
  void initState() {
    super.initState();
    Get.find<StepDeliveryTypeController>().deliveryTypeOnChanged(DeliveryOption.deliveryOptionList[0]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
          DeliveryOption.deliveryOptionList.length,
              (index) => Padding(
            padding: EdgeInsets.only(bottom: 40.h),
            child:
            GetBuilder<StepDeliveryTypeController>(builder: (controller) {
              return RadioListTile<DeliveryOption>(
                activeColor: AppColors.violetClr,
                tileColor: AppColors.whiteClr,
                controlAffinity: ListTileControlAffinity.trailing,
                contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DeliveryOption.deliveryOptionList[index].title,
                      style: AppTextStyles.titleLarge(),
                    ),
                    Gap(8.h),
                  ],
                ),
                subtitle: Text(
                  DeliveryOption.deliveryOptionList[index].subTitle,
                  style: AppTextStyles.bodyMedium(),
                ),
                groupValue: controller.selectedOption,
                value: DeliveryOption.deliveryOptionList[index],
                onChanged: (value) => controller.deliveryTypeOnChanged(value),
              );
            }),
          )),
    );
  }
}
