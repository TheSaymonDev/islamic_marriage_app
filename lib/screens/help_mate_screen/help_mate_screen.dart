import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/test_data.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';
import 'package:islamic_marriage/screens/help_mate_screen/model/bio_data_model.dart';
import 'package:islamic_marriage/screens/user_bio_data_screen/user_bio_data_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/validator.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button1.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/show_bio_data_widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class HelpMateScreen extends StatefulWidget {
  const HelpMateScreen({super.key});

  @override
  State<HelpMateScreen> createState() => _HelpMateScreenState();
}

class _HelpMateScreenState extends State<HelpMateScreen> {
  final _allBioDataController = Get.find<AllBioDataController>();

  final List<String> _bioDataType = ["groom", "bride"];
  final List<String> _maritalStatus = [
    "single",
    "married",
    "divorced",
    "widowed",
    "separated"
  ];

  final _scrollController = ScrollController();

  late List<Division> divisions;

  @override
  void initState() {
    super.initState();
    divisions = getDivisions;
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.maxScrollExtent == _scrollController.offset) {
      if (_allBioDataController.selectedBioDataType == null &&
          _allBioDataController.selectedMaritalStatus == null &&
          _allBioDataController.permanentAddress.isEmpty) {
        _allBioDataController.readAllBioData(isLoadMore: true);
      } else {
        _allBioDataController.readAllSearchedBioData(isLoadMore: true);
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type of Bio Data',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton(
                      value: _allBioDataController.selectedBioDataType,
                      items: _bioDataType,
                      onChanged: (newValue) {
                        setState(() {
                          _allBioDataController.selectedBioDataType = newValue;
                        });
                      },
                      hintText: 'All',
                    ),
                    Gap(16.h),
                    Text('Marital Status',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton(
                      value: _allBioDataController.selectedMaritalStatus,
                      items: _maritalStatus,
                      onChanged: (newValue) {
                        setState(() {
                          _allBioDataController.selectedMaritalStatus =
                              newValue;
                        });
                      },
                      hintText: 'All',
                    ),
                    Gap(16.h),
                    Text('Permanent Address',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton1<Division>(
                      validator: dropdownValidator,
                      value: _allBioDataController.selectedDivision,
                      items: divisions,
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
                            items: _allBioDataController
                                    .selectedDivision?.districts ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                _allBioDataController.selectedDistrict = value;
                                _allBioDataController.selectedSubDistrict =
                                    null;
                              });
                            },
                          ),
                        ),
                        Gap(8.w),
                        Expanded(
                          child: CustomDropdownButton1<SubDistrict>(
                            validator: dropdownValidator,
                            value: _allBioDataController.selectedSubDistrict,
                            items: _allBioDataController
                                    .selectedDistrict?.subDistricts ??
                                [],
                            onChanged: (value) {
                              setState(() {
                                _allBioDataController.selectedSubDistrict =
                                    value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    Gap(16.h),
                    Center(
                      child: Visibility(
                        visible: controller.bioData.isNotEmpty,
                        replacement: CustomElevatedButton(
                          onPressed: () {
                            if (controller.selectedBioDataType == null &&
                                controller.selectedMaritalStatus == null &&
                                controller.permanentAddress.isEmpty) {
                              controller.readAllBioData(isLoadMore: true);
                            } else {
                              controller.readAllSearchedBioData(
                                  isLoadMore: true);
                            }
                          },
                          buttonName: 'Search',
                          icon: Icons.search,
                          buttonWidth: 130.w,
                        ),
                        child: CustomElevatedButton(
                          onPressed: () {
                            controller.clearBioData();
                          },
                          buttonName: 'Clear',
                          icon: Icons.clear,
                          buttonWidth: 130.w,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(16.h),
              Flexible(
                  child: controller.isLoading && controller.bioData.isEmpty
                      ? customCircularProgressIndicator
                      : controller.bioData.isEmpty
                          ? Center(
                              child: Text('No Bio Data Found',
                                  style: AppTextStyles.titleMedium()))
                          : _buildBioData(controller))
            ],
          ),
        ),
      );
    });
  }

  Widget _buildBioData(AllBioDataController controller) {
    return ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          if (index < controller.bioData.length) {
            final bioData = controller.bioData[index];
            return CustomBioDataBg(
              child: Column(
                children: [
                  SizedBox(
                    height: 85.h,
                    width: 85.w,
                    child: CircleAvatar(
                      foregroundImage: bioData.lifeStyleInformation?.photo !=
                              null
                          ? CachedNetworkImageProvider(
                              bioData.lifeStyleInformation!.photo!)
                          : const AssetImage(AppUrls.photoPng) as ImageProvider,
                    ),
                  ),
                  Gap(8.h),
                  Text('Name: ${bioData.fullName}',
                      style:
                          AppTextStyles.titleLarge(color: AppColors.whiteClr)),
                  Gap(16.h),
                  Table(
                    border:
                        TableBorder.all(color: AppColors.whiteClr, width: 2.w),
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text('Date of Birth',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.titleMedium(
                                    color: AppColors.whiteClr)),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 8.w),
                              child: Center(
                                child: Text(
                                    bioData.personalInformation?.dateOfBirth ??
                                        '',
                                    style: AppTextStyles.bodyMedium(
                                        color: AppColors.whiteClr)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                              verticalAlignment:
                                  TableCellVerticalAlignment.middle,
                              child: Text('Height',
                                  textAlign: TextAlign.center,
                                  style: AppTextStyles.titleMedium(
                                      color: AppColors.whiteClr))),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 8.w),
                              child: Center(
                                child: Text(
                                    bioData.personalInformation?.height ??
                                        'N/A',
                                    style: AppTextStyles.bodyMedium(
                                        color: AppColors.whiteClr)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Text('Complexion',
                                textAlign: TextAlign.center,
                                style: AppTextStyles.titleMedium(
                                    color: AppColors.whiteClr)),
                          ),
                          TableCell(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 12.h, horizontal: 8.w),
                              child: Center(
                                child: Text(
                                    bioData.personalInformation?.complexion ??
                                        'N/A',
                                    style: AppTextStyles.bodyMedium(
                                        color: AppColors.whiteClr)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Gap(16.h),
                  CustomElevatedButton(
                    onPressed: () {
                      Get.to(() => UserBioDataScreen(
                            user: User.userList[index],
                          ));
                    },
                    buttonName: 'Full Bio Data',
                    buttonWidth: 300.w,
                    buttonHeight: 50.h,
                  )
                ],
              ),
            );
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
        itemCount: controller.bioData.length + 1);
  }
}
