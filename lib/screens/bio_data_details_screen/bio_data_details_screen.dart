import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';

class BioDataDetailsScreen extends StatelessWidget {

  final BioData bioData;
  const BioDataDetailsScreen({Key? key, required this.bioData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar(
            onPressedBack: () {
              Get.back();
            },
            title: 'Bio Data Details'),
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
                          foregroundImage: bioData.lifeStyleInformation !=
                              null
                              ? NetworkImage(bioData.lifeStyleInformation!.photo!)
                              : AssetImage(AppUrls.photoPng) as ImageProvider,
                        ),
                      ),
                      Gap(8.h),
                      Text(
                        'Biodata No: 01',
                        style: AppTextStyles.titleLarge(color: AppColors.whiteClr),
                      ),
                      Gap(8.h),
                      CustomBioDataTable(data: generateGeneralInfo(bioData)),
                    ],
                  ),
                ),
                CustomExpansionTile(title: 'Address', children: [
                  CustomBioDataTable(data: generateAddress(bioData))
                ]),
                CustomExpansionTile(title: 'Educational Qualification', children: [
                  CustomBioDataTable(data: generateEduQualificationInfo(bioData))
                ]),
                CustomExpansionTile(title: 'Family Information', children: [
                  CustomBioDataTable(data: generateFamilyInfo(bioData))
                ]),
                CustomExpansionTile(title: 'Personal Information', children: [
                  CustomBioDataTable(data: generatePersonalInfo(bioData))
                ]),
                CustomExpansionTile(title: 'Occupational Information', children: [
                  CustomBioDataTable(data: generateOccupationalInfo(bioData))
                ]),
                CustomExpansionTile(title: 'Marriage Related Information', children: [
                  CustomBioDataTable(data: generateMarriageRelatedInfo(bioData))
                ]),
                CustomExpansionTile(title: 'Expected Life Partner', children: [
                  CustomBioDataTable(data: generateExpectedLifePartner(bioData))
                ]),
                CustomExpansionTile(
                    title: 'Authorized Question',
                    children: [CustomBioDataTable(data: generatePledge(bioData))]),
                CustomExpansionTile(title: 'Contact Information', children: [
                  CustomBioDataTable(data: generateContact(bioData))
                ]),
              ],
            ),
          ),
        ));
  }

  Map<String, String?> generateGeneralInfo(BioData bioData) {
    final data = bioData.personalInformation;
    if(data != null){
      return {
        'Type of Bio Data': data.typeOfBiodata,
        'Marital Status': data.maritalStatus,
        'Date of Birth': formatDate(data.dateOfBirth!),
        'Height': data.height,
        'Complexion': data.complexion,
        'Weight': data.weight,
        'Blood Group': data.bloodGroup,
        'Nationality': data.nationality,
      };
    }else{
      return {
        'Type of Bio Data': '',
        'Marital Status': '',
        'Date of Birth': '',
        'Height': '',
        'Complexion': '',
        'Weight': '',
        'Blood Group': '',
        'Nationality': '',
      };
    }
  }

  Map<String, String?> generateAddress(BioData bioData) {
    final data = bioData.address;
    if(data != null){
      return {
        'Permanent Address': data.permanentAddress,
        'Present Address': data.currentAddress,
        'Where did you grow up?': data.growUp,
      };
    }else{
      return {
        'Permanent Address': '',
        'Present Address': '',
        'Where did you grow up?': '',
      };
    }
  }

  Map<String, String?> generateEduQualificationInfo(
      BioData bioData) {
    final data = bioData.education;
    if(data != null){
      return {
        'Educational Method': data.medium,
        'Highest Educational Qualification': data.qualification,
        'Passing Year': data.passingYear,
        'Group': data.category,
        'Result': data.result,
        'Name of Educational Institution': data.institution,
        'Other Educational Qualification': data.otherQualifications,
        'Islamic Educational Title': data.religiousEducation,
      };
    }else{
      return {
        'Educational Method': '',
        'Highest Educational Qualification': '',
        'Passing Year': '',
        'Group': '',
        'Result': '',
        'Name of Educational Institution': '',
        'Other Educational Qualification': '',
        'Islamic Educational Title': '',
      };
    }
  }

  Map<String, String?> generateFamilyInfo(BioData bioData) {
    final data = bioData.familyInformation;
    if(data != null){
      return {
        "Father's Name": data.fatherName,
        'Is your father alive?': data.isFatherAlive,
        "Description of father's profession": data.fatherOccupation,
        "Mother's Name": data.motherName,
        'Is your mother alive?': data.isMotherAlive,
        "Description of mother's profession": data.motherOccupation,
        "How many brother's do you have?": data.brothersCount,
        "Brother's Information": data.brotherInformation,
        "How many sister's do you have?": data.sistersCount,
        "Sister's Information": data.sisterInformation,
        'Profession of uncles': data.occupationOfUnclesAndAunts,
        'Family financial status': data.familyIncome,
        "How is your family's religious condition?":
        data.familyReligionEnvironment,
      };
    }else{
      return {
        "Father's Name": '',
        'Is your father alive?': '',
        "Description of father's profession": '',
        "Mother's Name": '',
        'Is your mother alive?': '',
        "Description of mother's profession": '',
        "How many brother's do you have?": '',
        "Brother's Information": '',
        "How many sister's do you have?": '',
        "Sister's Information": '',
        'Profession of uncles': '',
        'Family financial status': '',
        "How is your family's religious condition?": '',
      };
    }
  }

  Map<String, String?> generatePersonalInfo(BioData bioData) {
    final data = bioData.lifeStyleInformation;
    if(data != null){
      return {
        'What kind of clothes do you usually wear outside the house?':
        data.clothesInfo,
        'Do you have beard according to sunnah? Since when?': data.breadInfo,
        'Do you wear clothes above the ankles?': data.clothesAnkles,
        'Do you pray 5 times a day? Since when?': data.prayInfo,
        'Usually how many times (waqt) a week are your prayers missed (Qaza)?':
        data.qazaInfo,
        'Do you comply with mahram/non-mahram?': data.marhamInfo,
        'Are you able to recite the quran correctly?': data.reciteTheQuran,
        'Which Fiqh do you follow?': data.fiqh,
        'Do you watch or listen to dramas/movies/serials/songs?':
        data.moviesOrSongs,
        'Do you have any mental or physical disease?': data.physicalDiseases,
        'Are you involved in any special work of deen?': data.workOfDeen,
        'What are your ideas or beliefs about the shrine (Mazar)?':
        data.mazarInfo,
        'Write the names of at least 3 islamic books you have read': data.books,
        'Write the names of at least 3 islamic scholars of your choice':
        data.islamicScholars,
        'Select the category is applicable to you': data.applicable,
        'Write about your hobbies, likes, and dislikes, tastes, dreams and so on':
        data.hobbies,
        "Groom's Mobile Number": data.groomMobileNumber,
      };
    }else{
      return {
        'What kind of clothes do you usually wear outside the house?': '',
        'Do you have beard according to sunnah? Since when?': '',
        'Do you wear clothes above the ankles?': '',
        'Do you pray 5 times a day? Since when?': '',
        'Usually how many times (waqt) a week are your prayers missed (Qaza)?': '',
        'Do you comply with mahram/non-mahram?': '',
        'Are you able to recite the quran correctly?': '',
        'Which Fiqh do you follow?': '',
        'Do you watch or listen to dramas/movies/serials/songs?': '',
        'Do you have any mental or physical disease?': '',
        'Are you involved in any special work of deen?': '',
        'What are your ideas or beliefs about the shrine (Mazar)?': '',
        'Write the names of at least 3 islamic books you have read': '',
        'Write the names of at least 3 islamic scholars of your choice': '',
        'Select the category is applicable to you': '',
        'Write about your hobbies, likes, and dislikes, tastes, dreams and so on': '',
        "Groom's Mobile Number": '',
      };
    }
  }

  Map<String, String?> generateOccupationalInfo(
      BioData bioData) {
    final data = bioData.occupation;
    if(data != null){
      return {
        'Occupation': data.occupation,
        'Description of Profession': data.description,
        'Monthly Income': data.monthlyIncome,
      };
    }else{
      return {
        'Occupation': '',
        'Description of Profession': '',
        'Monthly Income': '',
      };
    }
  }

  Map<String, String?> generateMarriageRelatedInfo(
      BioData bioData) {
    final data = bioData.marriageInfo;
    if(data != null){
      return {
        'Do your guardians agree to your marriage?': data.guardiansPermission,
        'Will you be able to keep your wife in the veil after marriage?':
        data.veilAfterMarriage,
        'Would you like to allow your wife to study after marriage?':
        data.partnerEducationPermission,
        'Would you like to allow your wife to do any job after marriage?':
        data.partnerJobPermission,
        'Where will you live with your wife after marriage?':
        data.liveInformationAfterMarriage,
        "Would you or your family expect any gift from the bride's family?":
        data.expectedGift,
        "Why are you getting married? What are your thoughts on marriage?":
        data.thoughtAboutMarriage,
      };
    }else{
      return {
        'Do your guardians agree to your marriage?': '',
        'Will you be able to keep your wife in the veil after marriage?': '',
        'Would you like to allow your wife to study after marriage?': '',
        'Would you like to allow your wife to do any job after marriage?': '',
        'Where will you live with your wife after marriage?': '',
        "Would you or your family expect any gift from the bride's family?": '',
        "Why are you getting married? What are your thoughts on marriage?": '',
      };
    }
  }

  Map<String, String?> generateExpectedLifePartner(
      BioData bioData) {
    final data = bioData.partner;
    if(data != null){
      return {
        'Age': data.ageRange.toString(),
        'Complexion': data.complexion.toString(),
        'Height': data.height,
        'Educational Qualification': data.educationalQualification,
        'District': data.district,
        'Marital Status': data.maritalStatus.toString(),
        'Profession': data.profession,
        'Financial Condition': data.financialCondition,
        'Expected qualities or attributes of life partner': data.expectedQuality,
      };
    }else{
      return {
        'Age': '',
        'Complexion': '',
        'Height': '',
        'Educational Qualification': '',
        'District': '',
        'Marital Status': '',
        'Profession': '',
        'Financial Condition': '',
        'Expected qualities or attributes of life partner': '',
      };
    }
  }

  Map<String, String?> generatePledge(BioData bioData) {
    final data = bioData.pledge;
    if(data != null){
      return {
        'Do your parents know that you are submitting Bio Data to the islamicmarriage.net website?':
        data.parentKnowSubmission,
        'By Allah, testify that all the information given is true':
        data.isAllInfoTrue,
        'If you provide any false information, islamicmarriage.net will not take any responsibility for the conventional law and the hereafter. Do you agree?':
        data.falseInfoProven,
      };
    }else{
      return {
        'Do your parents know that you are submitting Bio Data to the islamicmarriage.net website?': '',
        'By Allah, testify that all the information given is true': '',
        'If you provide any false information, islamicmarriage.net will not take any responsibility for the conventional law and the hereafter. Do you agree?': '',
      };
    }
  }

  Map<String, String?> generateContact(BioData bioData) {
    final data = bioData.contact;
    if(data != null){
      return {
        "Groom's Name": data.groomName,
        "Guardian's mobile number": data.guardianMobile,
        'Relationship with guardian': data.guardianRelationship,
        'E-mail to received Bio Data': data.email,
      };
    }else{
      return {
        "Groom's Name": '',
        "Guardian's mobile number": '',
        'Relationship with guardian': '',
        'E-mail to received Bio Data': '',
      };
    }
  }

}
