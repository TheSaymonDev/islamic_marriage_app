class AddressModel {
  PermanentAddress? permanentAddress;
  CurrentAddress? currentAddress;
  String? grewUp;

  AddressModel({this.permanentAddress, this.currentAddress, this.grewUp});

  AddressModel.fromJson(Map<String, dynamic> json) {
    permanentAddress = json['permanentAddress'] != null
        ? new PermanentAddress.fromJson(json['permanentAddress'])
        : null;
    currentAddress = json['currentAddress'] != null
        ? new CurrentAddress.fromJson(json['currentAddress'])
        : null;
    grewUp = json['grewUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.permanentAddress != null) {
      data['permanentAddress'] = this.permanentAddress!.toJson();
    }
    if (this.currentAddress != null) {
      data['currentAddress'] = this.currentAddress!.toJson();
    }
    data['grewUp'] = this.grewUp;
    return data;
  }
}

class PermanentAddress {
  String? id;
  String? division;
  String? district;
  String? subDistrict;
  String? areaName;

  PermanentAddress(
      {this.id, this.division, this.district, this.subDistrict, this.areaName});

  PermanentAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    division = json['division'];
    district = json['district'];
    subDistrict = json['subDistrict'];
    areaName = json['areaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['division'] = this.division;
    data['district'] = this.district;
    data['subDistrict'] = this.subDistrict;
    data['areaName'] = this.areaName;
    return data;
  }
}

class CurrentAddress {
  String? id;
  String? currentDivision;
  String? currentDistrict;
  String? currentSubDistrict;
  String? areaName;

  CurrentAddress(
      {this.id,
      this.currentDivision,
      this.currentDistrict,
      this.currentSubDistrict,
      this.areaName});

  CurrentAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    currentDivision = json['currentDivision'];
    currentDistrict = json['currentDistrict'];
    currentSubDistrict = json['currentSubDistrict'];
    areaName = json['areaName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currentDivision'] = this.currentDivision;
    data['currentDistrict'] = this.currentDistrict;
    data['currentSubDistrict'] = this.currentSubDistrict;
    data['areaName'] = this.areaName;
    return data;
  }
}
