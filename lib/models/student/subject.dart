
import 'package:equatable/equatable.dart';
import 'package:web_school/models/student/schedule.dart';

class Subject extends Equatable {
  final String name;
  final bool? enrolled;
  final List<Grade> grades;
  final int? units;
  final int id;
  final List<Schedule>? schedule;

  Subject({
    required this.name,
    this.enrolled,
    required this.grades,
    required this.units,
    required this.id,
    this.schedule,
  });

  factory Subject.fromMap(Map<String, dynamic> json) => Subject(
        name: json["name"],
        enrolled: json["enrolled"],
        grades: List<Grade>.from(json["grades"].map((x) => Grade.fromMap(x))),
        units: json["units"],
        id: json["id"],
        schedule: json["schedule"] == null
            ? []
            : List<Schedule>.from(json["schedule"].map((x) => Schedule.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "enrolled": enrolled,
        "grades": List<dynamic>.from(grades.map((x) => x.toMap())),
        "units": units,
        "id": id,
        "schedule": schedule == null ? [] : List<dynamic>.from(schedule!.map((e) => e.toJson())),
      };

  @override
  List<Object?> get props => [id];
}

class Grade {
  final String? title;
  final double? grade;

  Grade({
    this.title,
    this.grade,
  });

  factory Grade.fromMap(Map<String, dynamic> json) => Grade(
        title: json["title"] as String?,
        grade: json["grade"] != null
            ? double.parse(json["grade"].toString())
            : 0.0,
      );

  Map<String, dynamic> toMap() => {
        "title": title,
        "grade": grade,
      };
}
