class GeneralInfo {
  int? id;
  String? typeOfBiodata;
  String? maritalStatus;
  String? dateOfBirth;
  String? height;
  String? complexion;
  String? weight;
  String? bloodGroup;
  String? nationality;

  GeneralInfo({
    this.id,
    this.typeOfBiodata,
    this.maritalStatus,
    this.dateOfBirth,
    this.height,
    this.complexion,
    this.weight,
    this.bloodGroup,
    this.nationality,
  });

  GeneralInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    typeOfBiodata = json['typeOfBiodata'];
    maritalStatus = json['maritalStatus'];
    dateOfBirth = json['dateOfBirth'];
    height = json['height'];
    complexion = json['complexion'];
    weight = json['weight'];
    bloodGroup = json['bloodGroup'];
    nationality = json['nationality'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['typeOfBiodata'] = typeOfBiodata;
    data['maritalStatus'] = maritalStatus;
    data['dateOfBirth'] = dateOfBirth;
    data['height'] = height;
    data['complexion'] = complexion;
    data['weight'] = weight;
    data['bloodGroup'] = bloodGroup;
    data['nationality'] = nationality;
    return data;
  }
}
