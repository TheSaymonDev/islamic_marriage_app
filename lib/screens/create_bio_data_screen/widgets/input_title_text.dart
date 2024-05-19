import 'package:flutter/material.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';

class InputTitleText extends StatelessWidget {
  final String title;
  final bool isRequired;
  const InputTitleText(
      {super.key, required this.title, this.isRequired = true});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: title,
          style: AppTextStyles.bodyMedium(color: AppColors.greyColor),
          children: [
            TextSpan(
                text: isRequired == true? ' *': '',
                style: AppTextStyles.titleSmall(color: Colors.red))
          ]),
    );
  }
}
