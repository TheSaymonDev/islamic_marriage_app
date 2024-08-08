class ProfileUpdate {
  String? name;
  String? gender;
  String? email;
  String? phone;

  ProfileUpdate({this.name, this.gender, this.email, this.phone});

  // Convert a ProfileUpdate instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    return data;
  }

  ProfileUpdate.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
  }
}
