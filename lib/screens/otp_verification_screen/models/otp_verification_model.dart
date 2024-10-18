class OtpVerificationModel {
  String? identity;
  String? otp;

  OtpVerificationModel({this.identity, this.otp});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['identity'] = identity;
    data['otp'] = otp;
    return data;
  }
}
