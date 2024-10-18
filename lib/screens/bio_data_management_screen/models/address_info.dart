class PermanentAddress {
  String? division;
  String? district;
  String? subDistrict;

  PermanentAddress({this.division, this.district, this.subDistrict});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    division = json['division'];
    district = json['district'];
    subDistrict = json['subDistrict'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    return data;
  }
}
