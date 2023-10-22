class StudentInfo {

  final String name;
  final String section;
  final bool enrolled;
  final bool isTransferee;
  final double balance;

  StudentInfo({

    required this.name,
    required this.section,
    required this.enrolled,
    required this.isTransferee,
    required this.balance,
  });

  factory StudentInfo.fromJson(Map<String, dynamic> json) => StudentInfo(
    name: json["name"],
    section: json["section"],
    enrolled: json["enrolled"],
    isTransferee: json["isTransferee"],
    balance: json["balance"],
  );


  Map<String, dynamic> toJson() => {
        "name": name,
        "section": section,
        "enrolled": enrolled,
        "isTransferee": isTransferee,
        "balance": balance,
      };
}
