import 'package:web_school/models/option.dart';

class Instructor {
  final String id;
  final String name;
  final SelectionOption? grade;
  final SelectionOption? section;

  Instructor({
    required this.id,
    required this.name,
    this.grade,
    this.section,
  });

  factory Instructor.fromJson(Map<String, dynamic> json) {
    return Instructor(
      id: json["id"],
      name: json["name"],
      grade: SelectionOption.fromJson(json["grade"]),
      section: SelectionOption.fromJson(json["section"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "grade": grade!.toJson(),
        "section": section!.toJson(),
      };
}
