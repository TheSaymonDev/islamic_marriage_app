import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class MyBioDataScreen extends StatelessWidget {
  const MyBioDataScreen({
    super.key,
  });

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
                : _buildMyBioData(context, controller),
          ),
        ));
  }

  Widget _buildMyBioData(BuildContext context, MyBioDataController controller) {
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
                CustomBioDataTable(
                    data: removeEmptyFields(generateGeneralInfo(controller))),
              ],
            ),
          ),
          CustomExpansionTile(title: 'addressTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generateAddress(controller)))
          ]),
          CustomExpansionTile(title: 'eduQualificationTitle'.tr, children: [
            CustomBioDataTable(
                data:
                    removeEmptyFields(generateEduQualificationInfo(controller)))
          ]),
          CustomExpansionTile(title: 'familyInfoTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generateFamilyInfo(controller)))
          ]),
          CustomExpansionTile(title: 'personalInfoTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generatePersonalInfo(controller)))
          ]),
          CustomExpansionTile(title: 'occupationalInfoTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generateOccupationalInfo(controller)))
          ]),
          CustomExpansionTile(title: 'marriageInfoTitle'.tr, children: [
            CustomBioDataTable(
                data:
                    removeEmptyFields(generateMarriageRelatedInfo(controller)))
          ]),
          CustomExpansionTile(title: 'expectedLifePartnerTitle'.tr, children: [
            CustomBioDataTable(
                data:
                    removeEmptyFields(generateExpectedLifePartner(controller)))
          ]),
          CustomExpansionTile(title: 'authorizedQueTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generatePledge(controller)))
          ]),
          CustomExpansionTile(title: 'contactTitle'.tr, children: [
            CustomBioDataTable(
                data: removeEmptyFields(generateContact(controller)))
          ]),
        ],
      ),
    );
  }

  // Filter out empty fields
  Map<String, String?> removeEmptyFields(Map<String, String?> data) {
    return data..removeWhere((key, value) => value == null || value.isEmpty);
  }

  Map<String, String?> generateGeneralInfo(MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.generalInfo;
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

  Map<String, String?> generateAddress(MyBioDataController controller) {
    final permanentAdd = controller.myBioData?.data?.biodata?.permanentAddress;
    final currentAdd = controller.myBioData?.data?.biodata?.currentAddress;
    final grewUp = controller.myBioData?.data?.biodata?.grewUp;

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

  Map<String, String?> generateEduQualificationInfo(
      MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.educationInfo;
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

  Map<String, String?> generateFamilyInfo(MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.familyInfo;
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
          data?.familyReligiousEnvironment ?? '',
    };
  }

  Map<String, String?> generatePersonalInfo(MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.personalInfo;
    return {
      'clothingOutSideTitle'.tr: data?.clothingOutside ?? '',
      'sunnahBeardSinceTitle'.tr: data?.sunnahBeardSince ?? '',
      'clothesAboveAnklesTitle'.tr: data?.clothesAboveAnkles?.toString() ?? '',
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

  Map<String, String?> generateOccupationalInfo(
      MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.occupationInfo;
    return {
      'occupationTitle'.tr: data?.occupation ?? '',
      'descriptionOfProfessionTitle'.tr: data?.descriptionOfProfession ?? '',
      'monthlyIncomeTitle'.tr: data?.monthlyIncome ?? '',
    };
  }

  Map<String, String?> generateMarriageRelatedInfo(
      MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.marriageInfo;
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

  Map<String, String?> generateExpectedLifePartner(
      MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.expectedLifePartnerInfo;
    return {
      'expectedAgeTitle'.tr: data != null
          ? '${data.expectedMinAge ?? ''}-${data.expectedMaxAge ?? ''}'
          : '',
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

  Map<String, String?> generatePledge(MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.pledgeInfo;
    return {
      'parentalAwarenessTitle'.tr: data?.parentalAwareness ?? '',
      'informationTruthTitle'.tr: data?.informationTruth ?? '',
      'agreementTitle'.tr: data?.agreement ?? '',
    };
  }

  Map<String, String?> generateContact(MyBioDataController controller) {
    final data = controller.myBioData?.data?.biodata?.contactInfo;
    return {
      "brideOrGroomNameTitle".tr: data?.groomName ?? '',
      "guardiansPhoneTitle".tr: data?.guardianMobile ?? '',
      'relationshipWithGuardianTitle'.tr: data?.relationShipWithGuardian ?? '',
      'emailToReceivedBioDataTitle'.tr: data?.email ?? '',
    };
  }
}
