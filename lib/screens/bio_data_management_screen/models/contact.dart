class Contact {
  String? groomName;
  String? guardianMobile;
  String? relationShipWithGuardian;
  String? email;

  Contact(
      {this.groomName,
        this.guardianMobile,
        this.relationShipWithGuardian,
        this.email});

  Contact.fromJson(Map<String, dynamic> json) {
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
