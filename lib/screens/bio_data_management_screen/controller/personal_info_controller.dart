// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
// import 'package:islamic_marriage/screens/bio_data_management_screen/model/personal_life_info.dart';
// import 'package:islamic_marriage/services/api_service.dart';
// import 'package:islamic_marriage/utils/app_urls.dart';
// import 'package:islamic_marriage/utils/app_constant_functions.dart';
//
// class PersonalInfoController extends GetxController {
//   bool isLoading = false;
//
//   final formKey = GlobalKey<FormState>();
//   final clothesController = TextEditingController();
//   final beardController = TextEditingController();
//   final aboveTheAnklesController = TextEditingController();
//   final prayController = TextEditingController();
//   final qazaController = TextEditingController();
//   final mahramController = TextEditingController();
//   final reciteQuranController = TextEditingController();
//   DropdownItem? selectedFiqh;
//   final watchOrListenController = TextEditingController();
//   final diseaseController = TextEditingController();
//   final specialWorkController = TextEditingController();
//   final mazarController = TextEditingController();
//   final islamicBooksController = TextEditingController();
//   final islamicScholarsController = TextEditingController();
//   final hobbiesController = TextEditingController();
//   final mobileController = TextEditingController();
//   String? imageUrl;
//
//   File? imageFile;
//   Future<void> getImageFromCamera() async {
//     final pickedImage = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedImage != null) {
//       imageFile = File(pickedImage.path);
//     }
//     update();
//   }
//
//   Future<bool> upsertPersonalInfo() async {
//     isLoading = true;
//     update();
//     try {
//       final personalInfo = PersonalLifeInfo(
//         clothingOutside: clothesController.text,
//         sunnahBeardSince: beardController.text,
//         clothesAboveAnkles: aboveTheAnklesController.text,
//         fiveTimesPrayerSince: prayController.text,
//         prayerMissDaily: int.parse(qazaController.text),
//         complyNonMahram: mahramController.text,
//         reciteQuranCorrectly: reciteQuranController.text,
//         followedFiqr: selectedFiqh!.value,
//         watchIslamicDramaSong: watchOrListenController.text,
//         mentalPhysicalDiseases: diseaseController.text,
//         involvedSpecialDeenWork: specialWorkController.text,
//         believeAboutMazar: mazarController.text,
//         islamicReadedBookName: [islamicBooksController.text],
//         islamicFollowedScholarName: [islamicScholarsController.text],
//         hobbiesLikeDislike: hobbiesController.text,
//         groomPhone: mobileController.text,
//       );
//
//       if (imageFile != null) {
//         final response = await ApiService().postMultipart(
//           url: AppUrls.upsertPersonalInfoUrl,
//           data: personalInfo.toJson(), // Convert to Map
//           file: imageFile!,
//           headers: AppUrls.getHeaderWithToken,
//         );
//         if (response.success) {
//           customSuccessMessage(message: 'Personal Info Created Successfully');
//           isLoading = false;
//           update();
//           return true;
//         } else {
//           final errorMessage = response.message['message'] ?? 'Personal Info Create Failed';
//           customErrorMessage(message: errorMessage);
//           isLoading = false;
//           update();
//           return false;
//         }
//       } else {
//         customErrorMessage(message: 'Please take a image');
//         isLoading = false;
//         update();
//         return false;
//       }
//     } catch (error) {
//       customErrorMessage(message: error.toString());
//       isLoading = false;
//       update();
//       return false;
//     }
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/dropdown_item.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/personal_life_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/services/connectivity_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class PersonalInfoController extends GetxController {
  bool isLoading = false;

  final formKey = GlobalKey<FormState>();
  final clothesController = TextEditingController();
  final beardController = TextEditingController();
  final aboveTheAnklesController = TextEditingController();
  final prayController = TextEditingController();
  final qazaController = TextEditingController();
  final mahramController = TextEditingController();
  final reciteQuranController = TextEditingController();
  DropdownItem? selectedFiqh;
  final watchOrListenController = TextEditingController();
  final diseaseController = TextEditingController();
  final specialWorkController = TextEditingController();
  final mazarController = TextEditingController();
  final islamicBooksController = TextEditingController();
  final islamicScholarsController = TextEditingController();
  final hobbiesController = TextEditingController();
  final mobileController = TextEditingController();
  String? imageUrl;

  File? imageFile;
  Future<void> getImageFromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      imageFile = File(pickedImage.path);
    }
    update();
  }

  Future<bool> upsertPersonalInfo() async {
    if (!await ConnectivityService.isConnected()) {
      customErrorMessage(message: 'Please check your internet connection');
      return false;
    }
    isLoading = true;
    update();
    try {
      final personalInfo = PersonalLifeInfo(
        clothingOutside: clothesController.text,
        sunnahBeardSince: beardController.text,
        clothesAboveAnkles: aboveTheAnklesController.text,
        fiveTimesPrayerSince: prayController.text,
        prayerMissDaily: qazaController.text,
        complyNonMahram: mahramController.text,
        reciteQuranCorrectly: reciteQuranController.text,
        followedFiqah: selectedFiqh!.value,
        watchIslamicDramaSong: watchOrListenController.text,
        mentalPhysicalDiseases: diseaseController.text,
        involvedSpecialDeenWork: specialWorkController.text,
        believeAboutMazar: mazarController.text,
        islamicReadedBookName: islamicBooksController.text,
        islamicFollowedScholarName: islamicScholarsController.text,
        hobbiesLikeDislike: hobbiesController.text,
        groomPhone: mobileController.text,
      );
      final response = await ApiService().patch(
        url: AppUrls.upsertBioDataUrl,
        data: personalInfo,
        headers: AppUrls.getHeaderWithToken
      );
      if (response.success) {
        customSuccessMessage(message: 'Personal Info Created Successfully');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Personal Info Create Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
        return false;
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }
}
