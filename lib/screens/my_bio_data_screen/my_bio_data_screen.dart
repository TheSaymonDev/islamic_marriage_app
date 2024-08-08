import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MyBioDataScreen extends StatefulWidget {
  const MyBioDataScreen({
    super.key,
  });

  @override
  State<MyBioDataScreen> createState() => _MyBioDataScreenState();
}

class _MyBioDataScreenState extends State<MyBioDataScreen> {
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
          title: 'myBioData'.tr,
        ),
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: GetBuilder<MyBioDataController>(
            builder: (controller) => controller.isLoading
                ? customCircularProgressIndicator
                : _buildMyBioData(controller),
          ),
        ));
  }

  Widget _buildMyBioData(MyBioDataController controller) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: double.infinity.w,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: AppColors.violetClr,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 85.h,
                  width: 85.w,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(AppUrls.placeHolderPng),
                  ),
                ),
                Gap(8.h),
                Text('bioDataNo'.tr,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: darkFontClr)),
                Gap(8.h),
                CustomBioDataTable(data: generateGeneralInfo(controller)),
              ],
            ),
          ),
          CustomExpansionTile(title: 'addressTitle'.tr, children: [
            CustomBioDataTable(data: generateAddress(controller))
          ]),
          CustomExpansionTile(title: 'eduQualificationTitle'.tr, children: [
            CustomBioDataTable(data: generateEduQualificationInfo(controller))
          ]),
          CustomExpansionTile(title: 'familyInfoTitle'.tr, children: [
            CustomBioDataTable(data: generateFamilyInfo(controller))
          ]),
          CustomExpansionTile(title: 'personalInfoTitle'.tr, children: [
            CustomBioDataTable(data: generatePersonalInfo(controller))
          ]),
          CustomExpansionTile(title: 'occupationalInfoTitle'.tr, children: [
            CustomBioDataTable(data: generateOccupationalInfo(controller))
          ]),
          CustomExpansionTile(title: 'marriageInfoTitle'.tr, children: [
            CustomBioDataTable(data: generateMarriageRelatedInfo(controller))
          ]),
          CustomExpansionTile(title: 'expectedLifePartnerTitle'.tr, children: [
            CustomBioDataTable(data: generateExpectedLifePartner(controller))
          ]),
          CustomExpansionTile(
              title: 'authorizedQueTitle'.tr,
              children: [CustomBioDataTable(data: generatePledge(controller))]),
          CustomExpansionTile(title: 'contactTitle'.tr, children: [
            CustomBioDataTable(data: generateContact(controller))
          ]),
        ],
      ),
    );
  }

  Map<String, String?> generateGeneralInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.generalInfo;
    if (data != null) {
      return {
        'bioDataTypeTitle'.tr: data.bioDataType ?? 'N/A',
        'maritalStatusTitle'.tr: data.maritialStatus ?? 'N/A',
        'dateOfBirthTitle'.tr:
            data.dateOfBirth != null ? formatDate(data.dateOfBirth!) : 'N/A',
        'heightTitle'.tr: data.height ?? 'N/A',
        'complexionTitle'.tr: data.complexion ?? 'N/A',
        'weightTitle'.tr: data.weight ?? 'N/A',
        'bloodGroupTitle'.tr: data.bloodGroup ?? 'N/A',
        'nationalityTitle'.tr: data.nationality ?? 'N/A',
      };
    } else {
      return {
        'bioDataTypeTitle'.tr: 'N/A',
        'maritalStatusTitle'.tr: 'N/A',
        'dateOfBirthTitle'.tr: 'N/A',
        'heightTitle'.tr: 'N/A',
        'complexionTitle'.tr: 'N/A',
        'weightTitle'.tr: 'N/A',
        'bloodGroupTitle'.tr: 'N/A',
        'nationalityTitle'.tr: 'N/A',
      };
    }
  }

  Map<String, String?> generateAddress(MyBioDataController controller) {
    final permanentAdd =
        controller.currentUser?.data?.biodata?.permanentAddress;
    final currentAdd = controller.currentUser?.data?.biodata?.currentAddress;
    final grewUp = controller.currentUser?.data?.biodata?.grewUp;

    return {
      'permanentAddressTitle'.tr: permanentAdd != null
          ? '${permanentAdd.division ?? 'N/A'}, ${permanentAdd.district ?? 'N/A'}, ${permanentAdd.subDistrict ?? 'N/A'}'
          : 'N/A',
      'presentAddressTitle'.tr: currentAdd != null
          ? '${currentAdd.division ?? 'N/A'}, ${currentAdd.district ?? 'N/A'}, ${currentAdd.subDistrict ?? 'N/A'}'
          : 'N/A',
      'growUpTitle'.tr: grewUp ?? 'N/A',
    };
  }

  Map<String, String?> generateEduQualificationInfo(
      MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.educationInfo;
    return {
      'educationalMethodTitle'.tr: data?.educationMethod ?? 'N/A',
      'highestEducationalTitle'.tr: data?.highestEducation ?? 'N/A',
      'passingYearTitle'.tr: data?.passingYear ?? 'N/A',
      'resultTitle'.tr: data?.result ?? 'N/A',
      'institutionNameTitle'.tr: data?.institutionName ?? 'N/A',
      'othersEducationTitle'.tr: data?.otherEducation ?? 'N/A',
      'religiousEducationTitle'.tr: data?.religiousEducation ?? 'N/A',
    };
  }

  Map<String, String?> generateFamilyInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.familyInfo;
    return {
      "fathersNameTitle".tr: data?.fatherName ?? 'N/A',
      'fatherAliveTitle'.tr: data?.fatherAlive ?? 'N/A',
      "fathersProfessionTitle".tr: data?.fatherOccupation ?? 'N/A',
      "mothersNameTitle".tr: data?.motherName ?? 'N/A',
      'mothersAliveTitle'.tr: data?.motherAlive ?? 'N/A',
      "mothersProfessionTitle".tr: data?.motherOccupation ?? 'N/A',
      "brothersCountTitle".tr: data?.brotherCount?.toString() ?? 'N/A',
      "brothersInfoTitle".tr: data?.brothersInfo?.toString() ?? 'N/A',
      "sistersCountTitle".tr: data?.sisterCount?.toString() ?? 'N/A',
      "sistersInfoTitle".tr: data?.sistersInfo?.toString() ?? 'N/A',
      'professionOfUnclesTitle'.tr: data?.uncleAuntOccuption ?? 'N/A',
      'familyIncomeStatusTitle'.tr: data?.familyStatus ?? 'N/A',
      "familyReligiousConditionTitle".tr:
          data?.familyRelagiousEnvironment ?? 'N/A',
    };
  }

  Map<String, String?> generatePersonalInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.personalInfo;
    return {
      'clothingOutSideTitle'.tr: data?.clothingOutside ?? 'N/A',
      'sunnahBeardSinceTitle'.tr: data?.sunnahBeardSince ?? 'N/A',
      'clothesAboveAnklesTitle'.tr:
          data?.clothesAboveAnkles?.toString() ?? 'N/A',
      'fiveTimesPrayerSinceTitle'.tr: data?.fiveTimesPrayerSince ?? 'N/A',
      'prayerMissWeeklyTitle'.tr: data?.prayerMissDaily ?? 'N/A',
      'complyMahramNonMahramTitle'.tr: data?.complyNonMahram ?? 'N/A',
      'reciteQuranTitle'.tr: data?.reciteQuranCorrectly ?? 'N/A',
      'followedFiqh'.tr: data?.followedFiqah ?? 'N/A',
      'watchOrListenTitle'.tr: data?.watchIslamicDramaSong ?? 'N/A',
      'diseaseTitle'.tr: data?.mentalPhysicalDiseases ?? 'N/A',
      'involvedInSpecialWorkTitle'.tr: data?.involvedSpecialDeenWork ?? 'N/A',
      'aboutShrineTitle'.tr: data?.believeAboutMazar ?? 'N/A',
      'islamicBooksTitle'.tr: data?.islamicReadedBookName ?? 'N/A',
      'islamicScholarsTitle'.tr: data?.islamicFollowedScholarName ?? 'N/A',
      'hobbiesTitle'.tr: data?.hobbiesLikeDislike ?? 'N/A',
      "groomsPhoneTitle".tr: data?.groomPhone ?? 'N/A',
    };
  }

  Map<String, String?> generateOccupationalInfo(
      MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.occupationInfo;
    return {
      'occupationTitle'.tr: data?.occupation ?? 'N/A',
      'descriptionOfProfessionTitle'.tr: data?.descriptionOfProfession ?? 'N/A',
      'monthlyIncomeTitle'.tr: data?.monthlyIncome ?? 'N/A',
    };
  }

  Map<String, String?> generateMarriageRelatedInfo(
      MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.marriageInfo;
    return {
      'guardianAgreeTitle'.tr: data?.guardianAgree ?? 'N/A',
      'wifeInVeilTitle'.tr: data?.wifeInVeil ?? 'N/A',
      'afterStudyTitle'.tr: data?.studyAfterMarriage ?? 'N/A',
      'afterJobTitle'.tr: data?.jobAfterMarriage ?? 'N/A',
      'livingPlaceTitle'.tr: data?.livingPlaceAfterMarriage ?? 'N/A',
      "expectedGiftTitle".tr: data?.expectGiftFromBrideFamily ?? 'N/A',
      "thoughAboutTitle".tr: data?.thoughtAboutMarriage ?? 'N/A',
    };
  }

  Map<String, String?> generateExpectedLifePartner(
      MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.expectedLifePartnerInfo;
    return {
      //'expectedAgeTitle'.tr: data != null ? '${data.expectedMinAge ?? 'N/A'}-${data.expectedMaxAge ?? 'N/A'}' : 'N/A',
      'expectedComplexionTitle'.tr: data?.expectedComplexion ?? 'N/A',
      'expectedHeightTitle'.tr: data?.expectedHeight ?? 'N/A',
      'expectedEducationTitle'.tr: data?.exptectedEducation ?? 'N/A',
      'expectedDistrictTitle'.tr: data?.exptectedDistrict ?? 'N/A',
      'expectedMaritalStatusTitle'.tr: data?.expectedMaritialStatus ?? 'N/A',
      'expectedProfessionTitle'.tr: data?.expectedProfession ?? 'N/A',
      'expectedFinancialConditionTitle'.tr:
          data?.expectedFinancialCondition ?? 'N/A',
      'expectedAttributesTitle'.tr: data?.expectedAttributes ?? 'N/A',
    };
  }

  Map<String, String?> generatePledge(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.pledgeInfo;
    return {
      'parentalAwarenessTitle'.tr: data?.parentalAwareness ?? 'N/A',
      'informationTruthTitle'.tr: data?.informationTruth ?? 'N/A',
      'agreementTitle'.tr: data?.agreement ?? 'N/A',
    };
  }

  Map<String, String?> generateContact(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.contactInfo;
    return {
      "brideOrGroomNameTitle".tr: data?.groomName ?? 'N/A',
      "guardiansPhoneTitle".tr: data?.guardianMobile ?? 'N/A',
      'relationshipWithGuardianTitle'.tr:
          data?.relationShipWithGuardian ?? 'N/A',
      'emailToReceivedBioDataTitle'.tr: data?.email ?? 'N/A',
    };
  }
}
