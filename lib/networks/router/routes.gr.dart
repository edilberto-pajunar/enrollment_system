// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i34;
import 'package:flutter/material.dart' as _i36;
import 'package:web_school/models/application/application.dart' as _i38;
import 'package:web_school/models/application/student.dart' as _i39;
import 'package:web_school/models/instructor.dart' as _i35;
import 'package:web_school/models/student/subject.dart' as _i37;
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
import 'package:web_school/views/screens/admin/student/list.dart' as _i10;
import 'package:web_school/views/screens/admin/student/profile.dart' as _i9;
import 'package:web_school/views/screens/admin/student/schedule.dart' as _i8;
import 'package:web_school/views/screens/auth/home.dart' as _i15;
import 'package:web_school/views/screens/auth/login.dart' as _i20;
import 'package:web_school/views/screens/forms/form.dart' as _i14;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i12;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i16;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i33;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i13;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i21;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i22;
import 'package:web_school/views/screens/instructor/grade.dart' as _i17;
import 'package:web_school/views/screens/instructor/home.dart' as _i18;
import 'package:web_school/views/screens/instructor/schedule.dart' as _i19;
import 'package:web_school/views/screens/student/builder.dart' as _i23;
import 'package:web_school/views/screens/student/mobile/home.dart' as _i25;
import 'package:web_school/views/screens/student/mobile/profile/change_pass.dart'
    as _i11;
import 'package:web_school/views/screens/student/mobile/profile/enrollment.dart'
    as _i24;
import 'package:web_school/views/screens/student/mobile/profile/info.dart'
    as _i26;
import 'package:web_school/views/screens/student/mobile/profile/profile.dart'
    as _i27;
import 'package:web_school/views/screens/student/mobile/profile/schedule.dart'
    as _i28;
import 'package:web_school/views/screens/student/web/home.dart' as _i31;
import 'package:web_school/views/screens/student/web/profile/change_pass.dart'
    as _i29;
import 'package:web_school/views/screens/student/web/profile/enrollment.dart'
    as _i30;
import 'package:web_school/views/screens/student/web/profile/profile.dart'
    as _i32;

abstract class $AppRouter extends _i34.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i34.PageFactory> pagesMap = {
    AdminAddInstructorRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAddInstructorScreen(),
      );
    },
    AdminEditInstructorRoute.name: (routeData) {
      final args = routeData.argsAs<AdminEditInstructorRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AdminEditInstructorScreen(
          instructorData: args.instructorData,
          key: args.key,
        ),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AdminHomeScreen(),
      );
    },
    AdminInstructorGradeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminInstructorGradeScreen(),
      );
    },
    AdminInstructorHomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminInstructorHomeScreen(),
      );
    },
    AdminInstructorSectionRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminInstructorSectionScreen(),
      );
    },
    AdminInstructorStudentListRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminInstructorStudentListScreen(),
      );
    },
    AdminScheduleStudentRoute.name: (routeData) {
      final args = routeData.argsAs<AdminScheduleStudentRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.AdminScheduleStudentScreen(
          subjectList: args.subjectList,
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    AdminStudentProfileRoute.name: (routeData) {
      final args = routeData.argsAs<AdminStudentProfileRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.AdminStudentProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    AdminStudentsRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AdminStudentsScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.ChangePasswordScreen(
          currentPassword: args.currentPassword,
          key: args.key,
        ),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.FormsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.HomeScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.IncomingJuniorFormScreen(),
      );
    },
    InstructorGradeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorGradeRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.InstructorGradeScreen(
          isJunior: args.isJunior,
          key: args.key,
        ),
      );
    },
    InstructorHomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.InstructorHomeScreen(),
      );
    },
    InstructorScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorScheduleRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.InstructorScheduleScreen(
          subjectList: args.subjectList,
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.OtherSchoolScreen(),
      );
    },
    StudentLayoutBuilder.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.StudentLayoutBuilder(),
      );
    },
    StudentMobileEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileEnrollmentRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i24.StudentMobileEnrollmentScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileHomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.StudentMobileHomeScreen(),
      );
    },
    StudentMobileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileInfoRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.StudentMobileInfoScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileProfileRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.StudentMobileProfileScreen(),
      );
    },
    StudentScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentScheduleRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.StudentScheduleScreen(
          subjectList: args.subjectList,
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebChangePassRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.StudentWebChangePassScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentWebEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebEnrollmentRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.StudentWebEnrollmentScreen(
          studentInfo: args.studentInfo,
          key: args.key,
        ),
      );
    },
    StudentWebHomeRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i31.StudentWebHomeScreen(),
      );
    },
    StudentWebProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebProfileRouteArgs>();
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.StudentWebProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i34.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i33.TransfereeJuniorScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAddInstructorScreen]
class AdminAddInstructorRoute extends _i34.PageRouteInfo<void> {
  const AdminAddInstructorRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminAddInstructorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAddInstructorRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminEditInstructorScreen]
