class OccupationalInfo {
  String? occupation;
  String? descriptionOfProfession;
  String? monthlyIncome;

  OccupationalInfo(
      {this.occupation, this.descriptionOfProfession, this.monthlyIncome});

  OccupationalInfo.fromJson(Map<String, dynamic> json) {
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
