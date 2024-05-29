import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/widgets/common_widgets/custom_appbar/appbar_textview_with_back.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(onPressedBack: (){
        Get.back();
      }, title: 'Message',),
          body: Container(color: Colors.cyan,),
    );
  }
}
