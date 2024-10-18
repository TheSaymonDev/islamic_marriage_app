import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/routes/app_routes.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/screens/explore_screens/models/all_user.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controllers/all_bio_data_controller.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';
import 'package:lottie/lottie.dart';

class HelpMateScreen extends StatefulWidget {
  const HelpMateScreen({super.key});

  @override
  State<HelpMateScreen> createState() => _HelpMateScreenState();
}

class _HelpMateScreenState extends State<HelpMateScreen> {
  final List<DropdownItem> _bioDataType = [
    DropdownItem(title: "malesBioData".tr, value: 'maleBioData'),
    DropdownItem(title: "femalesBioData".tr, value: 'femaleBioData')
  ];

  final List<DropdownItem> _maritalStatus = [
    DropdownItem(title: "neverMarried".tr, value: "neverMarried"),
    DropdownItem(title: "married".tr, value: "married"),
    DropdownItem(title: "divorced".tr, value: "divorced"),
    DropdownItem(title: "widow".tr, value: "widow"),
    DropdownItem(title: "widower".tr, value: "widower"),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllBioDataController>(builder: (controller) {
      return Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(16.h),
              CustomBioDataBg(
                child: Visibility(
                  visible: controller.allUser?.data?.isNotEmpty ?? false,
                  replacement: _buildSearchFiltering(controller),
                  child: _buildClearItem(controller),
                ),
              ),
              Gap(16.h),
              Flexible(
                child: controller.isLoading &&
                        (controller.allUser?.data?.isEmpty ?? true)
                    ? customCircularProgressIndicator
                    : (controller.allUser?.data?.isEmpty ?? true)
                        ? SizedBox(
                            height: 250.h,
                            width: 250.w,
                            child:
                                Lottie.asset(AppUrls.searchJson))
                        : _buildBioData(controller),
              ),
            ],
          ),
        ),
      );
    });
  }

  Row _buildClearItem(AllBioDataController controller) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Found ${controller.allUser?.data?.length ?? 0} Bio Data',
          style: AppTextStyles.titleMedium(color: AppColors.whiteClr),
        ),
        CustomElevatedButton(
          onPressed: () {
            controller.clearData();
          },
          buttonName: 'Clear',
          icon: Icons.clear,
          buttonWidth: 130.w,
        ),
      ],
    );
  }

  Column _buildSearchFiltering(AllBioDataController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('typeOfBioData'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: darkFontClr)),
        CustomDropdownButtonTest(
          value: controller.selectedBioDataType,
          validator: dropdownValidator,
          items: _bioDataType,
          onChanged: (newValue) {
            setState(() {
              controller.selectedBioDataType = newValue;
            });
          },
        ),
        Gap(16.h),
        Text('maritalStatus'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: darkFontClr)),
        CustomDropdownButtonTest(
          value: controller.selectedMaritalStatus,
          validator: dropdownValidator,
          items: _maritalStatus,
          onChanged: (newValue) {
            setState(() {
              controller.selectedMaritalStatus = newValue;
            });
          },
        ),
        Gap(16.h),
        Text('permanentAddress'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: darkFontClr)),
        CustomTextFormField(
            hintText: 'divisionHint'.tr,
            controller: controller.selectedDivision,
            validator: requiredValidator),
        Gap(8.h),
        Row(
          children: [
            Expanded(
              child: CustomTextFormField(
                  hintText: 'districtHint'.tr,
                  controller: controller.selectedDistrict,
                  validator: requiredValidator),
            ),
            Gap(8.w),
            Expanded(
              child: CustomTextFormField(
                  hintText: 'subDistrict'.tr,
                  controller: controller.selectedSubDistrict,
                  validator: requiredValidator),
            ),
          ],
        ),
        Gap(8.h),
        Text('bioDataNoTitle'.tr,
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: darkFontClr)),
        CustomTextFormField(
            hintText: 'writeHere'.tr,
            controller: controller.selectedBioDataNo,
            keyBoardType: TextInputType.phone,
            validator: requiredValidator),
        Gap(16.h),
        Center(
          child: CustomElevatedButton(
            onPressed: () {
              controller.getAllSearchedUser();
            },
            buttonName: 'searchBtn'.tr,
            icon: Icons.search,
            buttonWidth: 130.w,
          ),
        )
      ],
    );
  }

  Widget _buildBioData(AllBioDataController controller) {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final bioData = controller.allUser!.data![index];
        return _buildBioDataCard(bioData);
      },
      separatorBuilder: (context, index) => Gap(16.h),
      itemCount: controller.allUser?.data?.length ?? 0,
    );
  }

  CustomBioDataBg _buildBioDataCard(Data bioData) {
    return CustomBioDataBg(
      child: Column(
        children: [
          SizedBox(
            height: 85.h,
            width: 85.w,
            child: CircleAvatar(
              foregroundImage: const AssetImage(AppUrls.placeHolderPng),
            ),
          ),
          Gap(8.h),
          Text(
              'Name ${(bioData.contactInfo?.groomName ?? 'N/A').toUpperCase()}',
              style: AppTextStyles.titleLarge(color: AppColors.whiteClr)),
          Gap(16.h),
          CustomBioDataTable(data: generateGeneralInfo(bioData)),
          Gap(16.h),
          CustomElevatedButton(
            onPressed: () {
              Get.toNamed(
                AppRoutes.bioDataDetailsScreen,
                arguments: {'user': bioData},
              );
            },
            buttonName: 'Full Bio Data',
            buttonWidth: 300.w,
            buttonHeight: 50.h,
          ),
        ],
      ),
    );
  }

  Map<String, String?> generateGeneralInfo(Data bioData) {
    final data = bioData.generalInfo;
    if (data != null) {
      return {
        'Date of Birth':
            data.dateOfBirth != null ? formatDate(data.dateOfBirth!) : 'N/A',
        'Height': data.height ?? 'N/A',
        'Complexion': data.complexion ?? 'N/A',
      };
    } else {
      return {
        'Date of Birth': 'N/A',
        'Height': 'N/A',
        'Complexion': 'N/A',
      };
    }
  }
}
