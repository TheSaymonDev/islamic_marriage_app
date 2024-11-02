import 'package:islamic_marriage/services/shared_preference_service.dart';

class AppUrls{
  static const _imgPath = 'assets/images';
  static const _vectorPath = 'assets/vectors';
  static const _lottiePath = 'assets/lotties';

  static const appLogoPng = '$_imgPath/logo.png';
  static const companyLogoPng = '$_imgPath/company_logo.png';
  static const demoPng = '$_imgPath/demo_img.png';
  static const photoPng = '$_imgPath/photo.png';
  static const demoProductPng = '$_imgPath/p_item.png';
  static const demoCategoryPng = '$_imgPath/c_item.png';
  static const demoPanjabiPng = '$_imgPath/panjabi.png';
  static const lockPng = '$_imgPath/lock.png';
  static const placeHolderPng = '$_imgPath/placeholder.png';

  static const filterSvg = '$_vectorPath/filter.svg';
  static const doneSvg = '$_vectorPath/done.svg';
  static const bkashSvg = '$_vectorPath/bkash.svg';
  static const rocketSvg = '$_vectorPath/rocket.svg';
  static const nagadSvg = '$_vectorPath/nagad.svg';
  static const masterCardSvg = '$_vectorPath/master_card.svg';
  static const kingSvg = '$_vectorPath/king.svg';
  static const likeSvg = '$_vectorPath/like.svg';
  static const celebrationSvg = '$_vectorPath/celebration.svg';

  static const searchJson = '$_lottiePath/search_json.json';
  static const cashOnDeliveryJson = '$_lottiePath/cash_on_delivery.json';
  static const emptyCartJson = '$_lottiePath/empty_cart.json';

  static const baseUrl = "https://api.islamicmarriage.net/api/v1";
  static const Map<String, String> requestHeader = {"Content-Type": "application/json"};

  static Map<String, String> get getHeaderWithToken{
    String token = SharedPreferencesService().getToken();
    return  {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }

  static const takaSign = '৳';
  static const loremData = "Lorem ipsum dolor sit amet consectetur.Magna ut egestas id elementum id euphasellus a turpis. Diam risus arcu id";
  static const longDes = "Lorem ipsum dolor sit amet consectetur.Magna ut egestas id elementum id euphasellus a turpis. Diam risus arcu id";
  static const shortDes = "Lorem ipsum dolor sit amet consectetur";

  // for auth
  static const signInUrl = '$baseUrl/users/login';
  static const signUpUrl = '$baseUrl/users/signup';
  static const identityUrl = '$baseUrl/users/forget-password';
  static const otpVerificationUrl = '$baseUrl/users/verify-otp';
  static const forgetOtpVerificationUrl = '$baseUrl/users/forget-password/otp-verify';
  static const setPasswordUrl = '$baseUrl/users/reset-password';
  static const resendOTPUrl = '$baseUrl/users/resend-otp';
  static const changePasswordUrl = '$baseUrl/users/me/update-password';
  static const profileUpdateUrl = '$baseUrl/users/me';
  // for create bio data
  static const upsertBioDataUrl = '$baseUrl/biodata';
  static const upsertAddressInfoUrl = '$baseUrl/addressInfo/upsertAddressInfo';
  static const upsertEduQualificationsUrl = '$baseUrl/educationInfo/upsertEducationInfo';
  static const upsertFamilyInfoUrl = '$baseUrl/familyInfo/upsertFamilyInfo';
  static const upsertPersonalInfoUrl = '$baseUrl/personalInfo/upsertPersonalInfo';
  static const upsertOccupationalInfoUrl = '$baseUrl/occupationInfo/upsertOccupationInfo';
  static const upsertMarriageInfoUrl = '$baseUrl/marriageInfo/upsertMarriageInfo';
  static const upsertExpectedLifePartnerInfoUrl = '$baseUrl/expectedPartnerInfo/upsertExpectedPartnerInfo';
  static const upsertPledgeUrl = '$baseUrl/pledgeInfo/upsertPledgeInfo';
  static const upsertContactUrl = '$baseUrl/contactInfo/upsertContactInfo';

  static const getAllUser = '$baseUrl/biodata';
  static const getCurrentUser = '$baseUrl/users/me';
  static const addRemoveToFavouriteListUrl = '$baseUrl/users/favourite';


  static const readUserBioDataUrl = '$baseUrl/biodata/single';
  static const readAllSearchedBioDataUrl = '$baseUrl/users/searched-biodata';

  static const submitBioDataUrl = '$baseUrl/biodata/submit';
}