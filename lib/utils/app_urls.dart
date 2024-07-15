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

  static const _baseUrl = "https://server.api.islamicmarriage.net/api/v1";
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
  static const signInUrl = '$_baseUrl/users/login';
  static const signUpUrl = '$_baseUrl/users/signup';
  static const identityUrl = '$_baseUrl/users/forget-password';
  static const otpVerificationUrl = '$_baseUrl/users/verify-otp';
  static const forgetOtpVerificationUrl = '$_baseUrl/users/forget-password/otp-verify';
  static const setPasswordUrl = '$_baseUrl/users/reset-password';
  static const resendOTPUrl = '$_baseUrl/users/resend-otp';
  static const changePasswordUrl = '$_baseUrl/auth/changePassword';
  static const profileUpdateUrl = '$_baseUrl/user/update';
  // for create bio data
  static const upsertBioDataUrl = '$_baseUrl/biodata';
  static const upsertAddressInfoUrl = '$_baseUrl/addressInfo/upsertAddressInfo';
  static const upsertEduQualificationsUrl = '$_baseUrl/educationInfo/upsertEducationInfo';
  static const upsertFamilyInfoUrl = '$_baseUrl/familyInfo/upsertFamilyInfo';
  static const upsertPersonalInfoUrl = '$_baseUrl/personalInfo/upsertPersonalInfo';
  static const upsertOccupationalInfoUrl = '$_baseUrl/occupationInfo/upsertOccupationInfo';
  static const upsertMarriageInfoUrl = '$_baseUrl/marriageInfo/upsertMarriageInfo';
  static const upsertExpectedLifePartnerInfoUrl = '$_baseUrl/expectedPartnerInfo/upsertExpectedPartnerInfo';
  static const upsertPledgeUrl = '$_baseUrl/pledgeInfo/upsertPledgeInfo';
  static const upsertContactUrl = '$_baseUrl/contactInfo/upsertContactInfo';

  static const getAllUser = '$_baseUrl/biodata';
  static const getCurrentUser = '$_baseUrl/users/me';

  // for read bio data
  static const readGeneralInfoUrl = '$_baseUrl/biodata/personal-info/fetch/1';
  static const readAddressUrl = '$_baseUrl/biodata/address/fetch/1';
  static const readEduQualificationUrl = '$_baseUrl/biodata/education/fetch/1';
  static const readFamilyInfoUrl = '$_baseUrl/biodata/family-info/fetch/1';
  static const readPersonalInfoUrl = '$_baseUrl/biodata/lifestyle/fetch/1';
  static const readOccupationalInfoUrl = '$_baseUrl/biodata/occupation/fetch/1';
  static const readMarriageInfoUrl = '$_baseUrl/biodata/marriage-info/fetch/1';
  static const readExpectedLifePartnerInfoUrl = '$_baseUrl/biodata/expected-partner/fetch/1';
  static const readPledgeUrl = '$_baseUrl/biodata/pledge/fetch/1';
  static const readContactUrl = '$_baseUrl/biodata/contact/fetch/1';

  static const readUserBioDataUrl = '$_baseUrl/biodata/single';
  static const readAllBioDataUrl = '$_baseUrl/biodata/all';
  static const readAllSearchedBioDataUrl = '$_baseUrl/users/searched-biodata';

  static const submitBioDataUrl = '$_baseUrl/users/verify-biodata';
}