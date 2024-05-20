import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/controller/personal_info_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_text_form_field.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {

  final PersonalInfoController _personalInfoController =
  Get.find<PersonalInfoController>();
  final _personalInfo = Get.find<MyBioDataController>().myBioData!.lifeStyleInformation;

  final List<String> _special = [
    "Disable",
    "Infertile",
    "Converted Muslim",
    "Orphan",
    "Interested in being Masna",
    "Tablig"
  ];
  final List<String> _fiqh = [
    'hanafi',
    'maliki',
    'shafi',
    'hanbali',
    'ahleHadis'
  ];

  @override
  void initState() {
    super.initState();
    if(_personalInfo != null){
      _personalInfoController.clothesController.text = _personalInfo.clothesInfo!;
      _personalInfoController.beardController.text = _personalInfo.breadInfo!;
      _personalInfoController.aboveTheAnklesController.text = _personalInfo.clothesAnkles!;
      _personalInfoController.prayController.text = _personalInfo.prayInfo!;
      _personalInfoController.qazaController.text = _personalInfo.qazaInfo!;
      _personalInfoController.mahramController.text = _personalInfo.marhamInfo!;
      _personalInfoController.reciteQuranController.text = _personalInfo.reciteTheQuran!;
      _personalInfoController.selectedFiqh = _personalInfo.fiqh;
      _personalInfoController.watchOrListenController.text = _personalInfo.moviesOrSongs!;
      _personalInfoController.diseaseController.text = _personalInfo.physicalDiseases!;
      _personalInfoController.specialWorkController.text = _personalInfo.applicable!;
      _personalInfoController.mazarController.text = _personalInfo.mazarInfo!;
      _personalInfoController.islamicBooksController.text = _personalInfo.books!;
      _personalInfoController.islamicScholarsController.text = _personalInfo.islamicScholars!;
      _personalInfoController.hobbiesController.text = _personalInfo.hobbies!;
      _personalInfoController.mobileController.text = _personalInfo.groomMobileNumber!;
      _personalInfoController.imageUrl = _personalInfo.photo;
      _personalInfoController.imageFile = null;
    }else{
      _personalInfoController.clothesController.text = '';
      _personalInfoController.beardController.text = '';
      _personalInfoController.aboveTheAnklesController.text = '';
      _personalInfoController.prayController.text = '';
      _personalInfoController.qazaController.text = '';
      _personalInfoController.mahramController.text = '';
      _personalInfoController.reciteQuranController.text = '';
      _personalInfoController.selectedFiqh = null;
      _personalInfoController.watchOrListenController.text = '';
      _personalInfoController.diseaseController.text = '';
      _personalInfoController.specialWorkController.text = '';
      _personalInfoController.mazarController.text = '';
      _personalInfoController.islamicBooksController.text = '';
      _personalInfoController.islamicScholarsController.text = '';
      _personalInfoController.hobbiesController.text = '';
      _personalInfoController.mobileController.text = '';
      _personalInfoController.imageUrl = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const InputTitleText(
              title:
                  "What kind of clothes do you usually wear outside the house?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Cloth",
              controller: _personalInfoController.clothesController),
          Gap(4.h),
          Text(
            'For the bride, you can write like following- "Wear black burqa with niqab and hand foot socks" or "Wear burqa and hijab, do not wear niqab" or "Wear mask with hijab, do not wear niqab" or "Wear salwar kameez, do not wear niqab"',
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
          const InputTitleText(
              title: "Do you have beard according to sunnah? Since when?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Beard",
              controller: _personalInfoController.beardController),
          Gap(4.h),
          Text(
            'Please clearly write how many years you have been keeping a beard. If you have less beard growth due to biological reasons, it should be mentioned.',
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
          const InputTitleText(title: "Do you wear clothes above the ankles?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Above the Ankles",
              controller: _personalInfoController.aboveTheAnklesController),
          Gap(16.h),
          const InputTitleText(title: "Do you pray 5 times a day? Since when?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Pray",
              controller: _personalInfoController.prayController),
          Gap(4.h),
          Text(
            'Please write a clear answer with "Yes" or "No" It must be mentioned how many years you have been praying five times a day?',
            style: AppTextStyles.bodySmall(color: AppColors.violetClr),
          ),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Usually how many times(waqt) a week are your prayers missed (Qaza)?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Prayer Qaza",
              controller: _personalInfoController.qazaController),
          Gap(16.h),
          const InputTitleText(title: "Do you comply with mahram/non-mahram?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Mahram/Non- Mahram",
              controller: _personalInfoController.mahramController),
          Gap(16.h),
          const InputTitleText(
              title: "Are you able to recite the quran correctly?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Recite Quran",
              controller: _personalInfoController.reciteQuranController),
          Gap(16.h),
          const InputTitleText(
            title: "Which Fiqh do you follow?",
          ),
          Gap(4.h),
          CustomDropdownButton(
            value: _personalInfoController.selectedFiqh,
              validator: dropdownValidator,
              items: _fiqh,
              onChanged: (newValue) {
                setState(() {
                  _personalInfoController.selectedFiqh = newValue;
                });
              }),
          const InputTitleText(
              title: "Do you watch or listen to dramas/movies/serials/songs?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Watch or Listen",
              controller: _personalInfoController.watchOrListenController),
          Gap(16.h),
          const InputTitleText(
              title: "Do you have any mental or physical disease?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Disease",
              controller: _personalInfoController.diseaseController),
          Gap(16.h),
          const InputTitleText(
              title: "Are you involved in any special work of deen?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Special Work",
              controller: _personalInfoController.specialWorkController),
          Gap(4.h),
          Text('Example: Tablig etc.',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
              title: "What are your ideas or beliefs about the shrine (Mazar)?"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Write about Mazar",
              controller: _personalInfoController.mazarController),
          Gap(16.h),
          const InputTitleText(
              title: "Write the names of at least 3 Islamic books you have read"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Islamic Book",
              controller: _personalInfoController.islamicBooksController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Write the names of at least 3 Islamic Scholars of your choice"),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              hintText: "Islamic Scholars",
              controller: _personalInfoController.islamicScholarsController),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Select the category is applicable to you (Otherwise leave the field blank)",
              isRequired: false),
          Gap(4.h),
          CustomDropdownButton(
            value: _personalInfoController.selectedSpecial,
              items: _special,
              onChanged: (newValue) {
                setState(() {
                  _personalInfoController.selectedSpecial = newValue;
                });
              }),
          Gap(4.h),
          Text(
              'Example: If you are a Converted Muslim, select the Converted Muslim category. If you are associated with Tablig, select the Tablig category. In this way, you can select one or the more the mentioned category',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
              title:
                  "Write about your hobbies, likes and dislikes, tastes, dreams and so on"),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            hintText: "Hobbies",
            controller: _personalInfoController.hobbiesController,
            maxLines: 5,
          ),
          Gap(4.h),
          Text(
              'The more details you provide, the easier it will be for others to understand you and the higher the chances of receiving relevant proposals',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(title: "Groom's Mobile Number"),
          Gap(4.h),
          CustomTextFormField(
            validator: mobileValidator,
            hintText: "Mobile",
            controller: _personalInfoController.mobileController,
            keyBoardType: TextInputType.phone,
          ),
          Gap(4.h),
          Text(
              "Groom's personal mobile number are being taken for Bio Data verification. It will not be disclosed to anyone except the authorities.",
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
          const InputTitleText(
              title: "Take a selfie of the groom right now and upload it."),
          Gap(4.h),
          _uploadImage,
          Text(
              'Submitting a photo other than a selfie or a clear frontal photo where the face can be clearly seen may result in the bio data not been approved. Photo is taken only for identity verification. Upload a recent photo where the face is clearly defined. Your photo will not be disclosed to anyone other than the Islamic Marriage authorities',
              style: AppTextStyles.bodySmall(color: AppColors.violetClr)),
          Gap(16.h),
        ],
      ),
    );
  }

  GetBuilder<PersonalInfoController> get _uploadImage {
    return GetBuilder<PersonalInfoController>(builder: (controller) {
      return Column(
        children: [
          GestureDetector(
            onTap: () async {
              await controller.getImageFromCamera();
            },
            child: DottedBorder(
              borderType: BorderType.RRect,
              color: AppColors.violetClr,
              radius: Radius.circular(8.r),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              child: SizedBox(
                height: 50.h,
                width: double.infinity.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.upload,
                      color: AppColors.blackClr,
                      size: 20.sp,
                    ),
                    Gap(16.w),
                    Text(
                      'Upload Photo',
                      style: AppTextStyles.titleMedium(),
                    )
                  ],
                ),
              ),
            ),
          ),
          Gap(4.h),
          Center(
            child: controller.imageFile == null && controller.imageUrl == null
                ? const SizedBox()
                : controller.imageFile != null
                ? Image.file(
              controller.imageFile!,
              width: 70.w,
              height: 70.h,
            )
                : Image.network(
              controller.imageUrl!,
              width: 70.w,
              height: 70.h,
            ),
          ),
        ],
      );
    });
  }
}
