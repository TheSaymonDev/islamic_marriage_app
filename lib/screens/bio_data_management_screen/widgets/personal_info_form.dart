import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/personal_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/current_user_biodata_model.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class PersonalInfoForm extends StatefulWidget {
  const PersonalInfoForm({super.key});

  @override
  State<PersonalInfoForm> createState() => _PersonalInfoFormState();
}

class _PersonalInfoFormState extends State<PersonalInfoForm> {
  final List<DropdownItem> _fiqh = [
    DropdownItem(title: 'hanafi'.tr, value: 'hanafi'),
    DropdownItem(title: 'maliki'.tr, value: 'maliki'),
    DropdownItem(title: 'shafi'.tr, value: 'shafi'),
    DropdownItem(title: 'hanbali'.tr, value: 'hanbali'),
    DropdownItem(title: 'ahleHadith'.tr, value: 'ahleHadith'),
  ];

  String? imageUrl;
  final _personalInfoController = Get.find<PersonalInfoController>();
  String? _bioDataType;

  @override
  void initState() {
    super.initState();
    final currentBioData = Get.find<CurrentUserBioDataController>()
        .currentUserBioData
        ?.data
        ?.biodata;
    _bioDataType = currentBioData?.generalInfo?.bioDataType;
    final personalInfo = currentBioData?.personalInfo;
    if (personalInfo != null) {
      _assignData(personalInfo);
    } else {
      _clearData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personalInfoController.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InputTitleText(title: "clothingOutSideTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.clothesController),
          Gap(4.h),
          Text(
            'clothingOutSideNB'.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: violetClr),
          ),
          Gap(16.h),
          _bioDataType == 'malesBioData'
              ? _maleBioDataWidget()
              : _femaleBioDataWidget(),
          Gap(16.h),
          InputTitleText(title: "fiveTimesPrayerSinceTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.prayController),
          Gap(4.h),
          Text(
            'fiveTimesPrayerSinceNB'.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: violetClr),
          ),
          Gap(16.h),

          InputTitleText(title: "prayerMissWeeklyTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.qazaController,
              keyBoardType: TextInputType.phone),
          Gap(16.h),

          InputTitleText(
              title: "complyMahramNonMahramTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.mahramController),
          Gap(16.h),

          InputTitleText(title: "reciteQuranTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.reciteQuranController),
          Gap(16.h),

          InputTitleText(title: "followedFiqh".tr, isRequired: false),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _personalInfoController.selectedFiqh,
              items: _fiqh,
              onChanged: (newValue) {
                setState(() {
                  _personalInfoController.selectedFiqh = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(title: "watchOrListenTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.watchOrListenController),
          Gap(16.h),

          InputTitleText(title: "diseaseTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.diseaseController),
          Gap(16.h),

          InputTitleText(
              title: "involvedInSpecialWorkTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.specialWorkController),
          Gap(4.h),
          Text('involvedInSpecialWorkNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "aboutShrineTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.mazarController),
          Gap(16.h),

          InputTitleText(title: "islamicBooksTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.islamicBooksController),
          Gap(16.h),

          InputTitleText(title: "islamicScholarsTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.islamicScholarsController),
          Gap(16.h),
          InputTitleText(title: "hobbiesTitle".tr, isRequired: false),
          Gap(4.h),
          CustomTextFormField(
              controller: _personalInfoController.hobbiesController,
              maxLines: 5),
          Gap(4.h),
          Text('hobbiesNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(title: "groomsPhoneTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: phoneValidator,
              controller: _personalInfoController.mobileController,
              keyBoardType: TextInputType.phone),
          Gap(4.h),
          Text("groomsPhoneNB".tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          // InputTitleText(
          //     title: "selfieTitle".tr),
          // Gap(4.h),
          // _uploadImage,
          // Text(
          //     'selfieNB'.tr,
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          // Gap(16.h),
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
                    Text('uploadPhotoBtn'.tr,
                        style: Theme.of(context).textTheme.titleMedium)
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

  void _assignData(PersonalInfo personalInfo) {
    _personalInfoController.clothesController.text =
        personalInfo.clothingOutside ?? '';
    _personalInfoController.beardController.text =
        personalInfo.sunnahBeardSince ?? '';
    _personalInfoController.aboveTheAnklesController.text =
        personalInfo.clothesAboveAnkles ?? '';
    _personalInfoController.veilController.text = personalInfo.veil ?? '';
    _personalInfoController.prayController.text =
        personalInfo.fiveTimesPrayerSince ?? '';
    _personalInfoController.qazaController.text =
        personalInfo.prayerMissDaily ?? '';
    _personalInfoController.mahramController.text =
        personalInfo.complyNonMahram ?? '';
    _personalInfoController.reciteQuranController.text =
        personalInfo.reciteQuranCorrectly ?? '';
    _personalInfoController.selectedFiqh = _fiqh
        .firstWhereOrNull((item) => item.value == personalInfo.followedFiqah);
    _personalInfoController.watchOrListenController.text =
        personalInfo.watchIslamicDramaSong ?? '';
    _personalInfoController.diseaseController.text =
        personalInfo.mentalPhysicalDiseases ?? '';
    _personalInfoController.specialWorkController.text =
        personalInfo.involvedSpecialDeenWork ?? '';
    _personalInfoController.mazarController.text =
        personalInfo.believeAboutMazar ?? '';
    _personalInfoController.islamicBooksController.text =
        personalInfo.islamicReadedBookName ?? '';
    _personalInfoController.islamicScholarsController.text =
        personalInfo.islamicFollowedScholarName ?? '';
    _personalInfoController.hobbiesController.text =
        personalInfo.hobbiesLikeDislike ?? '';
    _personalInfoController.mobileController.text =
        personalInfo.groomPhone ?? '';
    _personalInfoController.imageUrl = personalInfo.groomSelfieUrl ?? '';
  }

  void _clearData() {
    _personalInfoController.clothesController.clear();
    _personalInfoController.beardController.clear();
    _personalInfoController.aboveTheAnklesController.clear();
    _personalInfoController.veilController.clear();
    _personalInfoController.prayController.clear();
    _personalInfoController.qazaController.clear();
    _personalInfoController.mahramController.clear();
    _personalInfoController.reciteQuranController.clear();
    _personalInfoController.selectedFiqh = null;
    _personalInfoController.watchOrListenController.clear();
    _personalInfoController.diseaseController.clear();
    _personalInfoController.specialWorkController.clear();
    _personalInfoController.mazarController.clear();
    _personalInfoController.islamicBooksController.clear();
    _personalInfoController.islamicScholarsController.clear();
    _personalInfoController.hobbiesController.clear();
    _personalInfoController.mobileController.clear();
    _personalInfoController.imageUrl = null;
  }

  Widget _maleBioDataWidget() {
    _personalInfoController.veilController.clear();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTitleText(title: "sunnahBeardSinceTitle".tr),
        Gap(4.h),
        CustomTextFormField(
          validator: requiredValidator,
          controller: _personalInfoController.beardController,
        ),
        Gap(4.h),
        Text('sunnahBeardSinceNB'.tr,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: violetClr)),
        Gap(16.h),
        InputTitleText(title: "clothesAboveAnklesTitle".tr),
        Gap(4.h),
        CustomTextFormField(
          validator: requiredValidator,
          controller: _personalInfoController.aboveTheAnklesController,
        ),
      ],
    );
  }

  Widget _femaleBioDataWidget() {
    _personalInfoController.beardController.clear();
    _personalInfoController.aboveTheAnklesController.clear();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InputTitleText(title: "veilTitle".tr),
        Gap(4.h),
        CustomTextFormField(
          validator: requiredValidator,
          controller: _personalInfoController.veilController,
        ),
      ],
    );
  }
}
