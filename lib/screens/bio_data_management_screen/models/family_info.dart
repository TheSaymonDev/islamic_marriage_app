class FamilyInfo {
  String? fatherName;
  String? fatherAlive;
  String? fatherOccupation;
  String? motherName;
  String? motherAlive;
  String? motherOccupation;
  String? brotherCount;
  String? sisterCount;
  String? brothersInfo;
  String? sistersInfo;
  String? uncleAuntOccuption;
  String? familyStatus;
  String? familyRelagiousEnvironment;

  FamilyInfo(
      {this.fatherName,
        this.fatherAlive,
        this.fatherOccupation,
        this.motherName,
        this.motherAlive,
        this.motherOccupation,
        this.brotherCount,
        this.sisterCount,
        this.brothersInfo,
        this.sistersInfo,
        this.uncleAuntOccuption,
        this.familyStatus,
        this.familyRelagiousEnvironment});

  FamilyInfo.fromJson(Map<String, dynamic> json) {
    fatherName = json['fatherName'];
    fatherAlive = json['fatherAlive'];
    fatherOccupation = json['fatherOccupation'];
    motherName = json['motherName'];
    motherAlive = json['motherAlive'];
    motherOccupation = json['motherOccupation'];
    brotherCount = json['brotherCount'];
    sisterCount = json['sisterCount'];
    brothersInfo = json['brothersInfo'];
    sistersInfo = json['sistersInfo'];
    uncleAuntOccuption = json['uncleAuntOccupation'];
    familyStatus = json['familyStatus'];
    familyRelagiousEnvironment = json['familyRelagiousEnvironment'];
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
    data['sisterCount'] = this.sisterCount;
    data['brothersInfo'] = this.brothersInfo;
    data['sistersInfo'] = this.sistersInfo;
    data['uncleAuntOccuption'] = this.uncleAuntOccuption;
    data['familyStatus'] = this.familyStatus;
    data['familyRelagiousEnvironment'] = this.familyRelagiousEnvironment;
    return data;
  }
}
