import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/address_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/submit_bio_data_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/contact_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/family_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/general_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/personal_info_controller.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/screens/help_center_screens/controller/contact_us_controller.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';
import 'package:islamic_marriage/screens/identity_verification_screen/controller/identity_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/otp_verification_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/resend_otp_controller.dart';
import 'package:islamic_marriage/screens/otp_verification_screen/controller/timer_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/change_password_controller.dart';
import 'package:islamic_marriage/screens/profile_update_screen/controller/profile_update_controller.dart';
import 'package:islamic_marriage/screens/set_password_screen/controller/set_password_controller.dart';
import 'package:islamic_marriage/screens/sign_in_screen/controller/sign_in_controller.dart';
import 'package:islamic_marriage/screens/sign_up_screen/controller/sign_up_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';

class AppDependencyBinder extends Bindings{
  @override
  void dependencies() {
    // Get.put(SignUpController());
    // Get.put(SignInController());
    // Get.put(OtpVerificationController());
    // Get.put(IdentityVerificationController());
    //Get.put(SetPasswordController());
    //Get.put(TimerController());
    //Get.put(ResendOTPController());
    Get.put(GeneralInfoController());
    Get.put(AddressController());
    Get.put(EduQualificationsController());
    Get.put(FamilyInfoController());
    Get.put(OccupationalInfoController());
    Get.put(PersonalInfoController());
    Get.put(MarriageRelatedInfoController());
    Get.put(ExpectedLifePartnerController());
    Get.put(PledgeController());
    Get.put(ContactController());
    Get.put(AllBioDataController());
    Get.put(MyBioDataController());
    Get.put(ContactUsController());
    Get.put(SubmitBioDataController());
    Get.put(ProfileUpdateController());
    Get.put(ChangePasswordController());
  }
}