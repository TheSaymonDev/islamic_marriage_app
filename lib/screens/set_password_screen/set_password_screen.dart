import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/set_password_screen/controller/set_password_controller.dart';
import 'package:islamic_marriage/screens/set_password_screen/model/set_password.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_text_logo.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SetPasswordScreen extends StatefulWidget {


  SetPasswordScreen({super.key});

  @override
  State<SetPasswordScreen> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {

  String? identity;
  final _formKey = GlobalKey<FormState>();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    identity = Get.arguments['identity'] as String;
  }

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
                Text('setPasswordTitle'.tr,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(color: purpleClr)),
                Gap(8.h),
                Text(
                  'setPasswordSubTitle'.tr,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyClr),
                  textAlign: TextAlign.center
                ),
                Gap(32.h),
                GetBuilder<SetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'setPasswordNewPassHint'.tr,
                    controller: _newPasswordController,
                    obscureText: controller.isObscureNew,
                    validator: passwordValidator,
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscureN(),
                        icon: Icon(
                          controller.isObscureNew
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: greyClr,
                          size: 25.sp
                        )),
                  );
                }),
                Gap(16.h),
                GetBuilder<SetPasswordController>(builder: (controller) {
                  return CustomTextFormField(
                    hintText: 'setPasswordConPassHint'.tr,
                    controller: _confirmPasswordController,
                    obscureText: controller.isObscureConfirm,
                    validator: (value) =>
                        confirmPasswordValidator(value, _newPasswordController),
                    suffixIcon: IconButton(
                        onPressed: () => controller.toggleObscureC(),
                        icon: Icon(
                          controller.isObscureConfirm
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: greyClr,
                          size: 25.sp
                        ))
                  );
                },),
                Gap(16.h),
                GetBuilder<SetPasswordController>(
                    builder: (controller) => controller.isLoading
                        ? customCircularProgressIndicator
                        : CustomElevatedButton(
                            onPressed: () => _formOnSubmit(controller),
                            buttonName: 'recoverPass'.tr))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _clearData() {
    _newPasswordController.clear();
    _confirmPasswordController.clear();
  }

  void _formOnSubmit(SetPasswordController controller) async {
    if (_formKey.currentState?.validate() ?? false) {
      final result = await controller.setNewPassword(
          setPassword: SetPassword(
              identity: identity,
              password: _newPasswordController.text.trim()));
      if (result == true) {
        _clearData();
        Get.offAllNamed(AppRoutes.signInScreen);
      }
    }
  }
}
