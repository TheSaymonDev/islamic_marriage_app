import 'package:get/get.dart';
import 'package:islamic_marriage/screens/create_bio_data_screen/model/all_divisions.dart';
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

  /// Get the permanent address as a concatenated string
  String get permanentAddress {
    if (selectedDivision != null &&
        selectedDistrict != null &&
        selectedSubDistrict != null) {
      return '$selectedSubDistrict, $selectedDistrict, $selectedDivision';
    } else {
      return ''; // Or a default value indicating incomplete address
    }
  }

  /// Fetch all bio data
  Future<void> readAllBioData({bool isLoadMore = false}) async {
    _setLoadingState(true);
    try {
      final response = await ApiService().get(
        url: '${AppUrls.readAllBioDataUrl}?offset=$offset&limit=$limit',
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        _handleBioDataSuccess(response.data, isLoadMore);
      } else {
        _handleError(response.message['message'] ?? 'All Bio Data Read Failed');
      }
    } catch (error) {
      _handleError(error.toString());
    } finally {
      _setLoadingState(false);
    }
  }

  /// Fetch all searched bio data based on filters
  Future<void> readAllSearchedBioData({bool isLoadMore = false}) async {
    _setLoadingState(true);
    String url = _buildSearchUrl();

    try {
      final response = await ApiService().get(
        url: url,
        headers: AppUrls.getHeaderWithToken,
      );

      if (response.success) {
        _handleBioDataSuccess(response.data, isLoadMore);
      } else {
        _handleError(response.message['message'] ?? 'All Bio Data Read Failed');
      }
    } catch (error) {
      _handleError(error.toString());
    } finally {
      _setLoadingState(false);
    }
  }

  /// Clear the bio data and reset the filters
  void clearBioData() {
    bioData.clear();
    selectedBioDataType = null;
    selectedMaritalStatus = null;
    selectedDivision = null;
    selectedDistrict = null;
    selectedSubDistrict = null;
    offset = 0;
    hasMore = true;
    update();
  }

  /// Set loading state and update UI
  void _setLoadingState(bool state) {
    isLoading = state;
    update();
  }

  /// Handle successful bio data response
  void _handleBioDataSuccess(Map<String, dynamic> data, bool isLoadMore) {
    countBioData = data['data']['count'];
    List<BioData> newBioData = (data['data']['biodata'] as List)
        .map((e) => BioData.fromJson(e))
        .toList();

    if (isLoadMore) {
      bioData.addAll(newBioData);
    } else {
      bioData = newBioData;
    }

    offset += limit;
    if (countBioData == bioData.length) {
      hasMore = false;
    }
  }

  /// Handle error and show message
  void _handleError(String errorMessage) {
    customErrorMessage(message: errorMessage);
    isLoading = false;
    update();
  }

  /// Build the search URL with selected filters
  String _buildSearchUrl() {
    String url =
        '${AppUrls.readAllSearchedBioDataUrl}?offset=$offset&limit=$limit';
    if (selectedBioDataType != null) {
      url += '&biodataType=${selectedBioDataType}';
    }
    if (selectedMaritalStatus != null) {
      url += '&maritalStatus=${selectedMaritalStatus}';
    }
    if (permanentAddress.isNotEmpty) {
      url += '&permanentAddress=${permanentAddress}';
    }
    return url;
  }
}
