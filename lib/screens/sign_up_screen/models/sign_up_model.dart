class SignUpModel {
  String? name;
  String? email;
  String? phone;
  String? gender;
  String? password;

  SignUpModel({this.name, this.email, this.phone, this.gender, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['password'] = password;
    return data;
  }
}
