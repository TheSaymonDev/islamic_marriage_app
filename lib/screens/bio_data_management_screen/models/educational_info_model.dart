class EducationalInfoModel {
  EducationInfo? educationInfo;

  EducationalInfoModel({this.educationInfo});

  EducationalInfoModel.fromJson(Map<String, dynamic> json) {
    educationInfo = json['educationInfo'] != null
        ? new EducationInfo.fromJson(json['educationInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.educationInfo != null) {
      data['educationInfo'] = this.educationInfo!.toJson();
    }
    return data;
  }
}

class EducationInfo {
  int? id;
  String? educationMethod;
  String? othersEducationMethod;
  String? highestEducation;
  String? othersHighestEducation;
  String? passingYear;
  String? result;
  String? institutionName;
  String? otherEducation;
  String? religiousEducation;

  EducationInfo(
      {this.id,
        this.educationMethod,
        this.othersEducationMethod,
        this.highestEducation,
        this.othersHighestEducation,
        this.passingYear,
        this.result,
        this.institutionName,
        this.otherEducation,
        this.religiousEducation});

  EducationInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    educationMethod = json['educationMethod'];
    othersEducationMethod = json['othersEducationMethod'];
    highestEducation = json['highestEducation'];
    othersHighestEducation = json['othersHighestEducation'];
    passingYear = json['passingYear'];
    result = json['result'];
    institutionName = json['institutionName'];
    otherEducation = json['otherEducation'];
    religiousEducation = json['religiousEducation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['educationMethod'] = this.educationMethod;
    data['othersEducationMethod'] = this.othersEducationMethod;
    data['highestEducation'] = this.highestEducation;
    data['othersHighestEducation'] = this.othersHighestEducation;
    data['passingYear'] = this.passingYear;
    data['result'] = this.result;
    data['institutionName'] = this.institutionName;
    data['otherEducation'] = this.otherEducation;
    data['religiousEducation'] = this.religiousEducation;
    return data;
  }
}
