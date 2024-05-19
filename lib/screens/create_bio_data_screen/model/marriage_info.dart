class MarriageRelatedInfo {
  int? id;
  String? guardiansPermission;
  String? veilAfterMarriage;
  String? partnerEducationPermission;
  String? partnerJobPermission;
  String? liveInformationAfterMarriage;
  String? expectedGift;
  String? thoughtAboutMarriage;

  MarriageRelatedInfo({
    this.id,
    this.guardiansPermission,
    this.veilAfterMarriage,
    this.partnerEducationPermission,
    this.partnerJobPermission,
    this.liveInformationAfterMarriage,
    this.expectedGift,
    this.thoughtAboutMarriage,
  });

  MarriageRelatedInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    guardiansPermission = json['guardiansPermission'];
    veilAfterMarriage = json['veilAfterMarriage'];
    partnerEducationPermission = json['partnerEducationPermission'];
    partnerJobPermission = json['partnerJobPermission'];
    liveInformationAfterMarriage = json['liveInformationAfterMarriage'];
    expectedGift = json['expectedGift'];
    thoughtAboutMarriage = json['thoughtAboutMarriage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['guardiansPermission'] = guardiansPermission;
    data['veilAfterMarriage'] = veilAfterMarriage;
    data['partnerEducationPermission'] = partnerEducationPermission;
    data['partnerJobPermission'] = partnerJobPermission;
    data['liveInformationAfterMarriage'] = liveInformationAfterMarriage;
    data['expectedGift'] = expectedGift;
    data['thoughtAboutMarriage'] = thoughtAboutMarriage;
    return data;
  }
}
