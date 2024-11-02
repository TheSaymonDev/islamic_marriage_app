import 'package:get/get.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/controllers/current_user_biodata_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SubmitBioDataController extends GetxController {
  bool isLoading = false;
  final _currentUserBioData = Get.find<CurrentUserBioDataController>()
      .currentUserBioData
      ?.data
      ?.biodata;
  int? _bioDataId;

  bool get hasCompleteBioData => _hasCompleteBioData();

  bool _hasCompleteBioData() {
    if (_currentUserBioData == null) return false;

    return [
      _currentUserBioData.generalInfo?.bioDataType,
      _currentUserBioData.permanentAddress?.division,
      _currentUserBioData.educationInfo?.educationMethod,
      _currentUserBioData.familyInfo?.fatherName,
      _currentUserBioData.personalInfo?.clothingOutside,
      _currentUserBioData.marriageInfo?.guardianAgree,
      _currentUserBioData.expectedLifePartnerInfo?.expectedMaritialStatus,
      _currentUserBioData.occupationInfo?.occupation,
      _currentUserBioData.pledgeInfo?.noAuthorityLiability,
      _currentUserBioData.contactInfo?.guardianMobile,
    ].every((field) => field != null);
  }

  Future<bool> submitBioData() async {
    if (!hasCompleteBioData) {
      customErrorMessage(message: 'Please complete all Bio-data form');
      return false;
    }
    _setLoading(true);
    _bioDataId = _currentUserBioData!.id;
    try {
      final response = await ApiService().patchWithOutBody(
        url: '${AppUrls.submitBioDataUrl}/$_bioDataId',
        headers: AppUrls.getHeaderWithToken,
      );
      if (response.success) {
        customSuccessMessage(message: 'Bio-Data Submitted Successfully');
        return true;
      } else {
        final errorMessage =
            response.message['message'] ?? 'Bio-Data Submit Failed';
        customErrorMessage(message: errorMessage);
        return false;
      }
    } catch (error) {
      customErrorMessage(message: 'An error occurred: ${error.toString()}');
      return false;
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    isLoading = value;
    update();
  }
}
