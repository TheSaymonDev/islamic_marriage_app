import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/test_data.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/model/bio_data.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/widgets/styles.dart';

class AllBioDataController extends GetxController {
  bool isLoading = false;
  bool hasMore = true;
  List<BioData> bioData = [];
  int offset = 0;
  final int limit = 5;
  int? countBioData;

  String? selectedBioDataType;
  String? selectedMaritalStatus;

  Division? selectedDivision;
  District? selectedDistrict;
  SubDistrict? selectedSubDistrict;

  String get permanentAddress {
    if (selectedDivision != null &&
        selectedDistrict != null &&
        selectedSubDistrict != null) {
      return '$selectedSubDistrict, $selectedDistrict, $selectedDivision';
    } else {
      return ''; // Or a default value indicating incomplete address
    }
  }

  Future<void> readAllBioData({bool isLoadMore = false}) async {
    if (isLoading) return;
    isLoading = true;
    update();
    try {
      final response = await ApiService().get(
        url: '${AppUrls.readAllBioDataUrl}?offset=$offset&limit=$limit',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        countBioData = response.data['data']['count'];
        List<dynamic> data = response.data['data']['biodata'];
        List<BioData> newBioData =
            data.map((e) => BioData.fromJson(e)).toList();
        if (isLoadMore) {
          bioData.addAll(newBioData);
        } else {
          bioData = newBioData;
        }
        offset += limit;
        if (countBioData == bioData.length) {
          hasMore = false;
        }
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'All Bio Data Read Failed';
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

  Future<void> readAllSearchedBioData({bool isLoadMore = false}) async {
    if (isLoading) return;
    isLoading = true;
    update();
    String url =
        '${AppUrls.readAllSearchedBioDataUrl}?offset=$offset&limit=$limit';
    if (selectedBioDataType != null) {
      url += '&bioDataType=${selectedBioDataType}';
    }

    if (selectedMaritalStatus != null) {
      url += '&maritalStatus=${selectedMaritalStatus}';
    }

    if (permanentAddress.isNotEmpty) {
      url += '&permanentAddress=${permanentAddress}';
    }

    try {
      final response = await ApiService().get(
        url: url,
        headers: AppUrls.getHeaderWithToken,
      );
      if (response.success) {
        countBioData = response.data['data']['count'];
        List<dynamic> data = response.data['data']['biodata'];
        List<BioData> newBioData =
            data.map((e) => BioData.fromJson(e)).toList();
        if (isLoadMore) {
          bioData.addAll(newBioData);
        } else {
          bioData = newBioData;
        }
        offset += limit;
        if (countBioData == bioData.length) {
          hasMore = false;
        }
        isLoading = false;
        update();
      } else {
        final errorMessage =
            response.message['message'] ?? 'All Bio Data Read Failed';
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

  void clearBioData() {
    bioData.clear();
    selectedBioDataType = null;
    selectedMaritalStatus = null;
    selectedDivision = null;
    selectedDistrict = null;
    selectedSubDistrict = null;
    offset = 0; // Reset offset to 0 after clearing data
    hasMore = true; // Reset hasMore flag to true for fresh data retrieval
    update();
  }
}
