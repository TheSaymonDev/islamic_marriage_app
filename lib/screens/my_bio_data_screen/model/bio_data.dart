

import 'package:islamic_marriage/screens/bio_data_management_screen/model/address.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/contact.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/edu_qualifications.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/expected_life_partner.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/family_info.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/general_info.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/marriage_info.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/occupational_info.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/personal_life_info.dart';
import 'package:islamic_marriage/screens/bio_data_management_screen/model/pledge.dart';



class BioData {
  String? id;
  String? fullName;
  String? email;
  String? gender;
  String? mobileNumber;
  String? role;
  bool? isApproved;
  int? visitedBiodata;
  int? hasBeenSortListed;
  List<String>? sortListed;
  List<String>? ignoreList;
  List<String>? purchased;
  int? connection;
  bool? isSubmitToVerify;
  GeneralInfo? personalInformation;
  Address? address;
  EduQualifications? education;
  FamilyInfo? familyInformation;
  PersonalLifeInfo? lifeStyleInformation;
  OccupationalInfo? occupation;
  MarriageRelatedInfo? marriageInfo;
  ExpectedLifePartner? partner;
  Pledge? pledge;
  Contact? contact;

  BioData(
      {this.id,
        this.fullName,
        this.email,
        this.gender,
        this.mobileNumber,
        this.role,
        this.isApproved,
        this.visitedBiodata,
        this.hasBeenSortListed,
        this.sortListed,
        this.ignoreList,
        this.purchased,
        this.connection,
        this.isSubmitToVerify,
        this.address,
        this.personalInformation,
        this.education,
        this.familyInformation,
        this.lifeStyleInformation,
        this.marriageInfo,
        this.occupation,
        this.partner,
        this.pledge,
        this.contact});

  BioData.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String?;
    fullName = json['fullName'] as String?;
    email = json['email'] as String?;
    gender = json['gender'] as String?;
    mobileNumber = json['mobileNumber'] as String?;
    role = json['role'] as String?;
    isApproved = json['isApproved'] as bool?;
    visitedBiodata = json['visitedBiodata'] as int?;
    hasBeenSortListed = json['hasBeenSortListed'] as int?;

    // Handle list properties with null-safety and type casting
    sortListed = (json['sortListed'] as List<dynamic>?)?.cast<String>();
    ignoreList = (json['ignoreList'] as List<dynamic>?)?.cast<String>();
    purchased = (json['purchased'] as List<dynamic>?)?.cast<String>();

    connection = json['connection'] as int?;
    isSubmitToVerify = json['isSubmitToVerify'] as bool?;

    address = json['Address'] != null ? Address.fromJson(json['Address']) : null;
    personalInformation = json['PersonalInformation'] != null
        ? GeneralInfo.fromJson(json['PersonalInformation'])
        : null;
    education = json['Education'] != null ? EduQualifications.fromJson(json['Education']) : null;
    familyInformation = json['FamilyInformation'] != null
        ? FamilyInfo.fromJson(json['FamilyInformation'])
        : null;
    lifeStyleInformation = json['LifeStyleInformation'] != null
        ? PersonalLifeInfo.fromJson(json['LifeStyleInformation'])
        : null;
    marriageInfo = json['MarriageInfo'] != null
        ? MarriageRelatedInfo.fromJson(json['MarriageInfo'])
        : null;
    occupation = json['Occupation'] != null ? OccupationalInfo.fromJson(json['Occupation']) : null;
    partner = json['Partner'] != null ? ExpectedLifePartner.fromJson(json['Partner']) : null;
    pledge = json['Pledge'] != null ? Pledge.fromJson(json['Pledge']) : null;
    contact = json['Contact'] != null ? Contact.fromJson(json['Contact']) : null;
  }
}

