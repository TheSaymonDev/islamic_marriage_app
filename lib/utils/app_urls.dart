import 'package:islamic_marriage/services/shared_preference_service.dart';

class AppUrls{
  static const _imgPath = 'assets/images';
  static const _vectorPath = 'assets/vectors';

  static const appLogoPng = '$_imgPath/app_logo.png';
  static const demoPng = '$_imgPath/demo_img.png';
  static const photoPng = '$_imgPath/photo.png';
  static const demoProductPng = '$_imgPath/p_item.png';
  static const demoCategoryPng = '$_imgPath/c_item.png';
  static const demoPanjabiPng = '$_imgPath/panjabi.png';

  static const filterSvg = '$_vectorPath/filter.svg';
  static const doneSvg = '$_vectorPath/done.svg';
  static const bkashSvg = '$_vectorPath/bkash.svg';
  static const rocketSvg = '$_vectorPath/rocket.svg';
  static const nagadSvg = '$_vectorPath/nagad.svg';
  static const masterCardSvg = '$_vectorPath/master_card.svg';
  static const kingSvg = '$_vectorPath/king.svg';
  static const likeSvg = '$_vectorPath/like.svg';
  static const celebrationSvg = '$_vectorPath/celebration.svg';

  static const hadith =
      'এবং যারা প্রার্থনা করে, "হে আমাদের পালনকর্তা! আমাদেরকে এমন স্ত্রী ও সন্তান দান করুন যারা আমাদের চোখের প্রশান্তি হবে এবং আমাদেরকে সৎকর্মশীলদের নেতৃত্ব দেওয়ার জন্য দান করুন।" আল-ফুরকান : ৭৪';

  static const _baseUrl = "https://api.islamicmarriage.net/api/v1";
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
  static const signInUrl = '$_baseUrl/auth/login';
  static const signUpUrl = '$_baseUrl/users/register';
  static const identityUrl = '$_baseUrl/auth/forget-password';
  static const otpVerificationUrl = '$_baseUrl/auth/verify-otp';
  static const setPasswordUrl = '$_baseUrl/auth/forget-password-verify-otp';
  static const resendOTPUrl = '$_baseUrl/auth/send-otp';
  // for create bio data
  static const createGeneralInfoUrl = '$_baseUrl/biodata/personal-info/create';
  static const createAddressUrl = '$_baseUrl/biodata/address/create';
  static const createEduQualificationUrl = '$_baseUrl/biodata/education/create';
  static const createFamilyInfoUrl = '$_baseUrl/biodata/family-info/create';
  static const createPersonalInfoUrl = '$_baseUrl/biodata/lifestyle/create';
  static const createOccupationalInfoUrl = '$_baseUrl/biodata/occupation/create';
  static const createMarriageInfoUrl = '$_baseUrl/biodata/marriage-info/create';
  static const createExpectedLifePartnerInfoUrl = '$_baseUrl/biodata/expected-partner/create';
  static const createPledgeUrl = '$_baseUrl/biodata/pledge/create';
  static const createContactUrl = '$_baseUrl/biodata/contact/create';
  // for update bio data
  static const updateGeneralInfoUrl = '$_baseUrl/biodata/personal-info/update';
  static const updateAddressUrl = '$_baseUrl/biodata/address/update';
  static const updateEduQualificationUrl = '$_baseUrl/biodata/education/update';
  static const updateFamilyInfoUrl = '$_baseUrl/biodata/family-info/update';
  static const updatePersonalInfoUrl = '$_baseUrl/biodata/lifestyle/update';
  static const updateOccupationalInfoUrl = '$_baseUrl/biodata/occupation/update';
  static const updateMarriageInfoUrl = '$_baseUrl/biodata/marriage-info/update';
  static const updateExpectedLifePartnerUrl = '$_baseUrl/biodata/expected-partner/update';
  static const updatePledgeUrl = '$_baseUrl/biodata/pledge/update';
  static const updateContactUrl = '$_baseUrl/biodata/contact/update';
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
  static const readAllBioDataUrl = '$_baseUrl/biodata/all?offset=0&limit=10';
}