import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:islamic_marriage/screens/message_screen/models/message.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:timeago/timeago.dart' as timeago;

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.message,
  });

  final Message message;

  @override
  Widget build(BuildContext context) => Align(
        alignment: message.isMe ? Alignment.topRight : Alignment.topLeft,
        child: message.isMe
            ? Container(
                decoration: BoxDecoration(
                  color: AppColors.purpleClr.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30.r),
                    bottomLeft: Radius.circular(30.r),
                    topLeft: Radius.circular(30.r),
                  ),
                ),
                margin: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    message.messageType == MessageType.image
                        ? Container(
                            height: 200.h,
                            width: 200.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16.r),
                              image: DecorationImage(
                                image: NetworkImage(message.content),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : Text(message.content,
                            style: AppTextStyles.bodyMedium()),
                    Gap(6.h),
                    Text(timeago.format(message.sentTime),
                        style: AppTextStyles.bodySmall()),
                  ],
                ),
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: const CircleAvatar(
                          foregroundImage: AssetImage(AppUrls.photoPng),
                        ),
                      ),
                      Positioned(
                        bottom: 1,
                        right: 1,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 4.r,
                        ),
                      ),
                    ],
                  ),
                  Gap(8.w),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.greyColor.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30.r),
                          bottomRight: Radius.circular(30.r),
                          topLeft: Radius.circular(30.r),
                        )),
                    margin: EdgeInsets.only(top: 10.h, right: 10.w, left: 10.w),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        message.messageType == MessageType.image
                            ? Container(
                                height: 200.h,
                                width: 200.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16.r),
                                  image: DecorationImage(
                                    image: NetworkImage(message.content),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            : Text(message.content,
                                style: AppTextStyles.bodyMedium()),
                        Gap(6.h),
                        Text(timeago.format(message.sentTime),
                            style: AppTextStyles.bodySmall()),
                      ],
                    ),
                  ),
                ],
              ),
      );
}
