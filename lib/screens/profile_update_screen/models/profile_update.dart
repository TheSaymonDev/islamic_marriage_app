class ProfileUpdate {
  String? name;
  String? gender;

  ProfileUpdate({this.name, this.gender});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['gender'] = this.gender;
    return data;
  }
}
