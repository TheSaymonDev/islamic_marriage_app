class EduQualifications {
  int? id;
  String? medium;
  String? qualification;
  String? submission;
  String? category;
  String? result;
  String? isDiplomaSubject;
  String? institution;
  String? passingYear;
  String? otherQualifications;
  String? religiousEducation;

  EduQualifications({
    this.id,
    this.medium,
    this.qualification,
    this.submission,
    this.category,
    this.result,
    this.isDiplomaSubject,
    this.institution,
    this.passingYear,
    this.otherQualifications,
    this.religiousEducation,
  });

  EduQualifications.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medium = json['medium'];
    qualification = json['qualification'];
    submission = json['submission'];
    category = json['category'];
    result = json['result'];
    isDiplomaSubject = json['isDiplomaSubject'];
    institution = json['institution'];
    passingYear = json['passingYear'];
    otherQualifications = json['otherQualifications'];
    religiousEducation = json['religiousEducation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medium'] = medium;
    data['qualification'] = qualification;
    data['submission'] = submission;
    data['category'] = category;
    data['result'] = result;
    data['isDiplomaSubject'] = isDiplomaSubject;
    data['institution'] = institution;
    data['passingYear'] = passingYear;
    data['otherQualifications'] = otherQualifications;
    data['religiousEducation'] = religiousEducation;
    return data;
  }
}
