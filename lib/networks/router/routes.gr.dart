// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i31;
import 'package:flutter/material.dart' as _i33;
import 'package:web_school/models/application/application.dart' as _i35;
import 'package:web_school/models/application/student.dart' as _i34;
import 'package:web_school/models/instructor.dart' as _i32;
import 'package:web_school/views/screens/admin/home.dart' as _i3;
import 'package:web_school/views/screens/admin/instructor/add.dart' as _i1;
import 'package:web_school/views/screens/admin/instructor/edit.dart' as _i2;
import 'package:web_school/views/screens/admin/instructor/general/grade.dart'
    as _i4;
import 'package:web_school/views/screens/admin/instructor/general/home.dart'
    as _i5;
import 'package:web_school/views/screens/admin/instructor/general/section.dart'
    as _i6;
import 'package:web_school/views/screens/admin/instructor/general/student/student.dart'
    as _i7;
import 'package:web_school/views/screens/admin/student/list.dart' as _i9;
import 'package:web_school/views/screens/admin/student/profile.dart' as _i8;
import 'package:web_school/views/screens/auth/home.dart' as _i14;
import 'package:web_school/views/screens/auth/login.dart' as _i18;
import 'package:web_school/views/screens/forms/form.dart' as _i13;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i11;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i15;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i30;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i12;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i19;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i20;
import 'package:web_school/views/screens/instructor/grade.dart' as _i16;
import 'package:web_school/views/screens/instructor/home.dart' as _i17;
import 'package:web_school/views/screens/student/builder.dart' as _i21;
import 'package:web_school/views/screens/student/mobile/home.dart' as _i23;
import 'package:web_school/views/screens/student/mobile/profile/change_pass.dart'
    as _i10;
import 'package:web_school/views/screens/student/mobile/profile/enrollment.dart'
    as _i22;
import 'package:web_school/views/screens/student/mobile/profile/info.dart'
    as _i24;
import 'package:web_school/views/screens/student/mobile/profile/profile.dart'
    as _i25;
import 'package:web_school/views/screens/student/web/home.dart' as _i28;
import 'package:web_school/views/screens/student/web/profile/change_pass.dart'
    as _i26;
import 'package:web_school/views/screens/student/web/profile/enrollment.dart'
    as _i27;
import 'package:web_school/views/screens/student/web/profile/profile.dart'
    as _i29;

abstract class $AppRouter extends _i31.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AdminAddInstructorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAddInstructorScreen(),
      );
    },
    AdminEditInstructorRoute.name: (routeData) {
      final args = routeData.argsAs<AdminEditInstructorRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AdminEditInstructorScreen(
          instructorData: args.instructorData,
          key: args.key,
        ),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AdminHomeScreen(),
      );
    },
    AdminInstructorGradeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminInstructorGradeScreen(),
      );
    },
    AdminInstructorHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminInstructorHomeScreen(),
      );
    },
    AdminInstructorSectionRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminInstructorSectionScreen(),
      );
    },
    AdminInstructorStudentListRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminInstructorStudentListScreen(),
      );
    },
    AdminStudentProfileRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AdminStudentProfileScreen(),
      );
    },
    AdminStudentsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AdminStudentsScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.ChangePasswordScreen(
          currentPassword: args.currentPassword,
          key: args.key,
        ),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.FormsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.HomeScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.IncomingJuniorFormScreen(),
      );
    },
    InstructorGradeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorGradeRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.InstructorGradeScreen(
          isJunior: args.isJunior,
          key: args.key,
        ),
      );
    },
    InstructorHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.InstructorHomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.OtherSchoolScreen(),
      );
    },
    StudentLayoutBuilder.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.StudentLayoutBuilder(),
      );
    },
    StudentMobileEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileEnrollmentRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.StudentMobileEnrollmentScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.StudentMobileHomeScreen(),
      );
    },
    StudentMobileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileInfoRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.StudentMobileInfoScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileProfileRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.StudentMobileProfileScreen(),
      );
    },
    StudentWebChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebChangePassRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.StudentWebChangePassScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentWebEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebEnrollmentRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.StudentWebEnrollmentScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentWebHomeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.StudentWebHomeScreen(),
      );
    },
    StudentWebProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebProfileRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.StudentWebProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.TransfereeJuniorScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAddInstructorScreen]
