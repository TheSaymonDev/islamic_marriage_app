import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
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
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.headset, title: 'Custom Service'),
          Gap(8.h),
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.internetExplorer, title: 'Website'),
          Gap(8.h),
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.linkedin, title: 'Linkedin'),
          Gap(8.h),
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.twitter, title: 'Twitter'),
          Gap(8.h),
          CustomButton(onTap: (){}, iconData: FontAwesomeIcons.facebook, title: 'Facebook'),
        ],
      ),
    );
  }
}
