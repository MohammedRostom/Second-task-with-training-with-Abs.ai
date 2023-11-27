class JsonDataModel {
  final String schoolName;
  final String schoolAddress;
  final String numberOfStudents;
  final String numberOfTeachers;

  JsonDataModel({
    required this.schoolName,
    required this.schoolAddress,
    required this.numberOfStudents,
    required this.numberOfTeachers,
  });

  factory JsonDataModel.fromJson(Map<String, dynamic> json) {
    return JsonDataModel(
      schoolName: json["schoolName"],
      schoolAddress: json["schoolAddress"],
      numberOfStudents: json["numberOfStudents"],
      numberOfTeachers: json["numberOfTeachers"],
    );
  }
}
