import 'package:flutter/material.dart';
import 'package:islamic_marriage/utils/app_colors.dart';

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
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: greyClr),
          children: [
            TextSpan(
                text: isRequired == true? ' *': '',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.red))
          ]),
    );
  }
}
