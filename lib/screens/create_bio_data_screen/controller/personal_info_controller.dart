import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/personal_life_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class PersonalInfoController extends GetxController {
  bool isLoading = false;

  PersonalLifeInfo? personalLifeInfo;

  final formKey = GlobalKey<FormState>();
  final clothesController = TextEditingController();
  final beardController = TextEditingController();
  final aboveTheAnklesController = TextEditingController();
  final prayController = TextEditingController();
  final qazaController = TextEditingController();
  final mahramController = TextEditingController();
  final reciteQuranController = TextEditingController();
  String? selectedFiqh;
  final watchOrListenController = TextEditingController();
  final diseaseController = TextEditingController();
  final specialWorkController = TextEditingController();
  final mazarController = TextEditingController();
  final islamicBooksController = TextEditingController();
  final islamicScholarsController = TextEditingController();
  String? selectedSpecial;
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

  Future<bool> createPersonalInfo() async {
    isLoading = true;
    update();
    try {
      final personalInfo = {
        'clothesInfo': clothesController.text,
        'breadInfo': beardController.text,
        'clothesAnkles': aboveTheAnklesController.text,
        'prayInfo': prayController.text,
        'qazaInfo': qazaController.text,
        'marhamInfo': mahramController.text,
        'reciteTheQuran': reciteQuranController.text,
        'fiqh': selectedFiqh,
        'moviesOrSongs': watchOrListenController.text,
        'physicalDiseases': diseaseController.text,
        'workOfDeen': specialWorkController.text,
        'mazarInfo': mazarController.text,
        'books': islamicBooksController.text,
        'islamicScholars': islamicScholarsController.text,
        'applicable': selectedSpecial,
        'hobbies': hobbiesController.text,
        'groomMobileNumber': mobileController.text
      };
     if(imageFile != null){
       final response = await ApiService().postMultipart(
           url: AppUrls.createPersonalInfoUrl,
           data: personalInfo,
           file: imageFile!,
           headers: AppUrls.getHeaderWithToken);
       if (response.success) {
         customSuccessMessage(message: 'Personal Info Created Successful');
         Get.find<MyBioDataController>().readMyBioData();
         isLoading = false;
         update();
         return true;
       } else {
         final errorMessage = response.message['message'] ?? 'Personal Info Create Failed';
         customErrorMessage(message: errorMessage);
         isLoading = false;
         update();
         return false;
       }
     }else{
       customErrorMessage(message: 'Please take a image');
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

  Future<void> readPersonalInfo() async {
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
          url: AppUrls.readPersonalInfoUrl,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
       personalLifeInfo = PersonalLifeInfo.fromJson(response.data['data']);
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'Personal Info Read Failed';
        customErrorMessage(message: errorMessage);
        isLoading = false;
        update();
      }
    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
    }
  }

  Future<bool> updatePersonalInfo() async {
    isLoading = true;
    update();
    try {
      final personalInfo = {
        'clothesInfo': clothesController.text,
        'breadInfo': beardController.text,
        'clothesAnkles': aboveTheAnklesController.text,
        'prayInfo': prayController.text,
        'qazaInfo': qazaController.text,
        'marhamInfo': mahramController.text,
        'reciteTheQuran': reciteQuranController.text,
        'fiqh': selectedFiqh,
        'moviesOrSongs': watchOrListenController.text,
        'physicalDiseases': diseaseController.text,
        'workOfDeen': specialWorkController.text,
        'mazarInfo': mazarController.text,
        'books': islamicBooksController.text,
        'islamicScholars': islamicScholarsController.text,
        'applicable': selectedSpecial,
        'hobbies': hobbiesController.text,
        'groomMobileNumber': mobileController.text
      };

      final response = await ApiService().putMultipart(
        url: AppUrls.updatePersonalInfoUrl,
        data: personalInfo,
        file: imageFile,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        customSuccessMessage(message: 'Personal Info Updated Successfully');
        Get.find<MyBioDataController>().readMyBioData();
      } else {
        final errorMessage = response.message['message'] ?? 'Personal Info Update Failed';
        customErrorMessage(message: errorMessage);
      }

      isLoading = false;
      update();
      return response.success;

    } catch (error) {
      customErrorMessage(message: error.toString());
      isLoading = false;
      update();
      return false;
    }
  }

}
