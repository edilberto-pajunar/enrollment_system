class StudentInfo {
  final String name;
  final String password;
  final String id;
  final String section;

  StudentInfo({
    required this.name,
    required this.password,
    required this.id,
    required this.section,
  });


  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
    name: json["name"],
    password: json["password"],
    id: json["id"],
    section: json["section"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "id": id,
    "section": section,
  };
}
