import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/models/dropdown_item.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomDropdownButtonTest extends StatelessWidget {
  final DropdownItem? value;
  final List<DropdownItem> items;
  final ValueChanged<DropdownItem?> onChanged;
  final String? hintText;
  final FormFieldValidator<DropdownItem>? validator;

  const CustomDropdownButtonTest({
    super.key,
    this.value,
    required this.items,
    required this.onChanged,
    this.hintText,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<DropdownItem>(
      items: items.map((DropdownItem item) {
        return DropdownMenuItem<DropdownItem>(
          value: item,
          child: Text(item.title, style: AppTextStyles.bodyMedium()),
        );
      }).toList(),
      onChanged: onChanged,
      validator: validator,
      value: value,
      hint: Text(
        hintText ?? 'select'.tr,
        style: AppTextStyles.bodyMedium(),
      ),
      style: AppTextStyles.bodySmall(),
      iconStyleData: IconStyleData(
        icon: value == null
            ? Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.violetClr,
                size: 25.sp,
              )
            : SizedBox.shrink(), // Empty widget when value is selected
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
        suffixIcon: value != null
            ? IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColors.violetClr,
                  size: 25.sp,
                ),
                onPressed: () => onChanged(null), // Clear selection
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.violetClr, width: 2.w),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: AppColors.violetClr, width: 2.w),
        ),
      ),
    );
  }
}
