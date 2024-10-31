class GeneralInfoModel {
  GeneralInfo? generalInfo;

  GeneralInfoModel({this.generalInfo});

  GeneralInfoModel.fromJson(Map<String, dynamic> json) {
    generalInfo = json['generalInfo'] != null
        ? new GeneralInfo.fromJson(json['generalInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.generalInfo != null) {
      data['generalInfo'] = this.generalInfo!.toJson();
    }
    return data;
  }
}

class GeneralInfo {
  String? id;
  String? bioDataType;
  String? maritialStatus;
  String? height;
  String? weight;
  String? dateOfBirth;
  String? complexion;
  String? bloodGroup;
  String? nationality;
  String? othersNationality;

  GeneralInfo(
      {this.id,
        this.bioDataType,
        this.maritialStatus,
        this.height,
        this.weight,
        this.dateOfBirth,
        this.complexion,
        this.bloodGroup,
        this.nationality,
        this.othersNationality});

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bioDataType = json['bioDataType'];
    maritialStatus = json['maritialStatus'];
    height = json['height'];
    weight = json['weight'];
    dateOfBirth = json['dateOfBirth'];
    complexion = json['complexion'];
    bloodGroup = json['bloodGroup'];
    nationality = json['nationality'];
    othersNationality = json['othersNationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bioDataType'] = this.bioDataType;
    data['maritialStatus'] = this.maritialStatus;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['dateOfBirth'] = this.dateOfBirth;
    data['complexion'] = this.complexion;
    data['bloodGroup'] = this.bloodGroup;
    data['nationality'] = this.nationality;
    data['othersNationality'] = this.othersNationality;
    return data;
  }
}
