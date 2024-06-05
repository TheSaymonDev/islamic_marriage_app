import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class AddressManagementButton extends StatelessWidget {

  final bool isEditable;
  final void Function()? onTap;
  const AddressManagementButton(
      {super.key, required this.isEditable, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(children: [
        Icon(isEditable == true ? Icons.edit : Icons.delete_forever,
            size: 20.sp, color: AppColors.violetClr),
        Gap(4.w),
        Text(isEditable == true ? 'Edit' : 'Remove',
            style: AppTextStyles.titleMedium(color: AppColors.violetClr))
      ]),
    );
  }
}
