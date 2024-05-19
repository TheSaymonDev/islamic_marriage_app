import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:im_stepper/stepper.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/address_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/contact_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/family_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/general_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/personal_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/address_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/contact_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/edu_qualifications_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/expected_life_partner_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/family_info_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/general_info_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/marriage_related_info_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/occapational_info_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/personal_info_form.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/pledge_form.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class CreateBioDataScreen extends StatefulWidget {
  const CreateBioDataScreen({super.key});

  @override
  State<CreateBioDataScreen> createState() => _CreateBioDataScreenState();
}

class _CreateBioDataScreenState extends State<CreateBioDataScreen> {
  // REQUIRED: USED TO CONTROL THE STEPPER.
  int activeStep = 0; // Initial step set to 0.
  // OPTIONAL: can be set directly.
  int upperBound = 9; // upperBound MUST BE total number of icons minus 1.

  @override
  void initState() {
    super.initState();
    // Get.find<AddressController>().readAddress();
    // Get.find<EduQualificationsController>().readEduQualification();
    // Get.find<FamilyInfoController>().readFamilyInfo();
    // Get.find<PersonalInfoController>().readPersonalInfo();
    // Get.find<OccupationalInfoController>().readOccupationalInfo();
    // Get.find<MarriageRelatedInfoController>().readMarriageInfo();
    // Get.find<ExpectedLifePartnerController>().readExpectedLifePartner();
    // Get.find<PledgeController>().readPledge();
    // Get.find<ContactController>().readContact();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'Bio Data',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconStepper(
              activeStepColor: Colors.transparent,
              activeStepBorderColor: Colors.transparent,
              lineColor: AppColors.violetClr,
              stepColor: Colors.transparent,
              enableNextPreviousButtons: false,
              stepRadius: 20.sp,
              icons: [
                Icon(FontAwesomeIcons.circleInfo,
                    color: activeStep == 0
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.locationDot,
                    color: activeStep == 1
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.graduationCap,
                    color: activeStep == 2
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.peopleRoof,
                    color: activeStep == 3
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.idCard,
                    color: activeStep == 4
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.briefcase,
                    color: activeStep == 5
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.handshakeAngle,
                    color: activeStep == 6
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.handHoldingHeart,
                    color: activeStep == 7
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.productHunt,
                    color: activeStep == 8
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
                Icon(FontAwesomeIcons.phoneVolume,
                    color: activeStep == 9
                        ? AppColors.purpleClr
                        : AppColors.violetClr),
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
              color: AppColors.greyColor,
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
        ),
      ),
    );
  }

  String headerText() {
    switch (activeStep) {
      case 1:
        return 'Address';

      case 2:
        return 'Educational Qualifications';

      case 3:
        return 'Family Information';

      case 4:
        return 'Personal Information';

      case 5:
        return 'Occupational Information';

      case 6:
        return 'Marriage Related Information';

      case 7:
        return 'Expected Life Partner';

      case 8:
        return 'Pledge';

      case 9:
        return 'Contact';

      default:
        return 'General Information';
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
                    if (Get.find<MyBioDataController>()
                            .myBioData!
                            .personalInformation !=
                        null) {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.updateGeneralInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    } else {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createGeneralInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    }
                  },
                  buttonName: 'Save & Next',
                  buttonWidth: 140.w,
                ),
              ));
  }

  Widget _addressButton() {
    return GetBuilder<AddressController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createAddress();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.createEduQualification();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createFamilyInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
              children: [
                _previousButton(),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      final result = await controller.createPersonalInfo();
                      if (result) {
                        setState(() {
                          activeStep++;
                        });
                      }
                    }
                  },
                  buttonName: 'Save & Next',
                  buttonWidth: 140.w,
                ),
              ],
            ),
    );
  }

  Widget _occupationalInfoButton() {
    return GetBuilder<OccupationalInfoController>(
      builder: (controller) => controller.isLoading
          ? customCircularProgressIndicator
          : Row(
              children: [
                _previousButton(),
                const Spacer(),
                CustomElevatedButton(
                  onPressed: () async {
                    if (controller.formKey.currentState!.validate()) {
                      final result = await controller.createOccupationalInfo();
                      if (result) {
                        setState(() {
                          activeStep++;
                        });
                      }
                    }
                  },
                  buttonName: 'Save & Next',
                  buttonWidth: 140.w,
                ),
              ],
            ),
    );
  }

  Widget _marriageInfoButton() {
    return GetBuilder<MarriageRelatedInfoController>(
        builder: (controller) => controller.isLoading
            ? customCircularProgressIndicator
            : Row(
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createMarriageInfo();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result =
                            await controller.createExpectedLifePartner();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createPledge();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Next',
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
                children: [
                  _previousButton(),
                  const Spacer(),
                  CustomElevatedButton(
                    onPressed: () async {
                      if (controller.formKey.currentState!.validate()) {
                        final result = await controller.createContact();
                        if (result) {
                          setState(() {
                            activeStep++;
                          });
                        }
                      }
                    },
                    buttonName: 'Save & Finish',
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
      buttonName: 'Previous',
      buttonWidth: 140.w,
    );
  }
}
