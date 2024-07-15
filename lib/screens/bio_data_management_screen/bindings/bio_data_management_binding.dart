import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/address_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/contact_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/edu_qualifications_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/expected_life_partner_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/family_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/general_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/marriage_related_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/occupational_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/personal_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/pledge_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controller/submit_bio_data_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';

class BioDataManagementBinding implements Bindings{
  @override
  void dependencies() {
   Get.lazyPut(() => MyBioDataController());
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