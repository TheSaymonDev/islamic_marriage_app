class ChangePassModel {
  String? oldPassword;
  String? newPassword;
  String? confirmPassword;

  ChangePassModel({this.oldPassword, this.newPassword, this.confirmPassword});

  ChangePassModel.fromJson(Map<String, dynamic> json) {
    oldPassword = json['old_password'];
    newPassword = json['new_password'];
    confirmPassword = json['confirm_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['old_password'] = this.oldPassword;
    data['new_password'] = this.newPassword;
    data['confirm_password'] = this.confirmPassword;
    return data;
  }
}
