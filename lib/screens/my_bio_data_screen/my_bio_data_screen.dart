import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/show_bio_data_widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class MyBioDataScreen extends StatefulWidget {
  const MyBioDataScreen({
    super.key,
  });

  @override
  State<MyBioDataScreen> createState() => _MyBioDataScreenState();
}

class _MyBioDataScreenState extends State<MyBioDataScreen> {

  Map generateGeneralInfo(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
  }
  Map generateAddress(MyBioDataController controller){
    final data = controller.myBioData!.address;
    return {
      'Permanent Address': data!.permanentAddress,
      'Present Address': data.currentAddress,
      'Where did you grow up?': data.growUp,
    };
  }
  Map generateEduQualificationInfo(MyBioDataController controller){
    final data = controller.myBioData!.education;
    return {
      'Education Method': data!.medium,
      'Highest Edu Qualification': data.qualification,
      'Passing Year': data.passingYear,
      'Group': data.category,
      'Result': data.result,
      'Name of Educational Institution': data.institution,
      'Other Educational Qualification': data.otherQualifications,
      'Islamic Educational Title': data.religiousEducation,
    };
  }
  Map generateFamilyInfo(MyBioDataController controller){
    final data = controller.myBioData!.familyInformation;
    return {
      "Father's Name": data!.fatherName,
      'Is your father alive?': data.isFatherAlive,
      "Description of father's profession": data.fatherOccupation,
      "Mother's Name": data.motherName,
      'Is your mother alive?': data.isMotherAlive,
      "How many brother's do you have?": data.brothersCount,
      "Brother's Information" : data.brotherInformation,
      "How many sister's do you have?": data.sistersCount,
      "Sister's Information" :data.sisterInformation,
      'Profession of uncles': data.occupationOfUnclesAndAunts,
      'Family financial status': data.familyIncome,
      "How is your family's religious condition?": data.familyReligionEnvironment,
    };
  }
  Map generatePersonalInfo(MyBioDataController controller){
    final data = controller.myBioData!.lifeStyleInformation;
    return {
      'What kind of clothes do you usually wear outside the house?': data!.clothesInfo,
      'Do you have beard according to sunnah? Since when?': data.breadInfo,
      'Do you pray 5 times a day? Since when?': data.prayInfo,
      'Usually how many times (waqt) a week are your prayers missed (Qaza)?': data.qazaInfo,
      'Do you comply with mahram/non-mahram?': data.marhamInfo,
      'Are you able to recite the quran correctly?': data.reciteTheQuran,
      'Which Fiqh do you follow?': data.fiqh,
      'Do you watch or listen to dramas/movies/serials/songs?': data.moviesOrSongs,
      'Do you have any mental or physical disease?': data.physicalDiseases,
      'Are you involved in any special work of deen?': data.workOfDeen,
      'What are your ideas or beliefs about the shrine (Mazar)?': data.mazarInfo,
      'Write the names of at least 3 islamic books you have read': data.books,
      'Write the names of at least 3 islamic scholars of your choice': data.islamicScholars,
      'Select the category is applicable to you': data.applicable,
      'Write about your hobbies, likes, and dislikes, tastes, dreams and so on': data.hobbies,
      "Groom's Mobile Number": data.groomMobileNumber,
    };
  }
  Map generateOccupationalInfo(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
  }
  Map generateMarriageRelatedInfo(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
  }
  Map generateExpectedLifePartner(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
  }
  Map generatePledge(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
  }
  Map generateContact(MyBioDataController controller){
    final data = controller.myBioData!.personalInformation;
    return {
      'Type of Bio Data': data!.typeOfBiodata,
      'Marital Status': data.maritalStatus,
      'Date of Birth': data.dateOfBirth,
      'Height': data.height,
      'Complexion': data.complexion,
      'Weight': data.weight,
      'Blood Group': data.bloodGroup,
      'Nationality': data.nationality,
    };
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
        child: GetBuilder<MyBioDataController>(
            builder: (controller) => controller.isLoading
                ? customCircularProgressIndicator
                : controller.myBioData == null
                    ? _buildCreateBioDataButton()
                    : _buildMyBioData(controller)),
      ),
    );
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
                    foregroundImage: NetworkImage(controller.myBioData!.lifeStyleInformation!.photo!),
                  ),
                ),
                Gap(8.h),
                Text(
                  'Biodata No: 89',
                  style: AppTextStyles.titleLarge(color: AppColors.whiteClr),
                ),
                Gap(8.h),
                CustomBioDataTable(
                    data: generateGeneralInfo(controller)),
              ],
            ),
          ),
          CustomExpansionTile(
              title: 'Address', children: [CustomBioDataTable(data: generateAddress(controller))]),
          CustomExpansionTile(
              title: 'Educational Qualification',
              children: [CustomBioDataTable(data: generateEduQualificationInfo(controller))]),
          CustomExpansionTile(
              title: 'Family Information',
              children: [CustomBioDataTable(data: generateFamilyInfo(controller))]),
          CustomExpansionTile(
              title: 'Personal Information',
              children: [CustomBioDataTable(data: generatePersonalInfo(controller))]),
          CustomExpansionTile(
              title: 'Occupational Information',
              children: [CustomBioDataTable(data: generateOccupationalInfo(controller))]),
          CustomExpansionTile(
              title: 'Marriage Related Information',
              children: [CustomBioDataTable(data: generateMarriageRelatedInfo(controller))]),
          CustomExpansionTile(
              title: 'Expected Life Partner',
              children: [CustomBioDataTable(data: generateExpectedLifePartner(controller))]),
          CustomExpansionTile(
              title: 'Authorized Question',
              children: [CustomBioDataTable(data: generatePledge(controller))]),
          CustomExpansionTile(
              title: 'Contact Information',
              children: [CustomBioDataTable(data: generateContact(controller))]),
        ],
      ),
    );
  }

  Widget _buildCreateBioDataButton() {
    return Column(
      children: [
        Text(
          "You haven't created a Bio Data yet",
          style: AppTextStyles.titleLarge(),
        ),
        CustomElevatedButton(onPressed: () {}, buttonName: 'Create Bio Data')
      ],
    );
  }
}
