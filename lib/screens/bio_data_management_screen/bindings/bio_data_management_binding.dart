import 'package:get/get.dart';
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

class BioDataManagementBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => CurrentUserBioDataController());
   Get.lazyPut(() => GeneralInfoController());
   Get.lazyPut(() => AddressInfoController());
   Get.lazyPut(() => EduQualificationsController());
   Get.lazyPut(() => FamilyInfoController());
   Get.lazyPut(() => PersonalInfoController());
   Get.lazyPut(() => OccupationalInfoController());
   Get.lazyPut(() => MarriageRelatedInfoController());
   Get.lazyPut(() => ExpectedLifePartnerController());
   Get.lazyPut(() => PledgeController());
   Get.lazyPut(() => ContactController());
  // Get.lazyPut(() => SubmitBioDataController());
  }
}