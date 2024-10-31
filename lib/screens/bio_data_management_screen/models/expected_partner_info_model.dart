class ExpectedPartnerInfoModel {
  ExpectedLifePartnerInfo? expectedLifePartnerInfo;

  ExpectedPartnerInfoModel({this.expectedLifePartnerInfo});

  ExpectedPartnerInfoModel.fromJson(Map<String, dynamic> json) {
    expectedLifePartnerInfo = json['expectedLifePartnerInfo'] != null
        ? new ExpectedLifePartnerInfo.fromJson(json['expectedLifePartnerInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.expectedLifePartnerInfo != null) {
      data['expectedLifePartnerInfo'] = this.expectedLifePartnerInfo!.toJson();
    }
    return data;
  }
}

class ExpectedLifePartnerInfo {
  int? id;
  String? expectedMinAge;
  String? expectedMaxAge;
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
