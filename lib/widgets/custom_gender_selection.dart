import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/sign_up_screen/models/gender_model.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

class CustomGenderSelection extends StatelessWidget {
  final List<GenderModel> genders;
  final int currentGender;
  final Function(int) onGenderSelected;

  const CustomGenderSelection({
    super.key,
    required this.genders,
    required this.currentGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
            genders.length,
                (index) => GestureDetector(
                    onTap: () {
                      print("User selected gender: ${genders[index].title}");
                      onGenderSelected(index);
                    },
                child: Container(
                    height: 40.h,
                    width: 100.w,
                    margin: EdgeInsets.only(right: 16.w),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: AppColors.purple50Clr,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                            color: currentGender == index
                                ? purpleClr
                                : lightBgClr)),
                    child: Text(genders[index].title.tr,
                        style: Theme.of(context).textTheme.titleMedium)))));
  }
}
