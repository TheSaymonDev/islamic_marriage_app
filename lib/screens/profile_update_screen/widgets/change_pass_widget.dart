import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controllers/change_pass_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/models/change_pass_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class ChangePassWidget extends StatelessWidget {
  ChangePassWidget({Key? key}) : super(key: key);

  final _changePassController = Get.find<ChangePassController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _changePassController.formKey,
      child: CustomBottomSheet(children: [
        Text('changePass'.tr, style: Theme.of(context).textTheme.titleMedium),
        Gap(32.h),
        GetBuilder<ChangePassController>(builder: (controller) {
          return CustomTextFormField(
              hintText: 'oldPass'.tr,
              controller: controller.oldPasswordController,
              validator: passwordValidator,
              obscureText: controller.isObscureOld,
              suffixIcon: IconButton(
                  onPressed: () => controller.toggleObscureOld(),
                  icon: Icon(
                      controller.isObscureOld
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: greyClr,
                      size: 25.sp)));
        }),
        Gap(16.h),
        GetBuilder<ChangePassController>(builder: (controller) {
          return CustomTextFormField(
            hintText: 'setPasswordNewPassHint'.tr,
            controller: controller.newPasswordController,
            obscureText: controller.isObscureNew,
            validator: passwordValidator,
            suffixIcon: IconButton(
                onPressed: () => controller.toggleObscureN(),
                icon: Icon(
                    controller.isObscureNew
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: greyClr,
                    size: 25.sp)),
          );
        }),
        Gap(16.h),
        GetBuilder<ChangePassController>(
          builder: (controller) {
            return CustomTextFormField(
                hintText: 'setPasswordConPassHint'.tr,
                controller:
                controller.confirmPasswordController,
                obscureText: controller.isObscureConfirm,
                validator: (value) => confirmPasswordValidator(value,
                    controller.newPasswordController),
                suffixIcon: IconButton(
                    onPressed: () => controller.toggleObscureC(),
                    icon: Icon(
                        controller.isObscureConfirm
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: greyClr,
                        size: 25.sp)));
          },
        ),
        Gap(32.h),
        GetBuilder<ChangePassController>(
            builder: (controller) => controller.isLoading
                ? customCircularProgressIndicator
                : CustomElevatedButton(
                onPressed: () {
                  _submitChangePassword(context, controller);
                },
                buttonName: 'confirm'.tr)),
        Gap(32.h)
      ]),
    );
  }

  void _submitChangePassword(
      BuildContext context, ChangePassController controller) async {
   if(controller.formKey.currentState!.validate()){
     final result = await controller.changingPassword(
         changePassData: ChangePassModel(
             oldPassword: controller.oldPasswordController.text,
             newPassword: controller.newPasswordController.text,
             confirmPassword: controller.confirmPasswordController.text));
     if (result) {
       Navigator.pop(context);
     }
   }
  }

}
