import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/personal_info_controller.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/widgets/input_title_text.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controllers/my_bio_data_controller.dart';
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


    @override
    void initState() {
      super.initState();
      final _personalInfoData = Get.find<MyBioDataController>().currentUser!.data!.biodata!.personalInfo;

      if (_personalInfoData != null) {
        _personalInfoController.clothesController.text = _personalInfoData.clothingOutside ?? '';
        _personalInfoController.beardController.text = _personalInfoData.sunnahBeardSince ?? '';
        _personalInfoController.aboveTheAnklesController.text = _personalInfoData.clothesAboveAnkles.toString() ?? '';
        _personalInfoController.prayController.text = _personalInfoData.fiveTimesPrayerSince ?? '';
        _personalInfoController.qazaController.text = _personalInfoData.prayerMissDaily ?? '';
        _personalInfoController.mahramController.text = _personalInfoData.complyNonMahram ?? '';
        _personalInfoController.reciteQuranController.text = _personalInfoData.reciteQuranCorrectly ?? '';
        _personalInfoController.selectedFiqh = _fiqh.firstWhereOrNull((item) => item.value == _personalInfoData.followedFiqah);
        _personalInfoController.watchOrListenController.text = _personalInfoData.watchIslamicDramaSong ?? '';
        _personalInfoController.diseaseController.text = _personalInfoData.mentalPhysicalDiseases ?? '';
        _personalInfoController.specialWorkController.text = _personalInfoData.involvedSpecialDeenWork ?? '';
        _personalInfoController.mazarController.text = _personalInfoData.believeAboutMazar ?? '';
        _personalInfoController.islamicBooksController.text = _personalInfoData.islamicReadedBookName ?? '';
        _personalInfoController.islamicScholarsController.text = _personalInfoData.islamicFollowedScholarName ?? '';
        _personalInfoController.hobbiesController.text = _personalInfoData.hobbiesLikeDislike ?? '';
        _personalInfoController.mobileController.text = _personalInfoData.groomPhone ?? '';
        _personalInfoController.imageUrl = _personalInfoData.groomSelfieUrl ?? '';
      } else {
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
           InputTitleText(
              title:
                  "clothingOutSideTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.clothesController),
          Gap(4.h),
          Text(
            'clothingOutSideNB'.tr,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr),
          ),

          Gap(16.h),
          InputTitleText(
              title: "sunnahBeardSinceTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.beardController),
          Gap(4.h),
          Text(
            'sunnahBeardSinceNB'.tr,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr)
          ),
          Gap(16.h),

          InputTitleText(title: "clothesAboveAnklesTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.aboveTheAnklesController),
          Gap(16.h),

          InputTitleText(title: "fiveTimesPrayerSinceTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.prayController),
          Gap(4.h),
          Text(
            'fiveTimesPrayerSinceNB'.tr,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(color: violetClr),
          ),
          Gap(16.h),

          InputTitleText(
              title:
                  "prayerMissWeeklyTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.qazaController,
            keyBoardType: TextInputType.phone
          ),
          Gap(16.h),

          InputTitleText(title: "complyMahramNonMahramTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.mahramController),
          Gap(16.h),

          InputTitleText(
              title: "reciteQuranTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.reciteQuranController),
          Gap(16.h),

          InputTitleText(
            title: "followedFiqh".tr
          ),
          Gap(4.h),
          CustomDropdownButtonTest(
              value: _personalInfoController.selectedFiqh,
              validator: dropdownValidator,
              items: _fiqh,
              onChanged: (newValue) {
                setState(() {
                  _personalInfoController.selectedFiqh = newValue;
                });
              }),
          Gap(16.h),

          InputTitleText(
              title: "watchOrListenTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.watchOrListenController),
          Gap(16.h),

          InputTitleText(
              title: "diseaseTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.diseaseController),
          Gap(16.h),

          InputTitleText(
              title: "involvedInSpecialWorkTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.specialWorkController),
          Gap(4.h),
          Text('involvedInSpecialWorkNB'.tr,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: violetClr)),
          Gap(16.h),

          InputTitleText(
              title: "aboutShrineTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.mazarController),
          Gap(16.h),

          InputTitleText(
              title: "islamicBooksTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.islamicBooksController),
          Gap(16.h),

          InputTitleText(
              title:
                  "islamicScholarsTitle".tr),
          Gap(4.h),
          CustomTextFormField(
              validator: requiredValidator,
              controller: _personalInfoController.islamicScholarsController),
          Gap(16.h),

          // const InputTitleText(
          //     title:
          //         "Select the category is applicable to you (Otherwise leave the field blank)",
          //     isRequired: false),
          // Gap(4.h),
          // CustomDropdownButton(
          //     value: selectedSpecial,
          //     items: _special,
          //     onChanged: (newValue) {
          //       setState(() {
          //         selectedSpecial = newValue;
          //       });
          //     }),
          // Gap(4.h),
          // Text(
          //     'Example: If you are a Converted Muslim, select the Converted Muslim category. If you are associated with Tablig, select the Tablig category. In this way, you can select one or the more the mentioned category',
          //     style: Theme.of(context)
          //         .textTheme
          //         .bodySmall!
          //         .copyWith(color: violetClr)),
          // Gap(16.h),
          InputTitleText(
              title:
                  "hobbiesTitle".tr),
          Gap(4.h),
          CustomTextFormField(
            validator: requiredValidator,
            controller: _personalInfoController.hobbiesController,
            maxLines: 5
          ),
          Gap(4.h),
          Text(
              'hobbiesNB'.tr,
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
            keyBoardType: TextInputType.phone
          ),
          Gap(4.h),
          Text(
              "groomsPhoneNB".tr,
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
}
