class Contact {
  int? id;
  String? groomName;
  String? guardianMobile;
  String? guardianRelationship;
  String? email;

  Contact({
    this.id,
    this.groomName,
    this.guardianMobile,
    this.guardianRelationship,
    this.email,
  });

  Contact.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groomName = json['groomName'];
    guardianMobile = json['guardianMobile'];
    guardianRelationship = json['guardianRelationship'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groomName'] = groomName;
    data['guardianMobile'] = guardianMobile;
    data['guardianRelationship'] = guardianRelationship;
    data['email'] = email;
    return data;
  }
}
