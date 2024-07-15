import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/all_divisions.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_validators.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button1.dart';
import 'package:islamic_marriage/widgets/custom_drop_down_button_test.dart';
import 'package:islamic_marriage/widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';
import 'package:lottie/lottie.dart';

class HelpMateScreen extends StatefulWidget {

  const HelpMateScreen({super.key});

  @override
  State<HelpMateScreen> createState() => _HelpMateScreenState();
}

class _HelpMateScreenState extends State<HelpMateScreen> {

  final _allBioDataController = Get.find<AllBioDataController>();

  DropdownItem? selectedBioDataType;
  DropdownItem? selectedMaritalStatus;

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

  final _scrollController = ScrollController();

  late List<Division> _divisions;

  @override
  void initState() {
    super.initState();
    _divisions = getDivisions;
    _scrollController.addListener(_onScroll);
    _allBioDataController.selectedDivision=null;
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent ==
        _scrollController.offset) {
      if (_allBioDataController.hasMore && !_allBioDataController.isLoading) {
        if (_allBioDataController.selectedBioDataType == null &&
            _allBioDataController.selectedMaritalStatus == null &&
            _allBioDataController.permanentAddress.isEmpty) {
          _allBioDataController.readAllBioData(isLoadMore: true);
        } else {
          _allBioDataController.readAllSearchedBioData(isLoadMore: true);
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllBioDataController>(builder: (controller) {
      return Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Gap(16.h),
              CustomBioDataBg(
                  child: Visibility(
                      visible: controller.bioData.isNotEmpty,
                      replacement: _buildSearchFiltering(controller),
                      child: _buildClearItem(controller))),
              Gap(16.h),
              Flexible(
                  child: controller.isLoading && controller.bioData.isEmpty
                      ? customCircularProgressIndicator
                      : controller.bioData.isEmpty
                          ? Center(child: Lottie.asset(AppUrls.searchJson))
                          : _buildBioData(controller))
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
          'Found ${controller.countBioData.toString()} Bio Data',
          style: AppTextStyles.titleMedium(color: AppColors.whiteClr),
        ),
        CustomElevatedButton(
          onPressed: () {
            controller.clearBioData();
          },
          buttonName: 'Clear',
          icon: Icons.clear,
          buttonWidth: 130.w,
        )
      ],
    );
  }

  Column _buildSearchFiltering(AllBioDataController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('typeOfBioData'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: darkFontClr)),
        CustomDropdownButtonTest(
          value: selectedBioDataType,
          validator: dropdownValidator,
          items: _bioDataType,
          onChanged: (newValue) {
            setState(() {
              selectedBioDataType = newValue;
            });
          },
        ),
        Gap(16.h),
        Text('maritalStatus'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: darkFontClr)),
        CustomDropdownButtonTest(
          value: selectedMaritalStatus,
          validator: dropdownValidator,
          items: _maritalStatus,
          onChanged: (newValue) {
            setState(() {
              selectedMaritalStatus = newValue;
            });
          },
        ),
        Gap(16.h),
        Text('permanentAddress'.tr,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: darkFontClr)),
        CustomDropdownButton1<Division>(
          validator: dropdownValidator,
          value: _allBioDataController.selectedDivision,
          items: _divisions,
          onChanged: (value) {
            setState(() {
              _allBioDataController.selectedDivision = value;
              _allBioDataController.selectedDistrict = null;
              _allBioDataController.selectedSubDistrict = null;
            });
          },
        ),
        Gap(8.h),
        Row(
          children: [
            Expanded(
              child: CustomDropdownButton1<District>(
                validator: dropdownValidator,
                value: _allBioDataController.selectedDistrict,
                items: _allBioDataController.selectedDivision?.districts ?? [],
                onChanged: (value) {
                  setState(() {
                    _allBioDataController.selectedDistrict = value;
                    _allBioDataController.selectedSubDistrict = null;
                  });
                },
              ),
            ),
            Gap(8.w),
            Expanded(
              child: CustomDropdownButton1<SubDistrict>(
                validator: dropdownValidator,
                value: _allBioDataController.selectedSubDistrict,
                items:
                    _allBioDataController.selectedDistrict?.subDistricts ?? [],
                onChanged: (value) {
                  setState(() {
                    _allBioDataController.selectedSubDistrict = value;
                  });
                },
              ),
            ),
          ],
        ),
        Gap(16.h),
        Center(
          child: CustomElevatedButton(
            onPressed: () {
              // controller.offset = 0;
              // if (controller.selectedBioDataType == null &&
              //     controller.selectedMaritalStatus == null &&
              //     controller.permanentAddress.isEmpty) {
              //   controller.readAllBioData(isLoadMore: true);
              // } else {
              //   controller.readAllSearchedBioData(isLoadMore: true);
              // }
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
          if (index < controller.bioData.length) {
            final bioData = controller.bioData[index];
            return _buildBioDataCard(bioData);
          } else {
            return controller.hasMore
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Center(
                      child: customCircularProgressIndicator,
                    ),
                  )
                : SizedBox();
          }
        },
        separatorBuilder: (context, index) => Gap(16.h),
        itemCount: controller.bioData.length + (controller.hasMore ? 1 : 0));
  }

  CustomBioDataBg _buildBioDataCard(BioData bioData) {
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
          Text('Name: ${bioData.fullName}',
              style: AppTextStyles.titleLarge(color: AppColors.whiteClr)),
          Gap(16.h),
          CustomBioDataTable(data: generateGeneralInfo(bioData)),
          Gap(16.h),
          CustomElevatedButton(
            onPressed: () {
             // Get.to(() => BioDataDetailsScreen(user: bioData));
            },
            buttonName: 'Full Bio Data',
            buttonWidth: 300.w,
            buttonHeight: 50.h,
          )
        ],
      ),
    );
  }
  Map<String, String?> generateGeneralInfo(BioData bioData) {
    final data = bioData.personalInformation;
    if(data != null){
      return {
        'Date of Birth': formatDate(data.dateOfBirth!),
        'Height': data.height,
        'Complexion': data.complexion,
      };
    }else{
      return {
        'Date of Birth': 'N/A',
        'Height': 'N/A',
        'Complexion': 'N/A',
      };
    }
  }

}