class AdminAddInstructorRoute extends _i31.PageRouteInfo<void> {
  const AdminAddInstructorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminAddInstructorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAddInstructorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminEditInstructorScreen]
class AdminEditInstructorRoute
    extends _i31.PageRouteInfo<AdminEditInstructorRouteArgs> {
  AdminEditInstructorRoute({
    required _i32.Instructor instructorData,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          AdminEditInstructorRoute.name,
          args: AdminEditInstructorRouteArgs(
            instructorData: instructorData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminEditInstructorRoute';

  static const _i31.PageInfo<AdminEditInstructorRouteArgs> page =
      _i31.PageInfo<AdminEditInstructorRouteArgs>(name);
}

class AdminEditInstructorRouteArgs {
  const AdminEditInstructorRouteArgs({
    required this.instructorData,
    this.key,
  });

  final _i32.Instructor instructorData;

  final _i33.Key? key;

  @override
  String toString() {
    return 'AdminEditInstructorRouteArgs{instructorData: $instructorData, key: $key}';
  }
}

/// generated route for
/// [_i3.AdminHomeScreen]
class AdminHomeRoute extends _i31.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AdminInstructorGradeScreen]
class AdminInstructorGradeRoute extends _i31.PageRouteInfo<void> {
  const AdminInstructorGradeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminInstructorGradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorGradeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminInstructorHomeScreen]
class AdminInstructorHomeRoute extends _i31.PageRouteInfo<void> {
  const AdminInstructorHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminInstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminInstructorSectionScreen]
class AdminInstructorSectionRoute extends _i31.PageRouteInfo<void> {
  const AdminInstructorSectionRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminInstructorSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorSectionRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminInstructorStudentListScreen]
class AdminInstructorStudentListRoute extends _i31.PageRouteInfo<void> {
  const AdminInstructorStudentListRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminInstructorStudentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorStudentListRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminStudentProfileScreen]
class AdminStudentProfileRoute extends _i31.PageRouteInfo<void> {
  const AdminStudentProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminStudentProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AdminStudentsScreen]
class AdminStudentsRoute extends _i31.PageRouteInfo<void> {
  const AdminStudentsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AdminStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i10.ChangePasswordScreen]
class ChangePasswordRoute extends _i31.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String currentPassword,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(
            currentPassword: currentPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i31.PageInfo<ChangePasswordRouteArgs> page =
      _i31.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    required this.currentPassword,
    this.key,
  });

  final String currentPassword;

  final _i33.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{currentPassword: $currentPassword, key: $key}';
  }
}

/// generated route for
/// [_i11.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i31.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i31.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i13.FormsScreen]
class FormsRoute extends _i31.PageRouteInfo<void> {
  const FormsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i14.HomeScreen]
class HomeRoute extends _i31.PageRouteInfo<void> {
  const HomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i15.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i31.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i31.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i16.InstructorGradeScreen]
