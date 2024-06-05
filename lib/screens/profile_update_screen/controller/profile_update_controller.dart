import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/sign_up_screen/model/gender.dart';

class ProfileUpdateController extends GetxController{

  int currentGender = 0;

  List<Gender> gender = [
    Gender(title: 'Male', value: 'male'),
    Gender(title: 'Female', value: 'female')
  ];

  void selectGender(int index) {
    currentGender = index;
    update();
  }

  File? imageFile;
  Future<void> getImageFromGallery() async {
    final pickedImage =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
    update();
  }
}