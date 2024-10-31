class MarriageInfoModel {
  MarriageInfo? marriageInfo;

  MarriageInfoModel({this.marriageInfo});

  MarriageInfoModel.fromJson(Map<String, dynamic> json) {
    marriageInfo = json['marriageInfo'] != null
        ? new MarriageInfo.fromJson(json['marriageInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.marriageInfo != null) {
      data['marriageInfo'] = this.marriageInfo!.toJson();
    }
    return data;
  }
}

class MarriageInfo {
  int? id;
  String? guardianAgree;
  String? wifeInVeil;
  String? studyAfterMarriage;
  String? jobAfterMarriage;
  String? jobFemale;
  String? studyFemale;
  String? livingPlaceAfterMarriage;
  String? expectGiftFromBrideFamily;
  String? thoughtAboutMarriage;

  MarriageInfo(
      {this.id,
        this.guardianAgree,
        this.wifeInVeil,
        this.studyAfterMarriage,
        this.jobAfterMarriage,
        this.jobFemale,
        this.studyFemale,
        this.livingPlaceAfterMarriage,
        this.expectGiftFromBrideFamily,
        this.thoughtAboutMarriage});

  MarriageInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guardianAgree = json['guardianAgree'];
    wifeInVeil = json['wifeInVeil'];
    studyAfterMarriage = json['studyAfterMarriage'];
    jobAfterMarriage = json['jobAfterMarriage'];
    jobFemale = json['jobFemale'];
    studyFemale = json['studyFemale'];
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
    data['jobFemale'] = this.jobFemale;
    data['studyFemale'] = this.studyFemale;
    data['livingPlaceAfterMarriage'] = this.livingPlaceAfterMarriage;
    data['expectGiftFromBrideFamily'] = this.expectGiftFromBrideFamily;
    data['thoughtAboutMarriage'] = this.thoughtAboutMarriage;
    return data;
  }
}
