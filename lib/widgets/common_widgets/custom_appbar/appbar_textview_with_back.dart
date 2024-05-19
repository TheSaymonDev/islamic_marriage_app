import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_back_icon.dart';

class CustomAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    required this.onPressedBack,
    this.title,
    this.tabBar,
  });

  final void Function()? onPressedBack;
  final String? title;
  final TabBar? tabBar;

  @override
  Size get preferredSize => tabBar != null ? Size.fromHeight(120.h) : Size.fromHeight(60.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: CustomBackButton(onPressed: onPressedBack),
      ),
      title: title != null
          ? Text(title!, style: Theme.of(context).textTheme.titleMedium)
          : null, // Use null if title is not provided
      bottom: tabBar,
      toolbarHeight: preferredSize.height,
    );
  }
}
