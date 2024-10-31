class FamilyInfoModel {
  FamilyInfo? familyInfo;

  FamilyInfoModel({this.familyInfo});

  FamilyInfoModel.fromJson(Map<String, dynamic> json) {
    familyInfo = json['familyInfo'] != null
        ? new FamilyInfo.fromJson(json['familyInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.familyInfo != null) {
      data['familyInfo'] = this.familyInfo!.toJson();
    }
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
  String? familyReligiousEnvironment;

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
        this.familyReligiousEnvironment});

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
    familyReligiousEnvironment = json['familyReligiousEnvironment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['familyReligiousEnvironment'] = this.familyReligiousEnvironment;
    return data;
  }
}
