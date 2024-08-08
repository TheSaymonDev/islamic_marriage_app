import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/wishlist_screen/models/wishlist.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';

class FavouriteBioDataDetailsScreen extends StatefulWidget {
  const FavouriteBioDataDetailsScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteBioDataDetailsScreen> createState() =>
      _FavouriteBioDataDetailsScreenState();
}

class _FavouriteBioDataDetailsScreenState
    extends State<FavouriteBioDataDetailsScreen> {
  late Biodata user;

  @override
  void initState() {
    user = Get.arguments['user'] as Biodata;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
            onPressedBack: () {
              Get.back();
            },
            title: 'bioDataDetailsAppbarTitle'.tr),
        body: Container(
          height: double.infinity.h,
          width: double.infinity.w,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
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
                      CustomBioDataTable(data: generateGeneralInfo(user)),
                    ],
                  ),
                ),
                CustomExpansionTile(title: 'addressTitle'.tr, children: [
                  CustomBioDataTable(data: generateAddress(user))
                ]),
                CustomExpansionTile(
                    title: 'eduQualificationTitle'.tr,
                    children: [
                      CustomBioDataTable(
                          data: generateEduQualificationInfo(user))
                    ]),
                CustomExpansionTile(title: 'familyInfoTitle'.tr, children: [
                  CustomBioDataTable(data: generateFamilyInfo(user))
                ]),
                CustomExpansionTile(title: 'personalInfoTitle'.tr, children: [
                  CustomBioDataTable(data: generatePersonalInfo(user))
                ]),
                CustomExpansionTile(
                    title: 'occupationalInfoTitle'.tr,
                    children: [
                      CustomBioDataTable(data: generateOccupationalInfo(user))
                    ]),
                CustomExpansionTile(title: 'marriageInfoTitle'.tr, children: [
                  CustomBioDataTable(data: generateMarriageRelatedInfo(user))
                ]),
                CustomExpansionTile(
                    title: 'expectedLifePartnerTitle'.tr,
                    children: [
                      CustomBioDataTable(
                          data: generateExpectedLifePartner(user))
                    ]),
                CustomExpansionTile(
                    title: 'authorizedQueTitle'.tr,
                    children: [CustomBioDataTable(data: generatePledge(user))]),
                // CustomExpansionTile(title: 'Contact Information', children: [
                //   CustomBioDataTable(data: generateContact(user))
                // ]),
              ],
            ),
          ),
        ));
  }

  Map<String, String?> generateGeneralInfo(Biodata user) {
    final data = user.generalInfo;
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

  Map<String, String?> generateAddress(Biodata user) {
    final permanentAdd = user.permanentAddress;
    final currentAdd = user.currentAddress;
    final grewUp = user.grewUp;

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

  Map<String, String?> generateEduQualificationInfo(Biodata user) {
    final data = user.educationInfo;
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

  Map<String, String?> generateFamilyInfo(Biodata user) {
    final data = user.familyInfo;
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

  Map<String, String?> generatePersonalInfo(Biodata user) {
    final data = user.personalInfo;
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

  Map<String, String?> generateOccupationalInfo(Biodata user) {
    final data = user.occupationInfo;
    return {
      'occupationTitle'.tr: data?.occupation ?? 'N/A',
      'descriptionOfProfessionTitle'.tr: data?.descriptionOfProfession ?? 'N/A',
      'monthlyIncomeTitle'.tr: data?.monthlyIncome ?? 'N/A',
    };
  }

  Map<String, String?> generateMarriageRelatedInfo(Biodata user) {
    final data = user.marriageInfo;
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

  Map<String, String?> generateExpectedLifePartner(Biodata user) {
    final data = user.expectedLifePartnerInfo;
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

  Map<String, String?> generatePledge(Biodata user) {
    final data = user.pledgeInfo;
    return {
      'parentalAwarenessTitle'.tr: data?.parentalAwareness ?? 'N/A',
      'informationTruthTitle'.tr: data?.informationTruth ?? 'N/A',
      'agreementTitle'.tr: data?.agreement ?? 'N/A',
    };
  }
}
