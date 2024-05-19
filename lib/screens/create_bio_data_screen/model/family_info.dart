class FamilyInfo {
  int? id;
  String? fatherName;
  String? isFatherAlive;
  String? fatherOccupation;
  String? motherName;
  String? isMotherAlive;
  String? motherOccupation;
  String? brothersCount;
  String? brotherInformation;
  String? sistersCount;
  String? sisterInformation;
  String? occupationOfUnclesAndAunts;
  String? familyIncome;
  String? familyReligionEnvironment;

  FamilyInfo({
    this.id,
    this.fatherName,
    this.isFatherAlive,
    this.fatherOccupation,
    this.motherName,
    this.isMotherAlive,
    this.motherOccupation,
    this.brothersCount,
    this.brotherInformation,
    this.sistersCount,
    this.sisterInformation,
    this.occupationOfUnclesAndAunts,
    this.familyIncome,
    this.familyReligionEnvironment,
  });

  FamilyInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fatherName = json['fatherName'];
    isFatherAlive = json['isFatherAlive'];
    fatherOccupation = json['fatherOccupation'];
    motherName = json['motherName'];
    isMotherAlive = json['isMotherAlive'];
    motherOccupation = json['motherOccupation'];
    brothersCount = json['brothersCount'];
    brotherInformation = json['brotherInformation'];
    sistersCount = json['sistersCount'];
    sisterInformation = json['sisterInformation'];
    occupationOfUnclesAndAunts = json['occupationOfUnclesAndAunts'];
    familyIncome = json['familyIncome'];
    familyReligionEnvironment = json['familyReligionEnvironment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fatherName'] = fatherName;
    data['isFatherAlive'] = isFatherAlive;
    data['fatherOccupation'] = fatherOccupation;
    data['motherName'] = motherName;
    data['isMotherAlive'] = isMotherAlive;
    data['motherOccupation'] = motherOccupation;
    data['brothersCount'] = brothersCount;
    data['brotherInformation'] = brotherInformation;
    data['sistersCount'] = sistersCount;
    data['sisterInformation'] = sisterInformation;
    data['occupationOfUnclesAndAunts'] = occupationOfUnclesAndAunts;
    data['familyIncome'] = familyIncome;
    data['familyReligionEnvironment'] = familyReligionEnvironment;
    return data;
  }
}
