import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/controller/identity_verification_controller.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/model/identity_verification.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class IdentityVerificationScreen extends StatelessWidget {
  IdentityVerificationScreen({super.key});

  final _identityController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: () {
        Get.back();
      }),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(32.h),
                const CustomTextLogo(),
                Gap(150.h),
                Text('identityTitle'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: purpleClr)),
                Gap(8.h),
                Text('identitySubTitle'.tr,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyClr),
                    textAlign: TextAlign.center),
                Gap(32.h),
                CustomTextFormField(
                    hintText: 'identityPhoneHint'.tr,
                    controller: _identityController,
                    validator: mobileValidator,
                    keyBoardType: TextInputType.phone),
                Gap(16.h),
                GetBuilder<IdentityVerificationController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : CustomElevatedButton(
                          onPressed: () => _formOnSubmit(controller),
                          buttonName: 'sendOtp'.tr),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _formOnSubmit(IdentityVerificationController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.identityVerify(
          identityVerification: IdentityVerification(
              identity: _identityController.text.trim()));
      if (result == true) {
        Get.toNamed(
          AppRoutes.forgetOtpVerificationScreen,
          arguments: {
            'identity': _identityController.text.trim()
          },
        );
      }
    }
  }
}
