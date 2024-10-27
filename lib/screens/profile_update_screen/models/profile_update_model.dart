class ProfileUpdateModel {
  String? name;
  String? gender;


  ProfileUpdateModel({this.name, this.gender});

  // Convert a ProfileUpdate instance to JSON
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['gender'] = gender;
    return data;
  }

  ProfileUpdateModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    gender = json['gender'];
  }
}
