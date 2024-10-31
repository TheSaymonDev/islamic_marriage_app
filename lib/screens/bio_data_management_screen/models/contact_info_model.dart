class ContactInfoModel {
  ContactInfo? contactInfo;

  ContactInfoModel({this.contactInfo});

  ContactInfoModel.fromJson(Map<String, dynamic> json) {
    contactInfo = json['contactInfo'] != null
        ? new ContactInfo.fromJson(json['contactInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contactInfo != null) {
      data['contactInfo'] = this.contactInfo!.toJson();
    }
    return data;
  }
}

class ContactInfo {
  int? id;
  String? groomName;
  String? guardianMobile;
  String? relationShipWithGuardian;
  String? email;

  ContactInfo(
      {this.id,
        this.groomName,
        this.guardianMobile,
        this.relationShipWithGuardian,
        this.email});

  ContactInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groomName = json['groomName'];
    guardianMobile = json['guardianMobile'];
    relationShipWithGuardian = json['relationShipWithGuardian'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groomName'] = this.groomName;
    data['guardianMobile'] = this.guardianMobile;
    data['relationShipWithGuardian'] = this.relationShipWithGuardian;
    data['email'] = this.email;
    return data;
  }
}
