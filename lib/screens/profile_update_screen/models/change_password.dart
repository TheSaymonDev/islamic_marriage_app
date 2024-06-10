class ChangePassword {
  String? oldPassword;
  String? newPassword;

  ChangePassword({this.oldPassword, this.newPassword});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['oldPassword'] = this.oldPassword;
    data['newPassword'] = this.newPassword;
    return data;
  }
}
