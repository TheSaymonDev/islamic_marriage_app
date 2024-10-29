class PersonalLifeInfo {
  String? clothingOutside;
  String? sunnahBeardSince;
  bool? clothesAboveAnkles;
  String? fiveTimesPrayerSince;
  String? prayerMissDaily;
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

  PersonalLifeInfo(
      {this.clothingOutside,
        this.sunnahBeardSince,
        this.clothesAboveAnkles,
        this.fiveTimesPrayerSince,
        this.prayerMissDaily,
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
        this.groomPhone});

  PersonalLifeInfo.fromJson(Map<String, dynamic> json) {
    clothingOutside = json['clothingOutside'];
    sunnahBeardSince = json['sunnahBeardSince'];
    clothesAboveAnkles = json['clothesAboveAnkles'];
    fiveTimesPrayerSince = json['fiveTimesPrayerSince'];
    prayerMissDaily = json['prayerMissDaily'];
    complyNonMahram = json['complyNonMahram'];
    reciteQuranCorrectly = json['reciteQuranCorrectly'];
    followedFiqah = json['followedFiqah'];
    watchIslamicDramaSong = json['watchIslamicDramaSong'];
    mentalPhysicalDiseases = json['mentalPhysicalDiseases'];
    involvedSpecialDeenWork = json['involvedSpecialDeenWork'];
    believeAboutMazar = json['believeAboutMazar'];
    islamicReadedBookName = json['islamicReadedBookName'].cast<String>();
    islamicFollowedScholarName =
        json['islamicFollowedScholarName'].cast<String>();
    hobbiesLikeDislike = json['hobbiesLikeDislike'];
    groomPhone = json['groomPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clothingOutside'] = this.clothingOutside;
    data['sunnahBeardSince'] = this.sunnahBeardSince;
    data['clothesAboveAnkles'] = this.clothesAboveAnkles;
    data['fiveTimesPrayerSince'] = this.fiveTimesPrayerSince;
    data['prayerMissDaily'] = this.prayerMissDaily;
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
    return data;
  }
}
