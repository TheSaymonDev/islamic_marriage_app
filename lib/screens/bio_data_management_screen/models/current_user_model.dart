class CurrentUserModel {
  int? status;
  bool? success;
  Data? data;

  CurrentUserModel({this.status, this.success, this.data});

  CurrentUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? password;
  String? gender;
  String? otp;
  String? passwordResetOtp;
  bool? passwordResetOtpVerified;
  bool? otpVerified;
  Biodata? biodata;
  String? role;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.name,
        this.phone,
        this.email,
        this.password,
        this.gender,
        this.otp,
        this.passwordResetOtp,
        this.passwordResetOtpVerified,
        this.otpVerified,
        this.biodata,
        this.role,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
    otp = json['otp'];
    passwordResetOtp = json['password_reset_otp'];
    passwordResetOtpVerified = json['password_reset_otp_verified'];
    otpVerified = json['otp_verified'];
    biodata =
    json['biodata'] != null ? new Biodata.fromJson(json['biodata']) : null;
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['otp'] = this.otp;
    data['password_reset_otp'] = this.passwordResetOtp;
    data['password_reset_otp_verified'] = this.passwordResetOtpVerified;
    data['otp_verified'] = this.otpVerified;
    if (this.biodata != null) {
      data['biodata'] = this.biodata!.toJson();
    }
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Biodata {
  int? id;
  GeneralInfo? generalInfo;
  OccupationInfo? occupationInfo;
  String? grewUp;
  PermanentAddress? permanentAddress;
  CurrentAddress? currentAddress;
  EducationInfo? educationInfo;
  PersonalInfo? personalInfo;
  FamilyInfo? familyInfo;
  MarriageInfo? marriageInfo;
  ExpectedLifePartnerInfo? expectedLifePartnerInfo;
  ContactInfo? contactInfo;
  PledgeInfo? pledgeInfo;
  String? status;
  String? createdAt;
  String? updatedAt;

  Biodata(
      {this.id,
        this.generalInfo,
        this.occupationInfo,
        this.grewUp,
        this.permanentAddress,
        this.currentAddress,
        this.educationInfo,
        this.personalInfo,
        this.familyInfo,
        this.marriageInfo,
        this.expectedLifePartnerInfo,
        this.contactInfo,
        this.pledgeInfo,
        this.status,
        this.createdAt,
        this.updatedAt});

  Biodata.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    generalInfo = json['generalInfo'] != null
        ? new GeneralInfo.fromJson(json['generalInfo'])
        : null;
    occupationInfo = json['occupationInfo'] != null
        ? new OccupationInfo.fromJson(json['occupationInfo'])
        : null;
    grewUp = json['grewUp'];
    permanentAddress = json['permanentAddress'] != null
        ? new PermanentAddress.fromJson(json['permanentAddress'])
        : null;
    currentAddress = json['currentAddress'] != null
        ? new CurrentAddress.fromJson(json['currentAddress'])
        : null;
    educationInfo = json['educationInfo'] != null
        ? new EducationInfo.fromJson(json['educationInfo'])
        : null;
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
    familyInfo = json['familyInfo'] != null
        ? new FamilyInfo.fromJson(json['familyInfo'])
        : null;
    marriageInfo = json['marriageInfo'] != null
        ? new MarriageInfo.fromJson(json['marriageInfo'])
        : null;
    expectedLifePartnerInfo = json['expectedLifePartnerInfo'] != null
        ? new ExpectedLifePartnerInfo.fromJson(json['expectedLifePartnerInfo'])
        : null;
    contactInfo = json['contactInfo'] != null
        ? new ContactInfo.fromJson(json['contactInfo'])
        : null;
    pledgeInfo = json['pledgeInfo'] != null
        ? new PledgeInfo.fromJson(json['pledgeInfo'])
        : null;
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.generalInfo != null) {
      data['generalInfo'] = this.generalInfo!.toJson();
    }
    if (this.occupationInfo != null) {
      data['occupationInfo'] = this.occupationInfo!.toJson();
    }
    data['grewUp'] = this.grewUp;
    if (this.permanentAddress != null) {
      data['permanentAddress'] = this.permanentAddress!.toJson();
    }
    if (this.currentAddress != null) {
      data['currentAddress'] = this.currentAddress!.toJson();
    }
    if (this.educationInfo != null) {
      data['educationInfo'] = this.educationInfo!.toJson();
    }
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo!.toJson();
    }
    if (this.familyInfo != null) {
      data['familyInfo'] = this.familyInfo!.toJson();
    }
    if (this.marriageInfo != null) {
      data['marriageInfo'] = this.marriageInfo!.toJson();
    }
    if (this.expectedLifePartnerInfo != null) {
      data['expectedLifePartnerInfo'] = this.expectedLifePartnerInfo!.toJson();
    }
    if (this.contactInfo != null) {
      data['contactInfo'] = this.contactInfo!.toJson();
    }
    if (this.pledgeInfo != null) {
      data['pledgeInfo'] = this.pledgeInfo!.toJson();
    }
    data['status'] = this.status;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class GeneralInfo {
  int? id;
  String? bioDataType;
  String? maritialStatus;
  String? dateOfBirth;
  String? height;
  String? weight;
  String? complexion;
  String? bloodGroup;
  String? nationality;

  GeneralInfo(
      {this.id,
        this.bioDataType,
        this.maritialStatus,
        this.dateOfBirth,
        this.height,
        this.weight,
        this.complexion,
        this.bloodGroup,
        this.nationality});

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bioDataType = json['bioDataType'];
    maritialStatus = json['maritialStatus'];
    dateOfBirth = json['dateOfBirth'];
    height = json['height'];
    weight = json['weight'];
    complexion = json['complexion'];
    bloodGroup = json['bloodGroup'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['bioDataType'] = this.bioDataType;
    data['maritialStatus'] = this.maritialStatus;
    data['dateOfBirth'] = this.dateOfBirth;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['complexion'] = this.complexion;
    data['bloodGroup'] = this.bloodGroup;
    data['nationality'] = this.nationality;
    return data;
  }
}

