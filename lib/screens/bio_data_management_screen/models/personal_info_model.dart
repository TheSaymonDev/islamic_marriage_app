class PersonalInfoModel {
  PersonalInfo? personalInfo;

  PersonalInfoModel({this.personalInfo});

  PersonalInfoModel.fromJson(Map<String, dynamic> json) {
    personalInfo = json['personalInfo'] != null
        ? new PersonalInfo.fromJson(json['personalInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.personalInfo != null) {
      data['personalInfo'] = this.personalInfo!.toJson();
    }
    return data;
  }
}

class PersonalInfo {
  int? id;
  String? clothingOutside;
  String? sunnahBeardSince;
  String? clothesAboveAnkles;
  String? fiveTimesPrayerSince;
  String? prayerMissDaily;
  String? veil;
  String? complyNonMahram;
  String? reciteQuranCorrectly;
  String? followedFiqah;
  String? watchIslamicDramaSong;
  String? mentalPhysicalDiseases;
  String? involvedSpecialDeenWork;
  String? believeAboutMazar;
  String? islamicReadedBookName;
  String? islamicFollowedScholarName;
  String? hobbiesLikeDislike;
  String? groomPhone;
  String? groomSelfieUrl;

  PersonalInfo(
      {this.id,
        this.clothingOutside,
        this.sunnahBeardSince,
        this.clothesAboveAnkles,
        this.fiveTimesPrayerSince,
        this.prayerMissDaily,
        this.veil,
        this.complyNonMahram,
        this.reciteQuranCorrectly,
        this.followedFiqah,
        this.watchIslamicDramaSong,
        this.mentalPhysicalDiseases,
        this.involvedSpecialDeenWork,
        this.believeAboutMazar,
        this.islamicReadedBookName,
        this.islamicFollowedScholarName,
        this.hobbiesLikeDislike,
        this.groomPhone,
        this.groomSelfieUrl});

  PersonalInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clothingOutside = json['clothingOutside'];
    sunnahBeardSince = json['sunnahBeardSince'];
    clothesAboveAnkles = json['clothesAboveAnkles'];
    fiveTimesPrayerSince = json['fiveTimesPrayerSince'];
    prayerMissDaily = json['prayerMissDaily'];
    veil = json['veil'];
    complyNonMahram = json['complyNonMahram'];
    reciteQuranCorrectly = json['reciteQuranCorrectly'];
    followedFiqah = json['followedFiqah'];
    watchIslamicDramaSong = json['watchIslamicDramaSong'];
    mentalPhysicalDiseases = json['mentalPhysicalDiseases'];
    involvedSpecialDeenWork = json['involvedSpecialDeenWork'];
    believeAboutMazar = json['believeAboutMazar'];
    islamicReadedBookName = json['islamicReadedBookName'];
    islamicFollowedScholarName = json['islamicFollowedScholarName'];
    hobbiesLikeDislike = json['hobbiesLikeDislike'];
    groomPhone = json['groomPhone'];
    groomSelfieUrl = json['groomSelfieUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clothingOutside'] = this.clothingOutside;
    data['sunnahBeardSince'] = this.sunnahBeardSince;
    data['clothesAboveAnkles'] = this.clothesAboveAnkles;
    data['fiveTimesPrayerSince'] = this.fiveTimesPrayerSince;
    data['prayerMissDaily'] = this.prayerMissDaily;
    data['veil'] = this.veil;
    data['complyNonMahram'] = this.complyNonMahram;
    data['reciteQuranCorrectly'] = this.reciteQuranCorrectly;
    data['followedFiqah'] = this.followedFiqah;
    data['watchIslamicDramaSong'] = this.watchIslamicDramaSong;
    data['mentalPhysicalDiseases'] = this.mentalPhysicalDiseases;
    data['involvedSpecialDeenWork'] = this.involvedSpecialDeenWork;
    data['believeAboutMazar'] = this.believeAboutMazar;
    data['islamicReadedBookName'] = this.islamicReadedBookName;
    data['islamicFollowedScholarName'] = this.islamicFollowedScholarName;
    data['hobbiesLikeDislike'] = this.hobbiesLikeDislike;
    data['groomPhone'] = this.groomPhone;
    data['groomSelfieUrl'] = this.groomSelfieUrl;
    return data;
  }
}
