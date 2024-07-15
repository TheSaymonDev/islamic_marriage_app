class GeneralInfo {
  String? bioDataType;
  String? maritialStatus;
  String? height;
  String? weight;
  String? dateOfBirth;
  String? complexion;
  String? bloodGroup;
  String? nationality;

  GeneralInfo(
      {this.bioDataType,
        this.maritialStatus,
        this.height,
        this.weight,
        this.dateOfBirth,
        this.complexion,
        this.bloodGroup,
        this.nationality});

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    bioDataType = json['bioDataType'];
    maritialStatus = json['maritialStatus'];
    height = json['height'];
    weight = json['weight'];
    dateOfBirth = json['dateOfBirth'];
    complexion = json['complexion'];
    bloodGroup = json['bloodGroup'];
    nationality = json['nationality'];
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
    return data;
  }
}
