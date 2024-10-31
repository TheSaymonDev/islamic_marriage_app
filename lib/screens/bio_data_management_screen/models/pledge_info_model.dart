class PledgeInfoModel {
  PledgeInfo? pledgeInfo;

  PledgeInfoModel({this.pledgeInfo});

  PledgeInfoModel.fromJson(Map<String, dynamic> json) {
    pledgeInfo = json['pledgeInfo'] != null
        ? new PledgeInfo.fromJson(json['pledgeInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pledgeInfo != null) {
      data['pledgeInfo'] = this.pledgeInfo!.toJson();
    }
    return data;
  }
}

class PledgeInfo {
  int? id;
  String? parentalAwareness;
  String? informationTruth;
  String? agreement;
  String? noAuthorityLiability;

  PledgeInfo(
      {this.id,
        this.parentalAwareness,
        this.informationTruth,
        this.agreement,
        this.noAuthorityLiability});

  PledgeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentalAwareness = json['parentalAwareness'];
    informationTruth = json['informationTruth'];
    agreement = json['agreement'];
    noAuthorityLiability = json['noAuthorityLiability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['parentalAwareness'] = this.parentalAwareness;
    data['informationTruth'] = this.informationTruth;
    data['agreement'] = this.agreement;
    data['noAuthorityLiability'] = this.noAuthorityLiability;
    return data;
  }
}
