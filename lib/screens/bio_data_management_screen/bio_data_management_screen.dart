import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/address_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/contact_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/family_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/general_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/personal_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/pledge_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/submit_bio_data_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/address_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/contact_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/edu_qualifications_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/expected_life_partner_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/family_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/general_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/marriage_related_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/occupational_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/personal_info_form.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/pledge_form.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_bottom_sheet.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class BioDataManagementScreen extends StatefulWidget {
  const BioDataManagementScreen({super.key});

  @override
  State<BioDataManagementScreen> createState() =>
      _BioDataManagementScreenState();
}

class _BioDataManagementScreenState extends State<BioDataManagementScreen> {
  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 0.
  // OPTIONAL: can be set directly.
  int upperBound = 9; // upperBound MUST BE total number of icons minus 1.

  @override
  void initState() {
    super.initState();
    Get.find<CurrentUserBioDataController>().getCurrentUserBioData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'appbarTitle'.tr,
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: GetBuilder<CurrentUserBioDataController>(
            builder: (controller) => controller.isLoading
                ? customCircularProgressIndicator
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconStepper(
                        activeStepColor: Colors.transparent,
                        activeStepBorderColor: Colors.transparent,
                        lineColor: violetClr,
                        stepColor: Colors.transparent,
                        enableNextPreviousButtons: false,
                        stepRadius: 20.sp,
                        icons: [
                          Icon(FontAwesomeIcons.circleInfo,
                              color: activeStep == 0 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.locationDot,
                              color: activeStep == 1 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.graduationCap,
                              color: activeStep == 2 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.peopleRoof,
                              color: activeStep == 3 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.idCard,
                              color: activeStep == 4 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.briefcase,
                              color: activeStep == 5 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.handshakeAngle,
                              color: activeStep == 6 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.handHoldingHeart,
                              color: activeStep == 7 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.productHunt,
                              color: activeStep == 8 ? purpleClr : violetClr),
                          Icon(FontAwesomeIcons.phoneVolume,
                              color: activeStep == 9 ? purpleClr : violetClr),
                        ],

                        // activeStep property set to activeStep variable defined above.
                        activeStep: activeStep,
                        // onStepReached: null,
                        // This ensures step-tapping updates the activeStep.
                        onStepReached: (index) {
                          setState(() {
                            activeStep = index;
                          });
                        },
                      ),
                      Text(headerText(), style: AppTextStyles.titleLarge()),
                      Divider(
                        color: greyClr,
                        height: 0.h,
                        thickness: 2.w,
                      ),
                      Gap(16.h),
                      Expanded(
                        child: SingleChildScrollView(child: bodyComponents()),
                      ),
                      Gap(8.h),
                      Container(child: button()),
                      Gap(16.h)
                    ],
                  )),
      ),
    );
  }

  String headerText() {
    switch (activeStep) {
      case 1:
        return 'step2'.tr;

      case 2:
        return 'step3'.tr;

      case 3:
        return 'step4'.tr;

      case 4:
        return 'step5'.tr;

      case 5:
        return 'step6'.tr;

      case 6:
        return 'step7'.tr;

      case 7:
        return 'step8'.tr;

      case 8:
        return 'step9'.tr;

      case 9:
        return 'step10'.tr;

      default:
        return 'step1'.tr;
    }
  }

  Widget bodyComponents() {
    switch (activeStep) {
      case 1:
        return const AddressForm();
      case 2:
        return const EduQualificationsForm();
      case 3:
        return const FamilyInfoForm();
      case 4:
        return const PersonalInfoForm();
      case 5:
        return const OccupationalInfoForm();
      case 6:
        return const MarriageRelatedInfoForm();
      case 7:
        return const ExpectedLifePartnerForm();
      case 8:
        return const PledgeForm();
      case 9:
        return const ContactForm();
      default:
        return const GeneralInfoForm();
    }
  }

  Widget button() {
    switch (activeStep) {
      case 1:
        return _addressButton();
      case 2:
        return _eduQualificationButton();
      case 3:
        return _familyInfoButton();
      case 4:
        return _personalInfoButton();
      case 5:
        return _occupationalInfoButton();
      case 6:
        return _marriageInfoButton();
      case 7:
        return _expectedLifePartnerButton();
      case 8:
        return _pledgeButton();
      case 9:
        return _contactButton();
      default:
        return _generalInfoButton();
    }
  }

  Widget _generalInfoButton() {
    return GetBuilder<GeneralInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Align(
                alignment: Alignment.centerRight,
                child: CustomElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      final result = await controller.upsertGeneralInfo();
                      if (result) {
                        setState(() {
                          activeStep++;
                        });
                      }
                    }
                  },
                  buttonName: 'saveBtn'.tr,
                  buttonWidth: 140.w,
                ),
              ));
  }

  Widget _addressButton() {
    return GetBuilder<AddressInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertAddress();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _eduQualificationButton() {
    return GetBuilder<EduQualificationsController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertEduInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _familyInfoButton() {
    return GetBuilder<FamilyInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertFamilyInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _personalInfoButton() {
    return GetBuilder<PersonalInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertPersonalInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _occupationalInfoButton() {
    return GetBuilder<OccupationalInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertOccupationalInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _marriageInfoButton() {
    return GetBuilder<MarriageRelatedInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertMarriageInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _expectedLifePartnerButton() {
    return GetBuilder<ExpectedLifePartnerController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.upsertExpectedLifePartner();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _pledgeButton() {
    return GetBuilder<PledgeController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertPledge();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _contactButton() {
    return GetBuilder<ContactController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _previousButton(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.upsertContact();
                        if (result) {
                          _showSubmitBioDataBottomSheet(context);
                        }
                      }
                    },
                    buttonName: 'saveBtn'.tr,
                    buttonWidth: 140.w,
                  ),
                ],
              ));
  }

  Widget _previousButton() {
    return CustomElevatedButton(
      onPressed: () {
        setState(() {
          activeStep--;
        });
      },
      buttonName: 'previousBtn'.tr,
      buttonWidth: 140.w,
    );
  }

  void _showSubmitBioDataBottomSheet(BuildContext context) {
    Get.bottomSheet(CustomBottomSheet(children: [
      Center(
          child: Container(
              height: 5.h,
              width: 60.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.r), color: violetClr))),
      Gap(32.h),
      Center(
          child: Text('submitTitle'.tr,
              style: Theme.of(context).textTheme.titleLarge)),
      Gap(16.h),
      Center(
          child: Text('submitSubTitle'.tr,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center)),
      Gap(32.h),
      Row(
        children: [
          Expanded(
              child: CustomElevatedButton(
                  onPressed: () => Get.back(),
                  buttonName: 'submitCancelBtn'.tr)),
          Gap(32.w),
          Expanded(
              child: GetBuilder<SubmitBioDataController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : CustomElevatedButton(
                          onPressed: () async {
                            final result = await controller.submitBioData();
                            if (result) {
                              Get.offNamed(AppRoutes.homeScreen);
                            }
                          },
                          buttonName: 'submitBtn'.tr)))
        ],
      ),
      Gap(32.h)
    ]));
  }
}
