class StudentInfo {
  final String name;
  final String password;
  final String id;
  final String section;
  final bool enrolled;

  StudentInfo({
    required this.name,
    required this.password,
    required this.id,
    required this.section,
    required this.enrolled,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
      name: json["name"],
      password: json["password"],
      id: json["id"],
      section: json["section"],
      enrolled: json["enrolled"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "id": id,
        "section": section,
        "enrolled": enrolled,
      };
}
