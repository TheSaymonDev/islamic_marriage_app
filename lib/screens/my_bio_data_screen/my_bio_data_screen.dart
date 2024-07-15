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
          title: 'My Bio Data',
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
                Text(
                  'Bio Data No: 01',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(color: darkFontClr)
                ),
                Gap(8.h),
                CustomBioDataTable(data: generateGeneralInfo(controller)),
              ],
            ),
          ),
          CustomExpansionTile(title: 'Address', children: [
            CustomBioDataTable(data: generateAddress(controller))
          ]),
          CustomExpansionTile(title: 'Educational Qualification', children: [
            CustomBioDataTable(data: generateEduQualificationInfo(controller))
          ]),
          CustomExpansionTile(title: 'Family Information', children: [
            CustomBioDataTable(data: generateFamilyInfo(controller))
          ]),
          CustomExpansionTile(title: 'Personal Information', children: [
            CustomBioDataTable(data: generatePersonalInfo(controller))
          ]),
          CustomExpansionTile(title: 'Occupational Information', children: [
            CustomBioDataTable(data: generateOccupationalInfo(controller))
          ]),
          CustomExpansionTile(title: 'Marriage Related Information', children: [
            CustomBioDataTable(data: generateMarriageRelatedInfo(controller))
          ]),
          CustomExpansionTile(title: 'Expected Life Partner', children: [
            CustomBioDataTable(data: generateExpectedLifePartner(controller))
          ]),
          CustomExpansionTile(
              title: 'Authorized Question',
              children: [CustomBioDataTable(data: generatePledge(controller))]),
          CustomExpansionTile(title: 'Contact Information', children: [
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
        'Type of Bio Data': data.bioDataType ?? 'N/A',
        'Marital Status': data.maritialStatus ?? 'N/A',
        'Date of Birth': data.dateOfBirth != null ? formatDate(data.dateOfBirth!) : 'N/A',
        'Height': data.height ?? 'N/A',
        'Complexion': data.complexion ?? 'N/A',
        'Weight': data.weight ?? 'N/A',
        'Blood Group': data.bloodGroup ?? 'N/A',
        'Nationality': data.nationality ?? 'N/A',
      };
    } else {
      return {
        'Type of Bio Data': 'N/A',
        'Marital Status': 'N/A',
        'Date of Birth': 'N/A',
        'Height': 'N/A',
        'Complexion': 'N/A',
        'Weight': 'N/A',
        'Blood Group': 'N/A',
        'Nationality': 'N/A',
      };
    }
  }

  Map<String, String?> generateAddress(MyBioDataController controller) {
    final permanentAdd = controller.currentUser?.data?.biodata?.permanentAddress;
    final currentAdd = controller.currentUser?.data?.biodata?.currentAddress;
    final grewUp = controller.currentUser?.data?.biodata?.grewUp;

    return {
      'Permanent Address': permanentAdd != null
          ? '${permanentAdd.division ?? 'N/A'}, ${permanentAdd.district ?? 'N/A'}, ${permanentAdd.subDistrict ?? 'N/A'}'
          : 'N/A',
      'Present Address': currentAdd != null
          ? '${currentAdd.division ?? 'N/A'}, ${currentAdd.district ?? 'N/A'}, ${currentAdd.subDistrict ?? 'N/A'}'
          : 'N/A',
      'Where did you grow up?': grewUp ?? 'N/A',
    };
  }

  Map<String, String?> generateEduQualificationInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.educationInfo;
    return {
      'Educational Method': data?.educationMethod ?? 'N/A',
      'Highest Educational Qualification': data?.highestEducation ?? 'N/A',
      'Passing Year': data?.passingYear ?? 'N/A',
      'Result': data?.result ?? 'N/A',
      'Name of Educational Institution': data?.institutionName ?? 'N/A',
      'Other Educational Qualification': data?.otherEducation ?? 'N/A',
      'Islamic Educational Title': data?.religiousEducation ?? 'N/A',
    };
  }

  Map<String, String?> generateFamilyInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.familyInfo;
    return {
      "Father's Name": data?.fatherName ?? 'N/A',
      'Is your father alive?': data?.fatherAlive ?? 'N/A',
      "Description of father's profession": data?.fatherOccupation ?? 'N/A',
      "Mother's Name": data?.motherName ?? 'N/A',
      'Is your mother alive?': data?.motherAlive ?? 'N/A',
      "Description of mother's profession": data?.motherOccupation ?? 'N/A',
      "How many brother's do you have?": data?.brotherCount?.toString() ?? 'N/A',
      "Brother's Information": data?.brothersInfo?.toString() ?? 'N/A',
      "How many sister's do you have?": data?.sisterCount?.toString() ?? 'N/A',
      "Sister's Information": data?.sistersInfo?.toString() ?? 'N/A',
      'Profession of uncles': data?.uncleAuntOccuption ?? 'N/A',
      'Family financial status': data?.familyStatus ?? 'N/A',
      "How is your family's religious condition?": data?.familyRelagiousEnvironment ?? 'N/A',
    };
  }

  Map<String, String?> generatePersonalInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.personalInfo;
    return {
      'What kind of clothes do you usually wear outside the house?': data?.clothingOutside ?? 'N/A',
      'Do you have beard according to sunnah? Since when?': data?.sunnahBeardSince ?? 'N/A',
      'Do you wear clothes above the ankles?': data?.clothesAboveAnkles?.toString() ?? 'N/A',
      'Do you pray 5 times a day? Since when?': data?.fiveTimesPrayerSince ?? 'N/A',
      'Usually how many times (waqt) a week are your prayers missed (Qaza)?': data?.prayerMissDaily ?? 'N/A',
      'Do you comply with mahram/non-mahram?': data?.complyNonMahram ?? 'N/A',
      'Are you able to recite the quran correctly?': data?.reciteQuranCorrectly ?? 'N/A',
      'Which Fiqh do you follow?': data?.followedFiqah ?? 'N/A',
      'Do you watch or listen to dramas/movies/serials/songs?': data?.watchIslamicDramaSong ?? 'N/A',
      'Do you have any mental or physical disease?': data?.mentalPhysicalDiseases ?? 'N/A',
      'Are you involved in any special work of deen?': data?.involvedSpecialDeenWork ?? 'N/A',
      'What are your ideas or beliefs about the shrine (Mazar)?': data?.believeAboutMazar ?? 'N/A',
      'Write the names of at least 3 islamic books you have read': data?.islamicReadedBookName ?? 'N/A',
      'Write the names of at least 3 islamic scholars of your choice': data?.islamicFollowedScholarName ?? 'N/A',
      'Write about your hobbies, likes, and dislikes, tastes, dreams and so on': data?.hobbiesLikeDislike ?? 'N/A',
      "Groom's Mobile Number": data?.groomPhone ?? 'N/A',
    };
  }

  Map<String, String?> generateOccupationalInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.occupationInfo;
    return {
      'Occupation': data?.occupation ?? 'N/A',
      'Description of Profession': data?.descriptionOfProfession ?? 'N/A',
      'Monthly Income': data?.monthlyIncome ?? 'N/A',
    };
  }

  Map<String, String?> generateMarriageRelatedInfo(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.marriageInfo;
    return {
      'Do your guardians agree to your marriage?': data?.guardianAgree ?? 'N/A',
      'Will you be able to keep your wife in the veil after marriage?': data?.wifeInVeil ?? 'N/A',
      'Would you like to allow your wife to study after marriage?': data?.studyAfterMarriage ?? 'N/A',
      'Would you like to allow your wife to do any job after marriage?': data?.jobAfterMarriage ?? 'N/A',
      'Where will you live with your wife after marriage?': data?.livingPlaceAfterMarriage ?? 'N/A',
      "Would you or your family expect any gift from the bride's family?": data?.expectGiftFromBrideFamily ?? 'N/A',
      "Why are you getting married? What are your thoughts on marriage?": data?.thoughtAboutMarriage ?? 'N/A',
    };
  }

  Map<String, String?> generateExpectedLifePartner(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.expectedLifePartnerInfo;
    return {
      //'Age': data != null ? '${data.expectedMinAge ?? 'N/A'}-${data.expectedMaxAge ?? 'N/A'}' : 'N/A',
      'Complexion': data?.expectedComplexion ?? 'N/A',
      'Height': data?.expectedHeight ?? 'N/A',
      'Educational Qualification': data?.exptectedEducation ?? 'N/A',
      'District': data?.exptectedDistrict ?? 'N/A',
      'Marital Status': data?.expectedMaritialStatus ?? 'N/A',
      'Profession': data?.expectedProfession ?? 'N/A',
      'Financial Condition': data?.expectedFinancialCondition ?? 'N/A',
      'Expected qualities or attributes of life partner': data?.expectedAttributes ?? 'N/A',
    };
  }

  Map<String, String?> generatePledge(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.pledgeInfo;
    return {
      'Do your parents know that you are submitting Bio Data to the islamicmarriage.net website?': data?.parentalAwareness ?? 'N/A',
      'By Allah, testify that all the information given is true': data?.informationTruth ?? 'N/A',
      'If you provide any false information, islamicmarriage.net will not take any responsibility for the conventional law and the hereafter. Do you agree?': data?.agreement ?? 'N/A',
    };
  }

  Map<String, String?> generateContact(MyBioDataController controller) {
    final data = controller.currentUser?.data?.biodata?.contactInfo;
    return {
      "Groom's Name": data?.groomName ?? 'N/A',
      "Guardian's mobile number": data?.guardianMobile ?? 'N/A',
      'Relationship with guardian': data?.relationShipWithGuardian ?? 'N/A',
      'E-mail to received Bio Data': data?.email ?? 'N/A',
    };
  }


}
