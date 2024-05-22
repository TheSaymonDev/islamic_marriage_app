import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomDropdownButton1<T> extends StatelessWidget {
  final T? value;
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final String hintText;
  final FormFieldValidator<T>? validator;

  const CustomDropdownButton1({
    super.key,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hintText = 'Select',
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(
      validator: validator,
      value: value,
      items: items.map((item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
      onChanged: onChanged,
      hint: Text(
        hintText,
        style: AppTextStyles.bodyMedium(),
      ),
      style: AppTextStyles.bodySmall(),
      iconStyleData: IconStyleData(
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.violetClr,
        ),
        iconSize: 25.sp,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
      menuItemStyleData: MenuItemStyleData(
        padding: EdgeInsets.only(left: 20.w, right: 8.w),
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 8.w),
        fillColor: AppColors.filledClr,
        filled: true,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.violetClr, width: 2.w)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: AppColors.violetClr, width: 2.w)),
      ),
    );
  }
}
