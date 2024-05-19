class PersonalLifeInfo {
  int? id;
  String? clothesInfo;
  String? breadInfo;
  String? clothesAnkles;
  String? prayInfo;
  String? qazaInfo;
  String? marhamInfo;
  String? reciteTheQuran;
  String? fiqh;
  String? moviesOrSongs;
  String? physicalDiseases;
  String? workOfDeen;
  String? mazarInfo;
  String? books;
  String? islamicScholars;
  String? applicable;
  String? hobbies;
  String? groomMobileNumber;
  String? photo;

  PersonalLifeInfo({
    this.id,
    this.clothesInfo,
    this.breadInfo,
    this.clothesAnkles,
    this.prayInfo,
    this.qazaInfo,
    this.marhamInfo,
    this.reciteTheQuran,
    this.fiqh,
    this.moviesOrSongs,
    this.physicalDiseases,
    this.workOfDeen,
    this.mazarInfo,
    this.books,
    this.islamicScholars,
    this.applicable,
    this.hobbies,
    this.groomMobileNumber,
    this.photo,
  });

  PersonalLifeInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clothesInfo = json['clothesInfo'];
    breadInfo = json['breadInfo'];
    clothesAnkles = json['clothesAnkles'];
    prayInfo = json['prayInfo'];
    qazaInfo = json['qazaInfo'];
    marhamInfo = json['marhamInfo'];
    reciteTheQuran = json['reciteTheQuran'];
    fiqh = json['fiqh'];
    moviesOrSongs = json['moviesOrSongs'];
    physicalDiseases = json['physicalDiseases'];
    workOfDeen = json['workOfDeen'];
    mazarInfo = json['mazarInfo'];
    books = json['books'];
    islamicScholars = json['islamicScholars'];
    applicable = json['applicable'];
    hobbies = json['hobbies'];
    groomMobileNumber = json['groomMobileNumber'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clothesInfo'] = clothesInfo;
    data['breadInfo'] = breadInfo;
    data['clothesAnkles'] = clothesAnkles;
    data['prayInfo'] = prayInfo;
    data['qazaInfo'] = qazaInfo;
    data['marhamInfo'] = marhamInfo;
    data['reciteTheQuran'] = reciteTheQuran;
    data['fiqh'] = fiqh;
    data['moviesOrSongs'] = moviesOrSongs;
    data['physicalDiseases'] = physicalDiseases;
    data['workOfDeen'] = workOfDeen;
    data['mazarInfo'] = mazarInfo;
    data['books'] = books;
    data['islamicScholars'] = islamicScholars;
    data['applicable'] = applicable;
    data['hobbies'] = hobbies;
    data['groomMobileNumber'] = groomMobileNumber;
    data['photo'] = photo;
    return data;
  }
}
