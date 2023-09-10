import 'package:web_school/models/option.dart';

class Instructor {
  final String username;
  final String firstName;
  final String lastName;
  final String id;
  final SelectionOption? grade;
  final SelectionOption? section;

  Instructor({
    required this.username,
    required this.id,
    required this.firstName,
    required this.lastName,
    this.grade,
    this.section,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      username: json["username"],
      id: json["id"],
      firstName: json["firstName"],
      lastName: json["lastName"],
      grade: SelectionOption.fromJson(json["grade"]),
      section: SelectionOption.fromJson(json["section"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "username": username,
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "grade": grade!.toJson(),
        "section": section!.toJson(),
      };
}
