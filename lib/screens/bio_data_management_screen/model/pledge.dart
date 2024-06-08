class Pledge {
  int? id;
  String? parentKnowSubmission;
  String? isAllInfoTrue;
  String? falseInfoProven;

  Pledge({
    this.id,
    this.parentKnowSubmission,
    this.isAllInfoTrue,
    this.falseInfoProven,
  });

  Pledge.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentKnowSubmission = json['parentKnowSubmission'];
    isAllInfoTrue = json['isAllInfoTrue'];
    falseInfoProven = json['falseInfoProven'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['parentKnowSubmission'] = parentKnowSubmission;
    data['isAllInfoTrue'] = isAllInfoTrue;
    data['falseInfoProven'] = falseInfoProven;
    return data;
  }
}
