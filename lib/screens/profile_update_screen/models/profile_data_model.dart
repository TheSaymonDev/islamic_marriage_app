class ProfileDataModel {
  String? name;
  String? gender;
  String? email;
  String? phone;
  String? profileImage;

  ProfileDataModel({this.name, this.gender, this.email, this.phone, this.profileImage});

  // Convert a ProfileUpdate instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    data['profileImage'] = profileImage;
    return data;
  }

  ProfileDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    profileImage = json['profileImage'];
  }
}
