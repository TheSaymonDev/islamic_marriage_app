import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/message_screen/models/message.dart';
import 'package:islamic_marriage/screens/message_screen/widgets/message_bubble.dart';
import 'package:islamic_marriage/utils/app_colors.dart';
import 'package:islamic_marriage/utils/app_text_styles.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/custom_back_icon.dart';
import 'package:islamic_marriage/widgets/custom_text_form_field.dart';

class MessageScreen extends StatelessWidget {
  MessageScreen({super.key});

  final _messageController = TextEditingController();

  final messages = [
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content: 'Hello',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'How are you?',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content: 'Fine',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.text),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'What are you doing?',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content: 'Nothing',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.text),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'Can you help me?',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content:
            'https://images.unsplash.com/photo-1669992755631-3c46eccbeb7d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMHx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.image),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'Thank you',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text),
    Message(
      senderId: '2',
      receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
      content: 'You are welcome',
      sentTime: DateTime.now(),
      isMe: true,
      messageType: MessageType.text,
    ),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'Bye',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content: 'Bye',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text),
    Message(
        senderId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        receiverId: '2',
        content: 'See you later',
        sentTime: DateTime.now(),
        isMe: false,
        messageType: MessageType.text),
    Message(
        senderId: '2',
        receiverId: 'gNfEHSQZ5ZUcY6JG5AarK8O0SVw1',
        content: 'See you later',
        sentTime: DateTime.now(),
        isMe: true,
        messageType: MessageType.text)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        padding: EdgeInsets.only(bottom: 16.h, left: 16.w, right: 16.w),
        height: double.infinity.h,
        width: double.infinity.w,
        child: Column(
          children: [
            _buildMessageList(),
            _buildChatTextField(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      toolbarHeight: 70.h,
      leading: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        child: CustomBackButton(onPressed: () {
          Get.back();
        }),
      ),
      title: Row(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 50.h,
                width: 50.w,
                child: const CircleAvatar(
                  foregroundImage: AssetImage(AppUrls.placeHolderPng),
                ),
              ),
              Positioned(
                bottom: 3,
                right: 3,
                child: CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 5.r,
                ),
              ),
            ],
          ),
          Gap(16.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Saymon Islam',
                style: AppTextStyles.titleMedium(),
              ),
              Gap(4.h),
              Text(
                'Online',
                style: AppTextStyles.bodySmall(color: AppColors.greyColor),
              )
            ],
          )
        ],
      ),
    );
  }

  Row _buildChatTextField() {
    return Row(
      children: [
        Expanded(
          child: CustomTextFormField(
              hintText: 'Type your message', controller: _messageController),
        ),
        Gap(8.w),
        CircleAvatar(
          backgroundColor: AppColors.purpleClr,
          radius: 25.r,
          child: IconButton(
            icon: Icon(Icons.send, size: 25.sp, color: Colors.white),
            onPressed: () {},
          ),
        ),
        Gap(8.w),
        CircleAvatar(
          backgroundColor: AppColors.purpleClr,
          radius: 25.r,
          child: IconButton(
            icon:
                Icon(Icons.camera_alt, size: 25.sp, color: AppColors.whiteClr),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildMessageList() {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) =>
            MessageBubble(message: messages[index]),
        itemCount: messages.length,
      ),
    );
  }
}
