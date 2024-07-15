class MarriageRelatedInfo {
  String? guardianAgree;
  String? wifeInVeil;
  String? studyAfterMarriage;
  String? jobAfterMarriage;
  String? livingPlaceAfterMarriage;
  String? expectGiftFromBrideFamily;
  String? thoughtAboutMarriage;

  MarriageRelatedInfo(
      {this.guardianAgree,
        this.wifeInVeil,
        this.studyAfterMarriage,
        this.jobAfterMarriage,
        this.livingPlaceAfterMarriage,
        this.expectGiftFromBrideFamily,
        this.thoughtAboutMarriage});

  MarriageRelatedInfo.fromJson(Map<String, dynamic> json) {
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