class OccupationInfo {
  int? id;
  String? occupation;
  String? descriptionOfProfession;
  String? monthlyIncome;

  OccupationInfo(
      {this.id,
        this.occupation,
        this.descriptionOfProfession,
        this.monthlyIncome});

  OccupationInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    occupation = json['occupation'];
    descriptionOfProfession = json['descriptionOfProfession'];
    monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['occupation'] = this.occupation;
    data['descriptionOfProfession'] = this.descriptionOfProfession;
    data['monthlyIncome'] = this.monthlyIncome;
    return data;
  }
}

class PermanentAddress {
  int? id;
  String? division;
  String? district;
  String? subDistrict;

  PermanentAddress({this.id, this.division, this.district, this.subDistrict});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    division = json['division'];
    district = json['district'];
    subDistrict = json['subDistrict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    return data;
  }
}

class CurrentAddress {
  int? id;
  String? currentDivision;
  String? currentDistrict;
  String? currentSubDistrict;

  CurrentAddress({this.id, this.currentDivision, this.currentDistrict, this.currentSubDistrict});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentDivision = json['currentDivision'];
    currentDistrict = json['currentDistrict'];
    currentSubDistrict = json['currentSubDistrict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['currentDivision'] = this.currentDivision;
    data['currentDistrict'] = this.currentDistrict;
    data['currentSubDistrict'] = this.currentSubDistrict;
    return data;
  }
}

class EducationInfo {
  int? id;
  String? educationMethod;
  String? highestEducation;
  String? passingYear;
  String? result;
  String? institutionName;
  String? otherEducation;
  String? religiousEducation;

  EducationInfo(
      {this.id,
        this.educationMethod,
        this.highestEducation,
        this.passingYear,
        this.result,
        this.institutionName,
        this.otherEducation,
        this.religiousEducation});

  EducationInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    educationMethod = json['educationMethod'];
    highestEducation = json['highestEducation'];
    passingYear = json['passingYear'];
    result = json['result'];
    institutionName = json['institutionName'];
    otherEducation = json['otherEducation'];
    religiousEducation = json['religiousEducation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['educationMethod'] = this.educationMethod;
    data['highestEducation'] = this.highestEducation;
    data['passingYear'] = this.passingYear;
    data['result'] = this.result;
    data['institutionName'] = this.institutionName;
    data['otherEducation'] = this.otherEducation;
    data['religiousEducation'] = this.religiousEducation;
    return data;
  }
}

class PersonalInfo {
  int? id;
  String? clothingOutside;
  String? sunnahBeardSince;
  bool? clothesAboveAnkles;
  String? fiveTimesPrayerSince;
  String? prayerMissDaily;
  String? complyNonMahram;
  String? reciteQuranCorrectly;
  String? followedFiqah;
  String? watchIslamicDramaSong;
  String? mentalPhysicalDiseases;
  String? involvedSpecialDeenWork;
  String? believeAboutMazar;
  String? islamicReadedBookName;
  String? islamicFollowedScholarName;
  String? hobbiesLikeDislike;
  String? groomPhone;
  String? groomSelfieUrl;

