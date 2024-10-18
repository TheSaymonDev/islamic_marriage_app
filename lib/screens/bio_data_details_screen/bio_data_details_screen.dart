import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/explore_screens/models/all_user.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';

class BioDataDetailsScreen extends StatefulWidget {
  const BioDataDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BioDataDetailsScreen> createState() => _BioDataDetailsScreenState();
}

class _BioDataDetailsScreenState extends State<BioDataDetailsScreen> {
  late Data user;

  @override
  void initState() {
    user = Get.arguments['user'] as Data;
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
                      Text(
                        'bioDataNo'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: darkFontClr),
                      ),
                      Gap(8.h),
                      CustomBioDataTable(
                        data: removeEmptyFields(generateGeneralInfo(user)),
                      ),
                    ],
                  ),
                ),
                CustomExpansionTile(title: 'addressTitle'.tr, children: [
                  CustomBioDataTable(
                    data: removeEmptyFields(generateAddress(user)),
                  )
                ]),
                CustomExpansionTile(
                    title: 'eduQualificationTitle'.tr,
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generateEduQualificationInfo(user)),
                      )
                    ]),
                CustomExpansionTile(title: 'familyInfoTitle'.tr, children: [
                  CustomBioDataTable(
                    data: removeEmptyFields(generateFamilyInfo(user)),
                  )
                ]),
                CustomExpansionTile(title: 'personalInfoTitle'.tr, children: [
                  CustomBioDataTable(
                    data: removeEmptyFields(generatePersonalInfo(user)),
                  )
                ]),
                CustomExpansionTile(
                    title: 'occupationalInfoTitle'.tr,
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generateOccupationalInfo(user)),
                      )
                    ]),
                CustomExpansionTile(title: 'marriageInfoTitle'.tr, children: [
                  CustomBioDataTable(
                    data: removeEmptyFields(generateMarriageRelatedInfo(user)),
                  )
                ]),
                CustomExpansionTile(
                    title: 'expectedLifePartnerTitle'.tr,
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generateExpectedLifePartner(user)),
                      )
                    ]),
                CustomExpansionTile(
                    title: 'authorizedQueTitle'.tr,
                    children: [
                      CustomBioDataTable(
                        data: removeEmptyFields(generatePledge(user)),
                      )
                    ]),
              ],
            ),
          ),
        ));
  }

  // Filter out empty fields
  Map<String, String?> removeEmptyFields(Map<String, String?> data) {
    return data..removeWhere((key, value) => value == null || value.isEmpty);
  }

  Map<String, String?> generateGeneralInfo(Data user) {
    final data = user.generalInfo;
    if (data != null) {
      return {
        'bioDataTypeTitle'.tr: data.bioDataType ?? '',
        'maritalStatusTitle'.tr: data.maritialStatus ?? '',
        'dateOfBirthTitle'.tr:
            data.dateOfBirth != null ? formatDate(data.dateOfBirth!) : '',
        'heightTitle'.tr: data.height ?? '',
        'complexionTitle'.tr: data.complexion ?? '',
        'weightTitle'.tr: data.weight ?? '',
        'bloodGroupTitle'.tr: data.bloodGroup ?? '',
        'nationalityTitle'.tr: data.nationality ?? '',
      };
    } else {
      return {
        'bioDataTypeTitle'.tr: '',
        'maritalStatusTitle'.tr: '',
        'dateOfBirthTitle'.tr: '',
        'heightTitle'.tr: '',
        'complexionTitle'.tr: '',
        'weightTitle'.tr: '',
        'bloodGroupTitle'.tr: '',
        'nationalityTitle'.tr: '',
      };
    }
  }

  Map<String, String?> generateAddress(Data user) {
    final permanentAdd = user.permanentAddress;
    final currentAdd = user.currentAddress;
    final grewUp = user.grewUp;

    return {
      'permanentAddressTitle'.tr: permanentAdd != null
          ? '${permanentAdd.division ?? ''}, ${permanentAdd.district ?? ''}, ${permanentAdd.subDistrict ?? ''}'
          : '',
      'presentAddressTitle'.tr: currentAdd != null
          ? '${currentAdd.currentDivision ?? ''}, ${currentAdd.currentDistrict ?? ''}, ${currentAdd.currentSubDistrict ?? ''}'
          : '',
      'growUpTitle'.tr: grewUp ?? '',
    };
  }

  Map<String, String?> generateEduQualificationInfo(Data user) {
    final data = user.educationInfo;
    return {
      'educationalMethodTitle'.tr: data?.educationMethod ?? '',
      'highestEducationalTitle'.tr: data?.highestEducation ?? '',
      'passingYearTitle'.tr: data?.passingYear ?? '',
      'resultTitle'.tr: data?.result ?? '',
      'institutionNameTitle'.tr: data?.institutionName ?? '',
      'othersEducationTitle'.tr: data?.otherEducation ?? '',
      'religiousEducationTitle'.tr: data?.religiousEducation ?? '',
    };
  }

  Map<String, String?> generateFamilyInfo(Data user) {
    final data = user.familyInfo;
    return {
      "fathersNameTitle".tr: data?.fatherName ?? '',
      'fatherAliveTitle'.tr: data?.fatherAlive ?? '',
      "fathersProfessionTitle".tr: data?.fatherOccupation ?? '',
      "mothersNameTitle".tr: data?.motherName ?? '',
      'mothersAliveTitle'.tr: data?.motherAlive ?? '',
      "mothersProfessionTitle".tr: data?.motherOccupation ?? '',
      "brothersCountTitle".tr: data?.brotherCount?.toString() ?? '',
      "brothersInfoTitle".tr: data?.brothersInfo?.toString() ?? '',
      "sistersCountTitle".tr: data?.sisterCount?.toString() ?? '',
      "sistersInfoTitle".tr: data?.sistersInfo?.toString() ?? '',
      'professionOfUnclesTitle'.tr: data?.uncleAuntOccuption ?? '',
      'familyIncomeStatusTitle'.tr: data?.familyStatus ?? '',
      "familyReligiousConditionTitle".tr:
          data?.familyRelagiousEnvironment ?? '',
    };
  }

  Map<String, String?> generatePersonalInfo(Data user) {
    final data = user.personalInfo;
    return {
      'clothingOutSideTitle'.tr: data?.clothingOutside ?? '',
      'sunnahBeardSinceTitle'.tr: data?.sunnahBeardSince ?? '',
      'clothesAboveAnklesTitle'.tr:
          data?.clothesAboveAnkles?.toString() ?? '',
      'fiveTimesPrayerSinceTitle'.tr: data?.fiveTimesPrayerSince ?? '',
      'prayerMissWeeklyTitle'.tr: data?.prayerMissDaily ?? '',
      'complyMahramNonMahramTitle'.tr: data?.complyNonMahram ?? '',
      'reciteQuranTitle'.tr: data?.reciteQuranCorrectly ?? '',
      'followedFiqh'.tr: data?.followedFiqah ?? '',
      'watchOrListenTitle'.tr: data?.watchIslamicDramaSong ?? '',
      'diseaseTitle'.tr: data?.mentalPhysicalDiseases ?? '',
      'involvedInSpecialWorkTitle'.tr: data?.involvedSpecialDeenWork ?? '',
      'aboutShrineTitle'.tr: data?.believeAboutMazar ?? '',
      'islamicBooksTitle'.tr: data?.islamicReadedBookName ?? '',
      'islamicScholarsTitle'.tr: data?.islamicFollowedScholarName ?? '',
      'hobbiesTitle'.tr: data?.hobbiesLikeDislike ?? '',
      "groomsPhoneTitle".tr: data?.groomPhone ?? '',
    };
  }

  Map<String, String?> generateOccupationalInfo(Data user) {
    final data = user.occupationInfo;
    return {
      'occupationTitle'.tr: data?.occupation ?? '',
      'descriptionOfProfessionTitle'.tr: data?.descriptionOfProfession ?? '',
      'monthlyIncomeTitle'.tr: data?.monthlyIncome ?? '',
    };
  }

  Map<String, String?> generateMarriageRelatedInfo(Data user) {
    final data = user.marriageInfo;
    return {
      'guardianAgreeTitle'.tr: data?.guardianAgree ?? '',
      'wifeInVeilTitle'.tr: data?.wifeInVeil ?? '',
      'afterStudyTitle'.tr: data?.studyAfterMarriage ?? '',
      'afterJobTitle'.tr: data?.jobAfterMarriage ?? '',
      'livingPlaceTitle'.tr: data?.livingPlaceAfterMarriage ?? '',
      "expectedGiftTitle".tr: data?.expectGiftFromBrideFamily ?? '',
      "thoughAboutTitle".tr: data?.thoughtAboutMarriage ?? '',
    };
  }

  Map<String, String?> generateExpectedLifePartner(Data user) {
    final data = user.expectedLifePartnerInfo;
    return {
      //'expectedAgeTitle'.tr: data != null ? '${data.expectedMinAge ?? 'N/A'}-${data.expectedMaxAge ?? 'N/A'}' : 'N/A',
      'expectedComplexionTitle'.tr: data?.expectedComplexion ?? '',
      'expectedHeightTitle'.tr: data?.expectedHeight ?? '',
      'expectedEducationTitle'.tr: data?.exptectedEducation ?? '',
      'expectedDistrictTitle'.tr: data?.exptectedDistrict ?? '',
      'expectedMaritalStatusTitle'.tr: data?.expectedMaritialStatus ?? '',
      'expectedProfessionTitle'.tr: data?.expectedProfession ?? '',
      'expectedFinancialConditionTitle'.tr:
          data?.expectedFinancialCondition ?? '',
      'expectedAttributesTitle'.tr: data?.expectedAttributes ?? '',
    };
  }

  Map<String, String?> generatePledge(Data user) {
    final data = user.pledgeInfo;
    return {
      'parentalAwarenessTitle'.tr: data?.parentalAwareness ?? '',
      'informationTruthTitle'.tr: data?.informationTruth ?? '',
      'agreementTitle'.tr: data?.agreement ?? '',
    };
  }
}