class InstructorGradeRoute
    extends _i31.PageRouteInfo<InstructorGradeRouteArgs> {
  InstructorGradeRoute({
    required bool isJunior,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          InstructorGradeRoute.name,
          args: InstructorGradeRouteArgs(
            isJunior: isJunior,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorGradeRoute';

  static const _i31.PageInfo<InstructorGradeRouteArgs> page =
      _i31.PageInfo<InstructorGradeRouteArgs>(name);
}

class InstructorGradeRouteArgs {
  const InstructorGradeRouteArgs({
    required this.isJunior,
    this.key,
  });

  final bool isJunior;

  final _i33.Key? key;

  @override
  String toString() {
    return 'InstructorGradeRouteArgs{isJunior: $isJunior, key: $key}';
  }
}

/// generated route for
/// [_i17.InstructorHomeScreen]
class InstructorHomeRoute extends _i31.PageRouteInfo<void> {
  const InstructorHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          InstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructorHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i18.LoginScreen]
class LoginRoute extends _i31.PageRouteInfo<void> {
  const LoginRoute({List<_i31.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i19.NewSeniorScreen]
class NewSeniorRoute extends _i31.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i20.OtherSchoolScreen]
class OtherSchoolRoute extends _i31.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i21.StudentLayoutBuilder]
class StudentLayoutBuilder extends _i31.PageRouteInfo<void> {
  const StudentLayoutBuilder({List<_i31.PageRouteInfo>? children})
      : super(
          StudentLayoutBuilder.name,
          initialChildren: children,
        );

  static const String name = 'StudentLayoutBuilder';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i22.StudentMobileEnrollmentScreen]
class StudentMobileEnrollmentRoute
    extends _i31.PageRouteInfo<StudentMobileEnrollmentRouteArgs> {
  StudentMobileEnrollmentRoute({
    required _i34.StudentInfo studentInfo,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StudentMobileEnrollmentRoute.name,
          args: StudentMobileEnrollmentRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileEnrollmentRoute';

  static const _i31.PageInfo<StudentMobileEnrollmentRouteArgs> page =
      _i31.PageInfo<StudentMobileEnrollmentRouteArgs>(name);
}

class StudentMobileEnrollmentRouteArgs {
  const StudentMobileEnrollmentRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i34.StudentInfo studentInfo;

  final _i33.Key? key;

  @override
  String toString() {
    return 'StudentMobileEnrollmentRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i23.StudentMobileHomeScreen]
class StudentMobileHomeRoute extends _i31.PageRouteInfo<void> {
  const StudentMobileHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          StudentMobileHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i24.StudentMobileInfoScreen]
class StudentMobileInfoRoute
    extends _i31.PageRouteInfo<StudentMobileInfoRouteArgs> {
  StudentMobileInfoRoute({
    required _i35.ApplicationInfo applicationInfo,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StudentMobileInfoRoute.name,
          args: StudentMobileInfoRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileInfoRoute';

  static const _i31.PageInfo<StudentMobileInfoRouteArgs> page =
      _i31.PageInfo<StudentMobileInfoRouteArgs>(name);
}

class StudentMobileInfoRouteArgs {
  const StudentMobileInfoRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i35.ApplicationInfo applicationInfo;

  final _i33.Key? key;

  @override
  String toString() {
    return 'StudentMobileInfoRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i25.StudentMobileProfileScreen]
class StudentMobileProfileRoute extends _i31.PageRouteInfo<void> {
  const StudentMobileProfileRoute({List<_i31.PageRouteInfo>? children})
      : super(
          StudentMobileProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileProfileRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StudentWebChangePassScreen]
class StudentWebChangePassRoute
    extends _i31.PageRouteInfo<StudentWebChangePassRouteArgs> {
  StudentWebChangePassRoute({
    required _i34.StudentInfo studentInfo,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StudentWebChangePassRoute.name,
          args: StudentWebChangePassRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebChangePassRoute';

  static const _i31.PageInfo<StudentWebChangePassRouteArgs> page =
      _i31.PageInfo<StudentWebChangePassRouteArgs>(name);
}

class StudentWebChangePassRouteArgs {
  const StudentWebChangePassRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i34.StudentInfo studentInfo;

  final _i33.Key? key;

  @override
  String toString() {
    return 'StudentWebChangePassRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i27.StudentWebEnrollmentScreen]
class StudentWebEnrollmentRoute
    extends _i31.PageRouteInfo<StudentWebEnrollmentRouteArgs> {
  StudentWebEnrollmentRoute({
    required _i34.StudentInfo studentInfo,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StudentWebEnrollmentRoute.name,
          args: StudentWebEnrollmentRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebEnrollmentRoute';

  static const _i31.PageInfo<StudentWebEnrollmentRouteArgs> page =
      _i31.PageInfo<StudentWebEnrollmentRouteArgs>(name);
}

class StudentWebEnrollmentRouteArgs {
  const StudentWebEnrollmentRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i34.StudentInfo studentInfo;

  final _i33.Key? key;

  @override
  String toString() {
    return 'StudentWebEnrollmentRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i28.StudentWebHomeScreen]
class StudentWebHomeRoute extends _i31.PageRouteInfo<void> {
  const StudentWebHomeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          StudentWebHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentWebHomeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.StudentWebProfileScreen]
class StudentWebProfileRoute
    extends _i31.PageRouteInfo<StudentWebProfileRouteArgs> {
  StudentWebProfileRoute({
    required _i35.ApplicationInfo applicationInfo,
    _i33.Key? key,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          StudentWebProfileRoute.name,
          args: StudentWebProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebProfileRoute';

  static const _i31.PageInfo<StudentWebProfileRouteArgs> page =
      _i31.PageInfo<StudentWebProfileRouteArgs>(name);
}

class StudentWebProfileRouteArgs {
  const StudentWebProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i35.ApplicationInfo applicationInfo;

  final _i33.Key? key;

  @override
  String toString() {
    return 'StudentWebProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i30.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i31.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i31.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}
