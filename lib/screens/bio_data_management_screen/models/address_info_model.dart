class Biodata {
  final PermanentAddress permanentAddress;
  final CurrentAddress currentAddress;
  final String? grewUp;

  Biodata({
    required this.permanentAddress,
    required this.currentAddress,
    this.grewUp,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['permanentAddress'] = this.permanentAddress.toJson();
    data['currentAddress'] = this.currentAddress.toJson();
    data['grewUp'] = this.grewUp;
    return data;
  }
}


class PermanentAddress {
  final String? division;
  final String? district;
  final String? subDistrict;

  PermanentAddress({this.division, this.district, this.subDistrict});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    return data;
  }
}

class CurrentAddress {
  final String? currentDivision;
  final String? currentDistrict;
  final String? currentSubDistrict;

  CurrentAddress({this.currentDivision, this.currentDistrict, this.currentSubDistrict});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['currentDivision'] = this.currentDivision;
    data['currentDistrict'] = this.currentDistrict;
    data['currentSubDistrict'] = this.currentSubDistrict;
    return data;
  }
}
