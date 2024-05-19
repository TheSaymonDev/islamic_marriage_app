class SetPassword {
  String? mobileNumber;
  String? otp;
  String? newPassword;

  SetPassword({this.mobileNumber, this.otp, this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobileNumber'] = mobileNumber;
    data['otp'] = otp;
    data['newPassword'] = newPassword;
    return data;
  }
}
