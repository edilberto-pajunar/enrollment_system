
import 'package:web_school/models/application/emergency.dart';
import 'package:web_school/models/application/family.dart';
import 'package:web_school/models/application/personal.dart';
import 'package:web_school/models/application/residence.dart';
import 'package:web_school/models/application/school.dart';
import 'package:web_school/models/application/student.dart';

class ApplicationInfo {
  ApplicationInfo({
    required this.studentInfo,
    required this.schoolInfo,
    required this.personalInfo,
    required this.emergencyInfo,
    required this.residenceInfo,
    required this.familyInfo,
  });

  final StudentInfo studentInfo;
  final SchoolInfo schoolInfo;
  final PersonalInfo personalInfo;
  final EmergencyInfo emergencyInfo;
  final ResidenceInfo residenceInfo;
  final FamilyInfo familyInfo;

  factory ApplicationInfo.fromJson(Map<String, dynamic> json) {
    return ApplicationInfo(
      studentInfo: StudentInfo.fromJson(json["studentInfo"]),
      schoolInfo: SchoolInfo.fromJson(json["schoolInfo"]),
      personalInfo: PersonalInfo.fromJson(json["personalInfo"]),
      emergencyInfo: EmergencyInfo.fromJson(json["emergencyInfo"]),
      residenceInfo: ResidenceInfo.fromJson(json["residenceInfo"]),
      familyInfo: FamilyInfo.fromJson(json["familyInfo"]),
    );
  }

  Map<String, dynamic> toJson() => {
        'studentInfo': studentInfo.toJson(),
        'schoolInfo': schoolInfo.toJson(),
        'personalInfo': personalInfo.toJson(),
        'emergencyInfo': emergencyInfo.toJson(),
        'residenceInfo': residenceInfo.toJson(),
        'familyInfo': familyInfo.toJson(),
      };
}