  PersonalInfo(
      {this.id,
        this.clothingOutside,
        this.sunnahBeardSince,
        this.clothesAboveAnkles,
        this.fiveTimesPrayerSince,
        this.prayerMissDaily,
        this.complyNonMahram,
        this.reciteQuranCorrectly,
        this.followedFiqah,
        this.watchIslamicDramaSong,
        this.mentalPhysicalDiseases,
        this.involvedSpecialDeenWork,
        this.believeAboutMazar,
        this.islamicReadedBookName,
        this.islamicFollowedScholarName,
        this.hobbiesLikeDislike,
        this.groomPhone,
        this.groomSelfieUrl});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clothingOutside = json['clothingOutside'];
    sunnahBeardSince = json['sunnahBeardSince'];
    clothesAboveAnkles = json['clothesAboveAnkles'];
    fiveTimesPrayerSince = json['fiveTimesPrayerSince'];
    prayerMissDaily = json['prayerMissDaily'];
    complyNonMahram = json['complyNonMahram'];
    reciteQuranCorrectly = json['reciteQuranCorrectly'];
    followedFiqah = json['followedFiqah'];
    watchIslamicDramaSong = json['watchIslamicDramaSong'];
    mentalPhysicalDiseases = json['mentalPhysicalDiseases'];
    involvedSpecialDeenWork = json['involvedSpecialDeenWork'];
    believeAboutMazar = json['believeAboutMazar'];
    islamicReadedBookName = json['islamicReadedBookName'];
    islamicFollowedScholarName = json['islamicFollowedScholarName'];
    hobbiesLikeDislike = json['hobbiesLikeDislike'];
    groomPhone = json['groomPhone'];
    groomSelfieUrl = json['groomSelfieUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clothingOutside'] = this.clothingOutside;
    data['sunnahBeardSince'] = this.sunnahBeardSince;
    data['clothesAboveAnkles'] = this.clothesAboveAnkles;
    data['fiveTimesPrayerSince'] = this.fiveTimesPrayerSince;
    data['prayerMissDaily'] = this.prayerMissDaily;
    data['complyNonMahram'] = this.complyNonMahram;
    data['reciteQuranCorrectly'] = this.reciteQuranCorrectly;
    data['followedFiqah'] = this.followedFiqah;
    data['watchIslamicDramaSong'] = this.watchIslamicDramaSong;
    data['mentalPhysicalDiseases'] = this.mentalPhysicalDiseases;
    data['involvedSpecialDeenWork'] = this.involvedSpecialDeenWork;
    data['believeAboutMazar'] = this.believeAboutMazar;
    data['islamicReadedBookName'] = this.islamicReadedBookName;
    data['islamicFollowedScholarName'] = this.islamicFollowedScholarName;
    data['hobbiesLikeDislike'] = this.hobbiesLikeDislike;
    data['groomPhone'] = this.groomPhone;
    data['groomSelfieUrl'] = this.groomSelfieUrl;
    return data;
  }
}

class FamilyInfo {
  int? id;
  String? fatherName;
  String? fatherAlive;
  String? fatherOccupation;
  String? motherName;
  String? motherAlive;
  String? motherOccupation;
  String? brotherCount;
  String? brothersInfo;
  String? sisterCount;
  String? sistersInfo;
  String? uncleAuntOccuption;
  String? familyStatus;
  String? familyRelagiousEnvironment;

  FamilyInfo(
      {this.id,
        this.fatherName,
        this.fatherAlive,
        this.fatherOccupation,
        this.motherName,
        this.motherAlive,
        this.motherOccupation,
        this.brotherCount,
        this.brothersInfo,
        this.sisterCount,
        this.sistersInfo,
        this.uncleAuntOccuption,
        this.familyStatus,
        this.familyRelagiousEnvironment});

  FamilyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fatherName = json['fatherName'];
    fatherAlive = json['fatherAlive'];
    fatherOccupation = json['fatherOccupation'];
    motherName = json['motherName'];
    motherAlive = json['motherAlive'];
    motherOccupation = json['motherOccupation'];
    brotherCount = json['brotherCount'];
    brothersInfo = json['brothersInfo'];
    sisterCount = json['sisterCount'];
    sistersInfo = json['sistersInfo'];
    uncleAuntOccuption = json['uncleAuntOccuption'];
    familyStatus = json['familyStatus'];
    familyRelagiousEnvironment = json['familyRelagiousEnvironment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fatherName'] = this.fatherName;
    data['fatherAlive'] = this.fatherAlive;
    data['fatherOccupation'] = this.fatherOccupation;
    data['motherName'] = this.motherName;
    data['motherAlive'] = this.motherAlive;
    data['motherOccupation'] = this.motherOccupation;
    data['brotherCount'] = this.brotherCount;
    data['brothersInfo'] = this.brothersInfo;
    data['sisterCount'] = this.sisterCount;
    data['sistersInfo'] = this.sistersInfo;
    data['uncleAuntOccuption'] = this.uncleAuntOccuption;
    data['familyStatus'] = this.familyStatus;
    data['familyRelagiousEnvironment'] = this.familyRelagiousEnvironment;
    return data;
  }
}

