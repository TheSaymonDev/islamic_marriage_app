import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/address_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/contact_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/family_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/general_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/personal_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/pledge_controller.dart';
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
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/shared_preference_service.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
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
    Get.find<MyBioDataController>().getCurrentUser();
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
        child: GetBuilder<MyBioDataController>(
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
      // body: Container(
      //   height: double.infinity.h,
      //   width: double.infinity.w,
      //   padding: EdgeInsets.symmetric(horizontal: 16.w),
      //   child: GetBuilder<MyBioDataController>(
      //     builder: (controller) => controller.isLoading
      //         ? customCircularProgressIndicator
      //         : Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         IconStepper(
      //           activeStepColor: Colors.transparent,
      //           activeStepBorderColor: Colors.transparent,
      //           lineColor: violetClr,
      //           stepColor: Colors.transparent,
      //           enableNextPreviousButtons: false,
      //           stepRadius: 20.sp,
      //           icons: [
      //             Icon(FontAwesomeIcons.circleInfo,
      //                 color: activeStep == 0
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.locationDot,
      //                 color: activeStep == 1
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.graduationCap,
      //                 color: activeStep == 2
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.peopleRoof,
      //                 color: activeStep == 3
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.idCard,
      //                 color: activeStep == 4
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.briefcase,
      //                 color: activeStep == 5
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.handshakeAngle,
      //                 color: activeStep == 6
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.handHoldingHeart,
      //                 color: activeStep == 7
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.productHunt,
      //                 color: activeStep == 8
      //                     ? purpleClr
      //                     : violetClr),
      //             Icon(FontAwesomeIcons.phoneVolume,
      //                 color: activeStep == 9
      //                     ? purpleClr
      //                     : violetClr),
      //           ],
      //
      //           // activeStep property set to activeStep variable defined above.
      //           activeStep: activeStep,
      //
      //           // This ensures step-tapping updates the activeStep.
      //           onStepReached: (index) {
      //             setState(() {
      //               activeStep = index;
      //             });
      //           },
      //         ),
      //         Text(headerText(), style: AppTextStyles.titleLarge()),
      //         Divider(
      //           color: greyClr,
      //           height: 0.h,
      //           thickness: 2.w,
      //         ),
      //         Gap(16.h),
      //         Expanded(
      //           child: SingleChildScrollView(child: bodyComponents()),
      //         ),
      //         Gap(8.h),
      //         Container(child: button()),
      //         Gap(16.h)
      //       ],
      //     ),
      //   ),
      // ),
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
                        final result =
                            await controller.upsertEduQualificationsInfo();
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
                          setState(() {
                            Navigator.pop(context);
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

  // Widget _generalInfoButton() {
  //   return GetBuilder<GeneralInfoController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Align(
  //               alignment: Alignment.centerRight,
  //               child: CustomElevatedButton(
  //                 onPressed: () async {
  //                   if (Get.find<MyBioDataController>()
  //                           .myBioData!
  //                           .personalInformation !=
  //                       null) {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result = await controller.updateGeneralInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   } else {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result = await controller.createGeneralInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   }
  //                 },
  //                 buttonName: 'Save & Next',
  //                 buttonWidth: 140.w,
  //               ),
  //             ));
  // }
  //
  // Widget _addressButton() {
  //   return GetBuilder<AddressController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>().myBioData!.address !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.updateAddress();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.createAddress();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _eduQualificationButton() {
  //   return GetBuilder<EduQualificationsController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>()
  //                             .myBioData!
  //                             .education !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result =
  //                             await controller.updateEduQualification();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result =
  //                             await controller.createEduQualification();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _familyInfoButton() {
  //   return GetBuilder<FamilyInfoController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>()
  //                             .myBioData!
  //                             .familyInformation !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.updateFamilyInfo();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.createFamilyInfo();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _personalInfoButton() {
  //   return GetBuilder<PersonalInfoController>(
  //     builder: (controller) => controller.isLoading
  //         ? customCircularProgressIndicator
  //         : Row(
  //             children: [
  //               _previousButton(),
  //               const Spacer(),
  //               CustomElevatedButton(
  //                 onPressed: () async {
  //                   if (Get.find<MyBioDataController>()
  //                           .myBioData!
  //                           .lifeStyleInformation !=
  //                       null) {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result = await controller.updatePersonalInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   } else {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result = await controller.createPersonalInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   }
  //                 },
  //                 buttonName: 'Save & Next',
  //                 buttonWidth: 140.w,
  //               ),
  //             ],
  //           ),
  //   );
  // }
  //
  // Widget _occupationalInfoButton() {
  //   return GetBuilder<OccupationalInfoController>(
  //     builder: (controller) => controller.isLoading
  //         ? customCircularProgressIndicator
  //         : Row(
  //             children: [
  //               _previousButton(),
  //               const Spacer(),
  //               CustomElevatedButton(
  //                 onPressed: () async {
  //                   if (Get.find<MyBioDataController>().myBioData!.occupation !=
  //                       null) {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result =
  //                           await controller.updateOccupationalInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   } else {
  //                     if (controller.formKey.currentState!.validate()) {
  //                       final result =
  //                           await controller.createOccupationalInfo();
  //                       if (result) {
  //                         setState(() {
  //                           activeStep++;
  //                         });
  //                       }
  //                     }
  //                   }
  //                 },
  //                 buttonName: 'Save & Next',
  //                 buttonWidth: 140.w,
  //               ),
  //             ],
  //           ),
  //   );
  // }
  //
  // Widget _marriageInfoButton() {
  //   return GetBuilder<MarriageRelatedInfoController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>()
  //                             .myBioData!
  //                             .marriageInfo !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.updateMarriageInfo();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.createMarriageInfo();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _expectedLifePartnerButton() {
  //   return GetBuilder<ExpectedLifePartnerController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>().myBioData!.partner !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result =
  //                             await controller.updateExpectedLifePartner();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result =
  //                             await controller.createExpectedLifePartner();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _pledgeButton() {
  //   return GetBuilder<PledgeController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>().myBioData!.pledge !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.updatePledge();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.createPledge();
  //                         if (result) {
  //                           setState(() {
  //                             activeStep++;
  //                           });
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Next',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }
  //
  // Widget _contactButton() {
  //   return GetBuilder<ContactController>(
  //       builder: (controller) => controller.isLoading
  //           ? customCircularProgressIndicator
  //           : Row(
  //               children: [
  //                 _previousButton(),
  //                 const Spacer(),
  //                 CustomElevatedButton(
  //                   onPressed: () async {
  //                     if (Get.find<MyBioDataController>().myBioData!.contact !=
  //                         null) {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.updateContact();
  //                         if (result) {
  //                           showAppDialogBox(
  //                             title: 'Submit Alert!',
  //                             middleText:
  //                                 'Are you sure you want to submit this Bio-Data?',
  //                             onPressedCancel: () {
  //                               Get.back();
  //                             },
  //                             onPressedConfirm: () async {
  //                               final result =
  //                                   await Get.find<SubmitBioDataController>()
  //                                       .submitBioData();
  //                               if (result == true) {
  //                                 Navigator.pop(context);
  //                               }
  //                             },
  //                           );
  //                         }
  //                       }
  //                     } else {
  //                       if (controller.formKey.currentState!.validate()) {
  //                         final result = await controller.createContact();
  //                         if (result) {
  //                           showAppDialogBox(
  //                             title: 'Submit Alert!',
  //                             middleText:
  //                                 'Are you sure you want to submit this Bio-Data?',
  //                             onPressedCancel: () {
  //                               Get.back();
  //                             },
  //                             onPressedConfirm: () async {
  //                               final result =
  //                                   await Get.find<SubmitBioDataController>()
  //                                       .submitBioData();
  //                               if (result) {
  //                                 Get.back();
  //                               }
  //                             },
  //                           );
  //                         }
  //                       }
  //                     }
  //                   },
  //                   buttonName: 'Save & Submit',
  //                   buttonWidth: 140.w,
  //                 ),
  //               ],
  //             ));
  // }

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
}
