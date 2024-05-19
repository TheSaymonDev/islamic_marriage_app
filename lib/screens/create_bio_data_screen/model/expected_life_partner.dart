class ExpectedLifePartner {
  int? id;
  List<int>? ageRange;
  List<String>? complexion;
  String? height;
  String? educationalQualification;
  String? district;
  List<String>? maritalStatus;
  String? profession;
  String? financialCondition;
  String? expectedQuality;

  ExpectedLifePartner({
    this.id,
    this.ageRange,
    this.complexion,
    this.height,
    this.educationalQualification,
    this.district,
    this.maritalStatus,
    this.profession,
    this.financialCondition,
    this.expectedQuality,
  });

  ExpectedLifePartner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ageRange = json['ageRange'].cast<int>();
    complexion = json['complexion'].cast<String>();
    height = json['height'];
    educationalQualification = json['educationalQualification'];
    district = json['district'];
    maritalStatus = json['MaritalStatus'].cast<String>();
    profession = json['profession'];
    financialCondition = json['financialCondition'];
    expectedQuality = json['expectedQuality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ageRange'] = ageRange;
    data['complexion'] = complexion;
    data['height'] = height;
    data['educationalQualification'] = educationalQualification;
    data['district'] = district;
    data['MaritalStatus'] = maritalStatus;
    data['profession'] = profession;
    data['financialCondition'] = financialCondition;
    data['expectedQuality'] = expectedQuality;
    return data;
  }
}
