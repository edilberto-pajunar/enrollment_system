class StudentInfo {

  final String name;
  final String section;
  final bool enrolled;

  StudentInfo({

    required this.name,
    required this.section,
    required this.enrolled,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
    name: json["name"],
    section: json["section"],
    enrolled: json["enrolled"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "section": section,
        "enrolled": enrolled,
      };
}
