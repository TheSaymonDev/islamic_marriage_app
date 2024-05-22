import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class CustomBioDataTable extends StatelessWidget {
  final Map<dynamic, dynamic>? data;

  const CustomBioDataTable({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: AppColors.violetClr,
      ),
      child: Table(
        border: TableBorder.all(color: AppColors.whiteClr, width: 2.w),
        children: data!.entries.map((entry) {
          return TableRow(
            children: [
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.middle,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  child: Text(entry.key,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.titleSmall(color: AppColors.whiteClr)),
                ),
              ),
              TableCell(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 8.w),
                  child: Center(
                    child: Text(entry.value,
                        style: AppTextStyles.bodyMedium(color: AppColors.whiteClr)),
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
