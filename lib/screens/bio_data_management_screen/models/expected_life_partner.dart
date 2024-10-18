class ExpectedLifePartner {
  int? expectedMinAge;
  int? expectedMaxAge;
  String? expectedHeight;
  String? expectedComplexion;
  String? exptectedEducation;
  String? exptectedDistrict;
  String? expectedMaritialStatus;
  String? expectedProfession;
  String? expectedFinancialCondition;
  String? expectedAttributes;

  ExpectedLifePartner(
      {this.expectedMinAge,
        this.expectedMaxAge,
        this.expectedHeight,
        this.expectedComplexion,
        this.exptectedEducation,
        this.exptectedDistrict,
        this.expectedMaritialStatus,
        this.expectedProfession,
        this.expectedFinancialCondition,
        this.expectedAttributes});

  ExpectedLifePartner.fromJson(Map<String, dynamic> json) {
    expectedMinAge = json['expectedMinAge'];
    expectedMaxAge = json['expectedMaxAge'];
    expectedHeight = json['expectedHeight'];
    expectedComplexion = json['expectedComplexion'];
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
    data['expectedHeight'] = this.expectedHeight;
    data['expectedComplexion'] = this.expectedComplexion;
    data['exptectedEducation'] = this.exptectedEducation;
    data['exptectedDistrict'] = this.exptectedDistrict;
    data['expectedMaritialStatus'] = this.expectedMaritialStatus;
    data['expectedProfession'] = this.expectedProfession;
    data['expectedFinancialCondition'] = this.expectedFinancialCondition;
    data['expectedAttributes'] = this.expectedAttributes;
    return data;
  }
}
