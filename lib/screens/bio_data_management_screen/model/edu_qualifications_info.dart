class EduQualificationsInfo {
  String? educationMethod;
  String? highestEducation;
  String? passingYear;
  String? result;
  String? institutionName;
  String? otherEducation;
  String? religiousEducation;

  EduQualificationsInfo(
      {this.educationMethod,
        this.highestEducation,
        this.passingYear,
        this.result,
        this.institutionName,
        this.otherEducation,
        this.religiousEducation});

  EduQualificationsInfo.fromJson(Map<String, dynamic> json) {
    educationMethod = json['educationMethod'];
    highestEducation = json['highestEducation'];
    passingYear = json['passingYear'];
    result = json['result'];
    institutionName = json['institutionName'];
    otherEducation = json['otherEducation'];
    religiousEducation = json['religiousEducation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['educationMethod'] = this.educationMethod;
    data['highestEducation'] = this.highestEducation;
    data['passingYear'] = this.passingYear;
    data['result'] = this.result;
    data['institutionName'] = this.institutionName;
    data['otherEducation'] = this.otherEducation;
    data['religiousEducation'] = this.religiousEducation;
    return data;
  }
}
