class SignUp {
  String? fullName;
  String? email;
  String? mobileNumber;
  String? password;
  String? gender;

  SignUp(
      {this.fullName,
        this.email,
        this.mobileNumber,
        this.password,
        this.gender});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['password'] = password;
    data['gender'] = gender;
    return data;
  }
}
