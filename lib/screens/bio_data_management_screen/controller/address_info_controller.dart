// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:islamic_marriage/screens/bio_data_management_screen/model/address_info.dart';
// import 'package:islamic_marriage/screens/bio_data_management_screen/model/all_divisions.dart';
// import 'package:islamic_marriage/services/api_service.dart';
// import 'package:islamic_marriage/utils/app_urls.dart';
// import 'package:islamic_marriage/utils/app_constant_functions.dart';
//
// class AddressInfoController extends GetxController {
//   bool isLoading = false;
//   // Address? address;
//   final formKey = GlobalKey<FormState>();
//
//   Division? selectedDivision;
//   District? selectedDistrict;
//   SubDistrict? selectedSubDistrict;
//
//   Division? selectedDivision1;
//   District? selectedDistrict1;
//   SubDistrict? selectedSubDistrict1;
//
//   // final permanentAreaController = TextEditingController();
//   // final presentAreaController = TextEditingController();
//   final growUpController = TextEditingController();
//   bool isSameAsPermanent = false;
//   // String get permanentAddress {
//   //   if (selectedDivision != null &&
//   //       selectedDistrict != null &&
//   //       selectedSubDistrict != null) {
//   //     return '$selectedDivision, $selectedDistrict, $selectedSubDistrict';
//   //   } else {
//   //     return ''; // Or a default value indicating incomplete address
//   //   }
//   // }
//   //
//   // String get presentAddress {
//   //   if (selectedDivision1 != null &&
//   //       selectedDistrict1 != null &&
//   //       selectedSubDistrict1 != null) {
//   //     return '$selectedDivision1, $selectedDistrict1, $selectedSubDistrict1';
//   //   } else {
//   //     return ''; // Or a default value indicating incomplete address
//   //   }
//   // }
//
//   Future<bool> upsertAddress() async {
//     isLoading = true;
//     update();
//     try {
//       final permanentAddress = PermanentAddress(
//           division: selectedDivision!.name,
//           district: selectedDistrict!.name,
//           subDistrict: selectedSubDistrict!.name);
//       final currentAddress = isSameAsPermanent
//           ? permanentAddress
//           : CurrentAddress(
//           division: selectedDivision1!.name,
//           district: selectedDistrict1!.name,
//           subDistrict: selectedSubDistrict1!.name);
//       final grewUp = GrewUp(grewUp: growUpController.text);
//       final response = await ApiService().patch(
//           url: AppUrls.upsertBioDataUrl,
//           data: {
//             'permanentAddress': permanentAddress,
//             'currentAddress': currentAddress,
//             'grewUp': grewUp
//           },
//           headers: AppUrls.getHeaderWithToken);
//       if (response.success) {
//         customSuccessMessage(message: 'Address Info Created Successful');
//         isLoading = false;
//         update();
//         return true;
//       } else {
//         final errorMessage =
//             response.message['message'] ?? 'Address Create Failed';
//         customErrorMessage(message: errorMessage);
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/address_info.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class AddressInfoController extends GetxController {
  bool isLoading = false;
  // Address? address;
  final formKey = GlobalKey<FormState>();

  final selectedDivision = TextEditingController();
  final selectedDistrict = TextEditingController();
  final selectedSubDistrict = TextEditingController();

  final selectedDivision1 = TextEditingController();
  final selectedDistrict1 = TextEditingController();
  final selectedSubDistrict1 = TextEditingController();

  final growUpController = TextEditingController();
  bool isSameAsPermanent = false;

  Future<bool> upsertAddress() async {
    isLoading = true;
    update();
    try {
      final address = PermanentAddress(
        division: selectedDivision.text,
        district: selectedSubDistrict.text,
        subDistrict: selectedSubDistrict.text
      );
      final response = await ApiService().patch(
          url: AppUrls.upsertBioDataUrl,
          data: address,
          headers: AppUrls.getHeaderWithToken);
      if (response.success) {
        customSuccessMessage(message: 'Address Info Created Successful');
        Get.find<MyBioDataController>().getCurrentUser();
        isLoading = false;
        update();
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Address Create Failed';
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