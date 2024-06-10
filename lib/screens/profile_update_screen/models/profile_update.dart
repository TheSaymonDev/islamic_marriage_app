class ProfileUpdate {
  String? fullName;

  ProfileUpdate({this.fullName});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    return data;
  }
}
