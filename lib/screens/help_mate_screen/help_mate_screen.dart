import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_mate_screen/controller/all_bio_data_controller.dart';
import 'package:islamic_marriage/screens/help_mate_screen/model/bio_data_model.dart';
import 'package:islamic_marriage/screens/user_bio_data_screen/user_bio_data_screen.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_drop_down_button.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_elevated_button.dart';
import 'package:islamic_marriage/widgets/show_bio_data_widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class HelpMateScreen extends StatefulWidget {
  const HelpMateScreen({super.key});

  @override
  State<HelpMateScreen> createState() => _HelpMateScreenState();
}

class _HelpMateScreenState extends State<HelpMateScreen> {
  final List<String> _typeOfBioData = [
    "Male's Bio Data",
    "Female's Bio Data",
  ];
  final List<String> _maritalStatus = [
    'Married',
    'Unmarried',
    'Divorced',
  ];
  final List<String> _address = [
    'Dhaka',
    'Chittagong',
  ];
  String _selectedTypeOfBioData = 'All';
  String _selectedMaritalStatus = 'All';
  String _selectedAddress = 'All';

  @override
  Widget build(BuildContext context) {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type of Bio Data',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton(
                      items: _typeOfBioData,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedTypeOfBioData = newValue!;
                        });
                      },
                      hintText: 'All',
                    ),
                    Gap(16.h),
                    Text('Marital Status',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton(
                      items: _maritalStatus,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedMaritalStatus = newValue!;
                        });
                      },
                      hintText: 'All',
                    ),
                    Gap(16.h),
                    Text('Permanent Address',
                        style: AppTextStyles.bodyMedium(
                            color: AppColors.whiteClr)),
                    CustomDropdownButton(
                      items: _address,
                      onChanged: (newValue) {
                        setState(() {
                          _selectedAddress = newValue!;
                        });
                      },
                      hintText: 'All',
                    ),
                    Gap(16.h),
                    Center(
                        child: CustomElevatedButton(
                      onPressed: () {},
                      buttonName: 'Search',
                      icon: Icons.search,
                      buttonWidth: 130.w,
                    ))
                  ],
                ),
              ),
              Gap(16.h),
              GetBuilder<AllBioDataController>(
                  builder: (controller) => controller.isLoading
                      ? customCircularProgressIndicator
                      : controller.bioData.isEmpty
                          ? Center(
                              child: Text('No Bio Data Found',
                                  style: AppTextStyles.titleMedium()))
                          : _buildBioData(controller))
            ],
          ),
        ));
  }

  Flexible _buildBioData(AllBioDataController controller) {
    return Flexible(
      child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final bioData = controller.bioData[index];
            return CustomBioDataBg(
              child: Column(
                children: [
                  SizedBox(
                    height: 85.h,
                    width: 85.w,
                    child: CircleAvatar(
                      foregroundImage: bioData.lifeStyleInformation?.photo != null
                          ? NetworkImage(bioData.lifeStyleInformation!.photo!) as ImageProvider
                          : const AssetImage(AppUrls.photoPng),
                    ),
                  ),
                  Gap(8.h),
                  Text('Bio Data No: ${bioData.id}',
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
                                    bioData.personalInformation?.dateOfBirth ?? '',
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
                                    bioData.personalInformation?.height ?? 'N/A',
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
                                    bioData.personalInformation?.complexion ?? 'N/A',
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
          },
          separatorBuilder: (context, index) => Gap(16.h),
          itemCount: controller.bioData.length),
    );
  }
}