class MarriageInfo {
  int? id;
  String? guardianAgree;
  String? wifeInVeil;
  String? studyAfterMarriage;
  String? jobAfterMarriage;
  String? livingPlaceAfterMarriage;
  String? expectGiftFromBrideFamily;
  String? thoughtAboutMarriage;

  MarriageInfo(
      {this.id,
        this.guardianAgree,
        this.wifeInVeil,
        this.studyAfterMarriage,
        this.jobAfterMarriage,
        this.livingPlaceAfterMarriage,
        this.expectGiftFromBrideFamily,
        this.thoughtAboutMarriage});

  MarriageInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guardianAgree = json['guardianAgree'];
    wifeInVeil = json['wifeInVeil'];
    studyAfterMarriage = json['studyAfterMarriage'];
    jobAfterMarriage = json['jobAfterMarriage'];
    livingPlaceAfterMarriage = json['livingPlaceAfterMarriage'];
    expectGiftFromBrideFamily = json['expectGiftFromBrideFamily'];
    thoughtAboutMarriage = json['thoughtAboutMarriage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['guardianAgree'] = this.guardianAgree;
    data['wifeInVeil'] = this.wifeInVeil;
    data['studyAfterMarriage'] = this.studyAfterMarriage;
    data['jobAfterMarriage'] = this.jobAfterMarriage;
    data['livingPlaceAfterMarriage'] = this.livingPlaceAfterMarriage;
    data['expectGiftFromBrideFamily'] = this.expectGiftFromBrideFamily;
    data['thoughtAboutMarriage'] = this.thoughtAboutMarriage;
    return data;
  }
}

class ExpectedLifePartnerInfo {
  int? id;
  int? expectedMinAge;
  int? expectedMaxAge;
  String? expectedComplexion;
  String? expectedHeight;
  String? exptectedEducation;
  String? exptectedDistrict;
  String? expectedMaritialStatus;
  String? expectedProfession;
  String? expectedFinancialCondition;
  String? expectedAttributes;

  ExpectedLifePartnerInfo(
      {this.id,
        this.expectedMinAge,
        this.expectedMaxAge,
        this.expectedComplexion,
        this.expectedHeight,
        this.exptectedEducation,
        this.exptectedDistrict,
        this.expectedMaritialStatus,
        this.expectedProfession,
        this.expectedFinancialCondition,
        this.expectedAttributes});

  ExpectedLifePartnerInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    expectedMinAge = json['expectedMinAge'];
    expectedMaxAge = json['expectedMaxAge'];
    expectedComplexion = json['expectedComplexion'];
    expectedHeight = json['expectedHeight'];
    exptectedEducation = json['exptectedEducation'];
    exptectedDistrict = json['exptectedDistrict'];
    expectedMaritialStatus = json['expectedMaritialStatus'];
    expectedProfession = json['expectedProfession'];
    expectedFinancialCondition = json['expectedFinancialCondition'];
    expectedAttributes = json['expectedAttributes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['expectedMinAge'] = this.expectedMinAge;
    data['expectedMaxAge'] = this.expectedMaxAge;
    data['expectedComplexion'] = this.expectedComplexion;
    data['expectedHeight'] = this.expectedHeight;
    data['exptectedEducation'] = this.exptectedEducation;
    data['exptectedDistrict'] = this.exptectedDistrict;
    data['expectedMaritialStatus'] = this.expectedMaritialStatus;
    data['expectedProfession'] = this.expectedProfession;
    data['expectedFinancialCondition'] = this.expectedFinancialCondition;
    data['expectedAttributes'] = this.expectedAttributes;
    return data;
  }
}

class ContactInfo {
  int? id;
  String? groomName;
  String? guardianMobile;
  String? relationShipWithGuardian;
  String? email;

  ContactInfo(
      {this.id,
        this.groomName,
        this.guardianMobile,
        this.relationShipWithGuardian,
        this.email});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groomName = json['groomName'];
    guardianMobile = json['guardianMobile'];
    relationShipWithGuardian = json['relationShipWithGuardian'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['groomName'] = this.groomName;
    data['guardianMobile'] = this.guardianMobile;
    data['relationShipWithGuardian'] = this.relationShipWithGuardian;
    data['email'] = this.email;
    return data;
  }
}

class PledgeInfo {
  int? id;
  String? parentalAwareness;
  String? informationTruth;
  String? agreement;

  PledgeInfo(
      {this.id, this.parentalAwareness, this.informationTruth, this.agreement});

  PledgeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentalAwareness = json['parentalAwareness'];
    informationTruth = json['informationTruth'];
    agreement = json['agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parentalAwareness'] = this.parentalAwareness;
    data['informationTruth'] = this.informationTruth;
    data['agreement'] = this.agreement;
    return data;
  }
}
