import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/help_center_screens/controller/contact_us_controller.dart';
import 'package:islamic_marriage/widgets/profile_widgets/custom_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity.h,
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          CustomButton(onTap: (){
            Get.find<ContactUsController>().makePhoneCall('09647225782');
          }, iconData: FontAwesomeIcons.headset, title: 'Custom Service'),
          Gap(8.h),
          CustomButton(onTap: (){
            Get.find<ContactUsController>().launchInBrowser(Uri.parse('https://islamicmarriage.net'));
          }, iconData: FontAwesomeIcons.internetExplorer, title: 'Website'),
          Gap(8.h),
          CustomButton(onTap: (){
            Get.find<ContactUsController>().launchInBrowser(Uri.parse('https://www.linkedin.com/company/islamicmarrige'));
          }, iconData: FontAwesomeIcons.linkedin, title: 'Linkedin'),
          Gap(8.h),
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.twitter, title: 'Twitter'),
          Gap(8.h),
          CustomButton(onTap: (){
            Get.find<ContactUsController>().launchInBrowser(Uri.parse('https://www.facebook.com/islamicmarriage.net'));
          }, iconData: FontAwesomeIcons.facebook, title: 'Facebook'),
        ],
      ),
    );
  }
}
