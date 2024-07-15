class OtpVerification {
  String? identity;
  String? otp;

  OtpVerification({this.identity, this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['otp'] = otp;
    return data;
  }
}
