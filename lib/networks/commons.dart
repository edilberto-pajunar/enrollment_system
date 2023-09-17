import 'package:flutter/cupertino.dart';
import 'package:web_school/models/student/schedule.dart';
import 'package:web_school/models/student/subject.dart';

class Commons extends ChangeNotifier {
  static String? forcedTextValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    } else {
      return null;
    }
  }

  static String? forcedDropdownValidator(value) {
    if (value == null) {
      return "This field is required";
    } else {
      return null;
    }
  }

  static List<Subject> juniorSubject = [
    Subject(
      name: "Filipino",
      enrolled: false,
      grades: [
        Grade(
          title: "First",
          grade: 0.0,
        ),
        Grade(
          title: "Second",
          grade: 0.0,
        ),
        Grade(
          title: "Third",
          grade: 0.0,
        ),
        Grade(
          title: "Fourth",
          grade: 0.0,
        ),
      ],
      id: 0,
      units: 3,
    ),
    Subject(
        name: "English",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 1,
        units: 4),
    Subject(
        name: "Mathematics",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 2,
        units: 1),
    Subject(
        name: "Science",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 3,
        units: 3),
    Subject(
        name: "Araling Panlipunan",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 4,
        units: 3),
    Subject(
        name: "Edukasyon sa Pagpapakatao",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 5,
        units: 3),
    Subject(
        name: "Technology and Livelihood Education",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 6,
        units: 3),
    Subject(
        name: "Music",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 7,
        units: 3),
    Subject(
        name: "Arts",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 8,
        units: 3),
    Subject(
        name: "Physical Education",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 9,
        units: 3),
    Subject(
        name: "Health",
        enrolled: false,
        grades: [
          Grade(
            title: "First",
            grade: 0.0,
          ),
          Grade(
            title: "Second",
            grade: 0.0,
          ),
          Grade(
            title: "Third",
            grade: 0.0,
          ),
          Grade(
            title: "Fourth",
            grade: 0.0,
          ),
        ],
        id: 10,
        units: 3),
  ];

  static List<Subject> stemFirstSubjectList = [
    Subject(
        name: "Practical Research 1",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Practical Research 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "General Biology",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "General Chemistry 1",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "General Physics 1",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "Pre Calculus",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 5),
    Subject(
        name: "Media Information Literacy",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Intro to Philo of Human Resources",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Understanding Culture, Society & Politics",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
    Subject(
        name: "Physical Health and Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 9),
    Subject(
        name: "Reading and Writing",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 10),
  ];

  static List<Subject> stemSecondSubjectList = [
    Subject(
        name: "Entrepeneurship",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Empowerment Technologies",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "Inquiries, Investigation and Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "General Biology 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "General Chemistry 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "General Physics 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 5),
    Subject(
        name: "Basic Calculus",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Work Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Physical Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
  ];

  static List<Subject> gasFirstSubjectList = [
    Subject(
        name: "Practical Research 1",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Practical Research 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "Intro. to World Religions & Belief Sys",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "Tech/Voc Elective 1: Bread and Pastry",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "s, & Critical Thinking in the 21st Century",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "Media Information Literacy",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Intro to Philo of Human Resources",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Understanding Culture, Society & Politics",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
    Subject(
        name: "Physical Health and Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 9),
    Subject(
        name: "Reading and Writing",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 10),
  ];

  static List<Subject> gasSecondSubjectList = [
    Subject(
        name: "Entrepeneurship",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Empowerment Technologies",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "Inquiries, Investigation and Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "Tech/Voc Elective 1: Electronics",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "Community Engagement, Solidarity & Citizenship",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "Applied Economics",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 5),
    Subject(
        name: "Organization and Management",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Work Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Physical Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
  ];

  static List<Subject> hummsFirstSubjectList = [
    Subject(
        name: "Practical Research 1",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Practical Research 2",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "Intro. to World Religions & Belief Sys",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "Creative Writing",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "s, & Critical Thinking in the 21st Century",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "Philippine Politics & Governance",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Media Information Literacy",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Intro to Philo of Human Resources",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
    Subject(
        name: "Understanding Culture, Society & Politics",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 9),
    Subject(
        name: "Physical Health and Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 10),
    Subject(
        name: "Reading and Writing",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 11),
  ];

  static List<Subject> hummsSecondSubjectList = [
    Subject(
        name: "Entrepeneurship",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 0),
    Subject(
        name: "Empowerment Technologies",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 1),
    Subject(
        name: "Inquiries, Investigation and Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 2),
    Subject(
        name: "Creative Nonfiction",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 3),
    Subject(
        name: "Community Engagement, Solidarity & Citizenship",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 4),
    Subject(
        name: "Discipline & Ideas in the Social Sci.",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 5),
    Subject(
        name: "Disciplines & Ideas in the Applied Soc. Sci.",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 6),
    Subject(
        name: "Work Immersion",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 7),
    Subject(
        name: "Physical Education",
        enrolled: false,
        grades: [
          Grade(
            title: "Second",
            grade: 0.0,
          ),
        ],
        units: 1,
        id: 8),
  ];

  static List<List<Schedule>> grade7SectionA = [
    // FILIPINO
    [
      Schedule(
        day: 1,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
      Schedule(
        day: 2,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
    ],
    // ENGLISH
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 7,
          minute: 30,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 7,
          minute: 30,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 7,
          minute: 30,
        ),
      ),
    ],
    // MATH
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 8,
          minute: 30,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 8,
          minute: 30,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 8,
          minute: 30,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 8,
          minute: 30,
        ),
      ),
    ],
    // SCIENCE
    [
      Schedule(
        day: 1,
        start: TimeData(
          hour: 9,
          minute: 45,
        ),
      ),
      Schedule(
        day: 2,
        start: TimeData(
          hour: 9,
          minute: 45,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 9,
          minute: 45,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 9,
          minute: 45,
        ),
      ),
    ],
    // A.P
    [
      Schedule(
        day: 1,
        start: TimeData(
          hour: 8,
          minute: 30,
        ),
      ),
      Schedule(
        day: 2,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
    ],
    // ESP
    [
      Schedule(
        day: 1,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
    ],
    // TLE
    [
      Schedule(
        day: 1,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 9,
          minute: 45,
        ),
      ),
      Schedule(
        day: 5,
        start: TimeData(
          hour: 10,
          minute: 45,
        ),
      ),
    ],
    // MUSIC
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 15,
          minute: 00,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
    ],
    // ARTS
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 15,
          minute: 00,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
    ],
    // P.E.
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 15,
          minute: 00,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
    ],
    // HEALTH
    [
      Schedule(
        day: 2,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 14,
          minute: 00,
        ),
      ),
      Schedule(
        day: 3,
        start: TimeData(
          hour: 15,
          minute: 00,
        ),
      ),
      Schedule(
        day: 4,
        start: TimeData(
          hour: 13,
          minute: 00,
        ),
      ),
    ],
  ];
}
