import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomFlutterSwitch extends StatelessWidget {
  const CustomFlutterSwitch({super.key, required this.onToggle, required this.value});

  final void Function(bool) onToggle;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return   FlutterSwitch(
      activeColor: AppColors.violetClr,
      inactiveColor: Colors.grey,
      width: 44.0.w,
      height: 23.0.h,
      toggleSize: 18.0.sp,
      borderRadius: 30.0.r,
      padding: 4.0.w,
      value: value,
      onToggle: onToggle,
    );
  }
}
