class OccupationalInfo {
  int? id;
  String? occupation;
  String? description;
  String? monthlyIncome;

  OccupationalInfo({
    this.id,
    this.occupation,
    this.description,
    this.monthlyIncome,
  });

  OccupationalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    occupation = json['occupation'];
    description = json['description'];
    monthlyIncome = json['monthlyIncome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['occupation'] = occupation;
    data['description'] = description;
    data['monthlyIncome'] = monthlyIncome;
    return data;
  }
}