class AdminEditInstructorRoute
    extends _i34.PageRouteInfo<AdminEditInstructorRouteArgs> {
  AdminEditInstructorRoute({
    required _i35.Instructor instructorData,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          AdminEditInstructorRoute.name,
          args: AdminEditInstructorRouteArgs(
            instructorData: instructorData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminEditInstructorRoute';

  static const _i34.PageInfo<AdminEditInstructorRouteArgs> page =
      _i34.PageInfo<AdminEditInstructorRouteArgs>(name);
}

class AdminEditInstructorRouteArgs {
  const AdminEditInstructorRouteArgs({
    required this.instructorData,
    this.key,
  });

  final _i35.Instructor instructorData;

  final _i36.Key? key;

  @override
  String toString() {
    return 'AdminEditInstructorRouteArgs{instructorData: $instructorData, key: $key}';
  }
}

/// generated route for
/// [_i3.AdminHomeScreen]
class AdminHomeRoute extends _i34.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AdminInstructorGradeScreen]
class AdminInstructorGradeRoute extends _i34.PageRouteInfo<void> {
  const AdminInstructorGradeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminInstructorGradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorGradeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminInstructorHomeScreen]
class AdminInstructorHomeRoute extends _i34.PageRouteInfo<void> {
  const AdminInstructorHomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminInstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorHomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminInstructorSectionScreen]
class AdminInstructorSectionRoute extends _i34.PageRouteInfo<void> {
  const AdminInstructorSectionRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminInstructorSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorSectionRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminInstructorStudentListScreen]
class AdminInstructorStudentListRoute extends _i34.PageRouteInfo<void> {
  const AdminInstructorStudentListRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminInstructorStudentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorStudentListRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminScheduleStudentScreen]
class AdminScheduleStudentRoute
    extends _i34.PageRouteInfo<AdminScheduleStudentRouteArgs> {
  AdminScheduleStudentRoute({
    required List<_i37.Subject> subjectList,
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          AdminScheduleStudentRoute.name,
          args: AdminScheduleStudentRouteArgs(
            subjectList: subjectList,
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminScheduleStudentRoute';

  static const _i34.PageInfo<AdminScheduleStudentRouteArgs> page =
      _i34.PageInfo<AdminScheduleStudentRouteArgs>(name);
}

class AdminScheduleStudentRouteArgs {
  const AdminScheduleStudentRouteArgs({
    required this.subjectList,
    required this.applicationInfo,
    this.key,
  });

  final List<_i37.Subject> subjectList;

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'AdminScheduleStudentRouteArgs{subjectList: $subjectList, applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i9.AdminStudentProfileScreen]
class AdminStudentProfileRoute
    extends _i34.PageRouteInfo<AdminStudentProfileRouteArgs> {
  AdminStudentProfileRoute({
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          AdminStudentProfileRoute.name,
          args: AdminStudentProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i34.PageInfo<AdminStudentProfileRouteArgs> page =
      _i34.PageInfo<AdminStudentProfileRouteArgs>(name);
}

class AdminStudentProfileRouteArgs {
  const AdminStudentProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'AdminStudentProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i10.AdminStudentsScreen]
class AdminStudentsRoute extends _i34.PageRouteInfo<void> {
  const AdminStudentsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          AdminStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentsRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ChangePasswordScreen]
class ChangePasswordRoute extends _i34.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String currentPassword,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(
            currentPassword: currentPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i34.PageInfo<ChangePasswordRouteArgs> page =
      _i34.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    required this.currentPassword,
    this.key,
  });

  final String currentPassword;

  final _i36.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{currentPassword: $currentPassword, key: $key}';
  }
}

/// generated route for
/// [_i12.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i34.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i13.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i34.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i34.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i14.FormsScreen]
class FormsRoute extends _i34.PageRouteInfo<void> {
  const FormsRoute({List<_i34.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i15.HomeScreen]
class HomeRoute extends _i34.PageRouteInfo<void> {
  const HomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i16.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i34.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i34.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i17.InstructorGradeScreen]
class InstructorGradeRoute
    extends _i34.PageRouteInfo<InstructorGradeRouteArgs> {
  InstructorGradeRoute({
    required bool isJunior,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          InstructorGradeRoute.name,
          args: InstructorGradeRouteArgs(
            isJunior: isJunior,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorGradeRoute';

  static const _i34.PageInfo<InstructorGradeRouteArgs> page =
      _i34.PageInfo<InstructorGradeRouteArgs>(name);
}

class InstructorGradeRouteArgs {
  const InstructorGradeRouteArgs({
    required this.isJunior,
    this.key,
  });

  final bool isJunior;

  final _i36.Key? key;

  @override
  String toString() {
    return 'InstructorGradeRouteArgs{isJunior: $isJunior, key: $key}';
  }
}

/// generated route for
/// [_i18.InstructorHomeScreen]
class InstructorHomeRoute extends _i34.PageRouteInfo<void> {
  const InstructorHomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          InstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructorHomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i19.InstructorScheduleScreen]
class InstructorScheduleRoute
    extends _i34.PageRouteInfo<InstructorScheduleRouteArgs> {
  InstructorScheduleRoute({
    required List<_i37.Subject> subjectList,
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          InstructorScheduleRoute.name,
          args: InstructorScheduleRouteArgs(
            subjectList: subjectList,
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorScheduleRoute';

  static const _i34.PageInfo<InstructorScheduleRouteArgs> page =
      _i34.PageInfo<InstructorScheduleRouteArgs>(name);
}

class InstructorScheduleRouteArgs {
  const InstructorScheduleRouteArgs({
    required this.subjectList,
    required this.applicationInfo,
    this.key,
  });

  final List<_i37.Subject> subjectList;

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'InstructorScheduleRouteArgs{subjectList: $subjectList, applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i20.LoginScreen]
class LoginRoute extends _i34.PageRouteInfo<void> {
  const LoginRoute({List<_i34.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i21.NewSeniorScreen]
class NewSeniorRoute extends _i34.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i34.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i22.OtherSchoolScreen]
class OtherSchoolRoute extends _i34.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i34.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i23.StudentLayoutBuilder]
class StudentLayoutBuilder extends _i34.PageRouteInfo<void> {
  const StudentLayoutBuilder({List<_i34.PageRouteInfo>? children})
      : super(
          StudentLayoutBuilder.name,
          initialChildren: children,
        );

  static const String name = 'StudentLayoutBuilder';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i24.StudentMobileEnrollmentScreen]
class StudentMobileEnrollmentRoute
    extends _i34.PageRouteInfo<StudentMobileEnrollmentRouteArgs> {
  StudentMobileEnrollmentRoute({
    required _i39.StudentInfo studentInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentMobileEnrollmentRoute.name,
          args: StudentMobileEnrollmentRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileEnrollmentRoute';

  static const _i34.PageInfo<StudentMobileEnrollmentRouteArgs> page =
      _i34.PageInfo<StudentMobileEnrollmentRouteArgs>(name);
}

class StudentMobileEnrollmentRouteArgs {
  const StudentMobileEnrollmentRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i39.StudentInfo studentInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentMobileEnrollmentRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i25.StudentMobileHomeScreen]
class StudentMobileHomeRoute extends _i34.PageRouteInfo<void> {
  const StudentMobileHomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          StudentMobileHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileHomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StudentMobileInfoScreen]
class StudentMobileInfoRoute
    extends _i34.PageRouteInfo<StudentMobileInfoRouteArgs> {
  StudentMobileInfoRoute({
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentMobileInfoRoute.name,
          args: StudentMobileInfoRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileInfoRoute';

  static const _i34.PageInfo<StudentMobileInfoRouteArgs> page =
      _i34.PageInfo<StudentMobileInfoRouteArgs>(name);
}

class StudentMobileInfoRouteArgs {
  const StudentMobileInfoRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentMobileInfoRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i27.StudentMobileProfileScreen]
class StudentMobileProfileRoute extends _i34.PageRouteInfo<void> {
  const StudentMobileProfileRoute({List<_i34.PageRouteInfo>? children})
      : super(
          StudentMobileProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileProfileRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i28.StudentScheduleScreen]
class StudentScheduleRoute
    extends _i34.PageRouteInfo<StudentScheduleRouteArgs> {
  StudentScheduleRoute({
    required List<_i37.Subject> subjectList,
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentScheduleRoute.name,
          args: StudentScheduleRouteArgs(
            subjectList: subjectList,
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentScheduleRoute';

  static const _i34.PageInfo<StudentScheduleRouteArgs> page =
      _i34.PageInfo<StudentScheduleRouteArgs>(name);
}

class StudentScheduleRouteArgs {
  const StudentScheduleRouteArgs({
    required this.subjectList,
    required this.applicationInfo,
    this.key,
  });

  final List<_i37.Subject> subjectList;

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentScheduleRouteArgs{subjectList: $subjectList, applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i29.StudentWebChangePassScreen]
class StudentWebChangePassRoute
    extends _i34.PageRouteInfo<StudentWebChangePassRouteArgs> {
  StudentWebChangePassRoute({
    required _i39.StudentInfo studentInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentWebChangePassRoute.name,
          args: StudentWebChangePassRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebChangePassRoute';

  static const _i34.PageInfo<StudentWebChangePassRouteArgs> page =
      _i34.PageInfo<StudentWebChangePassRouteArgs>(name);
}

class StudentWebChangePassRouteArgs {
  const StudentWebChangePassRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i39.StudentInfo studentInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentWebChangePassRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i30.StudentWebEnrollmentScreen]
class StudentWebEnrollmentRoute
    extends _i34.PageRouteInfo<StudentWebEnrollmentRouteArgs> {
  StudentWebEnrollmentRoute({
    required _i39.StudentInfo studentInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentWebEnrollmentRoute.name,
          args: StudentWebEnrollmentRouteArgs(
            studentInfo: studentInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebEnrollmentRoute';

  static const _i34.PageInfo<StudentWebEnrollmentRouteArgs> page =
      _i34.PageInfo<StudentWebEnrollmentRouteArgs>(name);
}

class StudentWebEnrollmentRouteArgs {
  const StudentWebEnrollmentRouteArgs({
    required this.studentInfo,
    this.key,
  });

  final _i39.StudentInfo studentInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentWebEnrollmentRouteArgs{studentInfo: $studentInfo, key: $key}';
  }
}

/// generated route for
/// [_i31.StudentWebHomeScreen]
class StudentWebHomeRoute extends _i34.PageRouteInfo<void> {
  const StudentWebHomeRoute({List<_i34.PageRouteInfo>? children})
      : super(
          StudentWebHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentWebHomeRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}

/// generated route for
/// [_i32.StudentWebProfileScreen]
class StudentWebProfileRoute
    extends _i34.PageRouteInfo<StudentWebProfileRouteArgs> {
  StudentWebProfileRoute({
    required _i38.ApplicationInfo applicationInfo,
    _i36.Key? key,
    List<_i34.PageRouteInfo>? children,
  }) : super(
          StudentWebProfileRoute.name,
          args: StudentWebProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebProfileRoute';

  static const _i34.PageInfo<StudentWebProfileRouteArgs> page =
      _i34.PageInfo<StudentWebProfileRouteArgs>(name);
}

class StudentWebProfileRouteArgs {
  const StudentWebProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i38.ApplicationInfo applicationInfo;

  final _i36.Key? key;

  @override
  String toString() {
    return 'StudentWebProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i33.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i34.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i34.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i34.PageInfo<void> page = _i34.PageInfo<void>(name);
}
