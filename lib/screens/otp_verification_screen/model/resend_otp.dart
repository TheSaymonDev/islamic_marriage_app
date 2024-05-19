class ResendOTP {
  String? mobileNumber;

  ResendOTP({this.mobileNumber});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mobileNumber'] = mobileNumber;
    return data;
  }
}
