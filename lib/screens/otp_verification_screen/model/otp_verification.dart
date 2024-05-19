class OtpVerification {
  String? mobileNumber;
  String? otp;

  OtpVerification({this.mobileNumber, this.otp});

  OtpVerification.fromJson(Map<String, dynamic> json) {
    mobileNumber = json['mobileNumber'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobileNumber'] = mobileNumber;
    data['otp'] = otp;
    return data;
  }
}
