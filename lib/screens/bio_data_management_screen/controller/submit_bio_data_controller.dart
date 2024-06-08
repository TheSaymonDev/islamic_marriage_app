import 'package:get/get.dart';
import 'package:islamic_marriage/screens/my_bio_data_screen/controller/my_bio_data_controller.dart';
import 'package:islamic_marriage/services/api_service.dart';
import 'package:islamic_marriage/utils/app_urls.dart';
import 'package:islamic_marriage/utils/app_constant_functions.dart';

class SubmitBioDataController extends GetxController {
  final MyBioDataController _myBioDataController = Get.find();

  bool get hasCompleteBioData => _hasCompleteBioData();

  bool _hasCompleteBioData() {
    return _myBioDataController.myBioData != null &&
        (_myBioDataController.myBioData!.personalInformation != null ||
            _myBioDataController.myBioData!.address != null ||
            _myBioDataController.myBioData!.education != null ||
            _myBioDataController.myBioData!.familyInformation != null ||
            _myBioDataController.myBioData!.lifeStyleInformation != null ||
            _myBioDataController.myBioData!.occupation != null ||
            _myBioDataController.myBioData!.marriageInfo != null ||
            _myBioDataController.myBioData!.partner != null ||
            _myBioDataController.myBioData!.pledge != null ||
            _myBioDataController.myBioData!.contact != null);
  }

  Future<bool> submitBioData() async {
    if (hasCompleteBioData) {
      try {
        final response = await ApiService().postWithOutData(
            url: AppUrls.submitBioDataUrl, headers: AppUrls.getHeaderWithToken);
        if (response.success) {
          customSuccessMessage(message: 'Bio-Data Submitted Successful');
          update();
          return true;
        } else {
          final errorMessage =
              response.message['message'] ?? 'Bio-Data Submit Failed';
          customErrorMessage(message: errorMessage);
          update();
          return false;
        }
      } catch (error) {
        customErrorMessage(message: 'An error occurred: ${error.toString()}');
        update();
        return false;
      }
    } else {
      customErrorMessage(message: 'Please complete all Bio-data form');
      return false;
    }
  }
}
