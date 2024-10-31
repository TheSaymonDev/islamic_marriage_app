class OccupationalInfoModel {
  OccupationInfo? occupationInfo;

  OccupationalInfoModel({this.occupationInfo});

  OccupationalInfoModel.fromJson(Map<String, dynamic> json) {
    occupationInfo = json['occupationInfo'] != null
        ? new OccupationInfo.fromJson(json['occupationInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.occupationInfo != null) {
      data['occupationInfo'] = this.occupationInfo!.toJson();
    }
    return data;
  }
}

class OccupationInfo {
  int? id;
  String? occupation;
  String? descriptionOfProfession;
  String? monthlyIncome;

  OccupationInfo(
      {this.id,
        this.occupation,
        this.descriptionOfProfession,
        this.monthlyIncome});

  OccupationInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    occupation = json['occupation'];
    descriptionOfProfession = json['descriptionOfProfession'];
    monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['occupation'] = this.occupation;
    data['descriptionOfProfession'] = this.descriptionOfProfession;
    data['monthlyIncome'] = this.monthlyIncome;
    return data;
  }
}
