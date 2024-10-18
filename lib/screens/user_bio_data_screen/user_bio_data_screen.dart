import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_mate_screen/models/bio_data_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_appbar/custom_appbar.dart';
import 'package:islamic_marriage/widgets/custom_expansion_tile.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_bg.dart';
import 'package:islamic_marriage/widgets/custom_bio_data_table.dart';

class UserBioDataScreen extends StatelessWidget {

  final User user;
  const UserBioDataScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final myTextStyle = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppbar(
        onPressedBack: () {
          Get.back();
        },
        title: 'User Bio Data',
      ),
      body: Container(
        height: double.infinity.h,
        width: double.infinity.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
             CustomBioDataBg(child: Column(
               children: [
                 SizedBox(
                   height: 85.h,
                   width: 85.w,
                   child: CircleAvatar(
                     foregroundImage: AssetImage(AppUrls.photoPng),
                   ),
                 ),
                 Gap(8.h),
                 Text(
                   'Bio Data No: ${user.bioDataNo}',
                   style: myTextStyle.titleLarge!.copyWith(color: AppColors.whiteClr)
                 ),
                 Gap(8.h),
                 CustomBioDataTable(data: user.infoList[0].bioData['General Information']),
               ],
             )),
              CustomExpansionTile(title: 'Address', children: [CustomBioDataTable(data: user.infoList[1].bioData['Address'])]),
              CustomExpansionTile(title: 'Educational Qualifications', children: [CustomBioDataTable(data: user.infoList[2].bioData['Educational Qualifications'])]),
              CustomExpansionTile(title: 'Family Information', children: [CustomBioDataTable(data: user.infoList[3].bioData['Family Information'])]),
              CustomExpansionTile(title: 'Personal Information', children: [CustomBioDataTable(data: user.infoList[4].bioData['Personal Information'])]),
              CustomExpansionTile(title: 'Occupational Information', children: [CustomBioDataTable(data: user.infoList[5].bioData['Occupational Information'])]),
              CustomExpansionTile(title: 'Marriage Related Information', children: [CustomBioDataTable(data: user.infoList[6].bioData['Marriage Related Information'])]),
              CustomExpansionTile(title: 'Expected Life Partner', children: [CustomBioDataTable(data: user.infoList[7].bioData['Expected Life Partner'])]),
              CustomExpansionTile(title: 'Pledge', children: [CustomBioDataTable(data: user.infoList[8].bioData['Pledge'])]),
              CustomExpansionTile(title: 'Contact', children: [CustomBioDataTable(data: user.infoList[9].bioData['Contact'])]),
            ],
          ),
        ),
      ),
    );
  }
}
