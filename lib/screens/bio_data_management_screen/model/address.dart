class Address {
  int? id;
  String? permanentAddress;
  bool? isSameCurrentAddress;
  String? currentAddress;
  String? growUp;

  Address({
    this.id,
    this.permanentAddress,
    this.isSameCurrentAddress,
    this.currentAddress,
    this.growUp,
  });

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    permanentAddress = json['permanentAddress'];
    isSameCurrentAddress = json['isSameCurrentAddress'];
    currentAddress = json['currentAddress'];
    growUp = json['growUp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['permanentAddress'] = permanentAddress;
    data['isSameCurrentAddress'] = isSameCurrentAddress;
    data['currentAddress'] = currentAddress;
    data['growUp'] = growUp;
    return data;
  }
}
