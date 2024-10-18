class Pledge {
  String? parentalAwareness;
  String? informationTruth;
  String? agreement;

  Pledge({this.parentalAwareness, this.informationTruth, this.agreement});

  Pledge.fromJson(Map<String, dynamic> json) {
    parentalAwareness = json['parentalAwareness'];
    informationTruth = json['informationTruth'];
    agreement = json['agreement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parentalAwareness'] = this.parentalAwareness;
    data['informationTruth'] = this.informationTruth;
    data['agreement'] = this.agreement;
    return data;
  }
}
