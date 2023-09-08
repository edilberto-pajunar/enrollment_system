// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:flutter/material.dart' as _i26;
import 'package:web_school/models/application/application.dart' as _i27;
import 'package:web_school/views/screens/admin/home.dart' as _i2;
import 'package:web_school/views/screens/admin/instructor/add.dart' as _i1;
import 'package:web_school/views/screens/admin/instructor/general/grade.dart'
    as _i3;
import 'package:web_school/views/screens/admin/instructor/general/home.dart'
    as _i4;
import 'package:web_school/views/screens/admin/instructor/general/section.dart'
    as _i5;
import 'package:web_school/views/screens/admin/instructor/general/student/student.dart'
    as _i6;
import 'package:web_school/views/screens/admin/student/list.dart' as _i8;
import 'package:web_school/views/screens/admin/student/profile.dart' as _i7;
import 'package:web_school/views/screens/auth/home.dart' as _i13;
import 'package:web_school/views/screens/auth/login.dart' as _i16;
import 'package:web_school/views/screens/forms/form.dart' as _i12;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i10;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i14;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i24;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i11;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i17;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i18;
import 'package:web_school/views/screens/instructor/home.dart' as _i15;
import 'package:web_school/views/screens/student/builder.dart' as _i19;
import 'package:web_school/views/screens/student/mobile/home.dart' as _i20;
import 'package:web_school/views/screens/student/mobile/profile/change_pass.dart'
    as _i9;
import 'package:web_school/views/screens/student/mobile/profile/info.dart'
    as _i21;
import 'package:web_school/views/screens/student/mobile/profile/profile.dart'
    as _i22;
import 'package:web_school/views/screens/student/web/home.dart' as _i23;

abstract class $AppRouter extends _i25.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AdminAddInstructorRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAddInstructorScreen(),
      );
    },
    AdminHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AdminHomeScreen(),
      );
    },
    AdminInstructorGradeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AdminInstructorGradeScreen(),
      );
    },
    AdminInstructorHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminInstructorHomeScreen(),
      );
    },
    AdminInstructorSectionRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminInstructorSectionScreen(),
      );
    },
    AdminInstructorStudentListRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminInstructorStudentListScreen(),
      );
    },
    AdminStudentProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminStudentProfileScreen(),
      );
    },
    AdminStudentsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AdminStudentsScreen(),
      );
    },
    ChangePasswordRoute.name: (routeData) {
      final args = routeData.argsAs<ChangePasswordRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.ChangePasswordScreen(
          currentPassword: args.currentPassword,
          key: args.key,
        ),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.FormsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.HomeScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.IncomingJuniorFormScreen(),
      );
    },
    InstructorHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.InstructorHomeScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.OtherSchoolScreen(),
      );
    },
    StudentLayoutBuilder.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.StudentLayoutBuilder(),
      );
    },
    StudentMobileHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.StudentMobileHomeScreen(),
      );
    },
    StudentMobileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileInfoRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.StudentMobileInfoScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileProfileRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.StudentMobileProfileScreen(),
      );
    },
    StudentWebHomeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.StudentWebHomeScreen(),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.TransfereeJuniorScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAddInstructorScreen]
class AdminAddInstructorRoute extends _i25.PageRouteInfo<void> {
  const AdminAddInstructorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminAddInstructorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAddInstructorRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminHomeScreen]
class AdminHomeRoute extends _i25.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AdminInstructorGradeScreen]
class AdminInstructorGradeRoute extends _i25.PageRouteInfo<void> {
  const AdminInstructorGradeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminInstructorGradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorGradeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AdminInstructorHomeScreen]
class AdminInstructorHomeRoute extends _i25.PageRouteInfo<void> {
  const AdminInstructorHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminInstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminInstructorSectionScreen]
class AdminInstructorSectionRoute extends _i25.PageRouteInfo<void> {
  const AdminInstructorSectionRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminInstructorSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorSectionRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminInstructorStudentListScreen]
class AdminInstructorStudentListRoute extends _i25.PageRouteInfo<void> {
  const AdminInstructorStudentListRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminInstructorStudentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorStudentListRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminStudentProfileScreen]
class AdminStudentProfileRoute extends _i25.PageRouteInfo<void> {
  const AdminStudentProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminStudentProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminStudentsScreen]
class AdminStudentsRoute extends _i25.PageRouteInfo<void> {
  const AdminStudentsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AdminStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ChangePasswordScreen]
class ChangePasswordRoute extends _i25.PageRouteInfo<ChangePasswordRouteArgs> {
  ChangePasswordRoute({
    required String currentPassword,
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          ChangePasswordRoute.name,
          args: ChangePasswordRouteArgs(
            currentPassword: currentPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ChangePasswordRoute';

  static const _i25.PageInfo<ChangePasswordRouteArgs> page =
      _i25.PageInfo<ChangePasswordRouteArgs>(name);
}

class ChangePasswordRouteArgs {
  const ChangePasswordRouteArgs({
    required this.currentPassword,
    this.key,
  });

  final String currentPassword;

  final _i26.Key? key;

  @override
  String toString() {
    return 'ChangePasswordRouteArgs{currentPassword: $currentPassword, key: $key}';
  }
}

/// generated route for
/// [_i10.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i25.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i25.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i12.FormsScreen]
class FormsRoute extends _i25.PageRouteInfo<void> {
  const FormsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.HomeScreen]
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i25.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i25.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.InstructorHomeScreen]
class InstructorHomeRoute extends _i25.PageRouteInfo<void> {
  const InstructorHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          InstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructorHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.NewSeniorScreen]
class NewSeniorRoute extends _i25.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.OtherSchoolScreen]
class OtherSchoolRoute extends _i25.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i19.StudentLayoutBuilder]
class StudentLayoutBuilder extends _i25.PageRouteInfo<void> {
  const StudentLayoutBuilder({List<_i25.PageRouteInfo>? children})
      : super(
          StudentLayoutBuilder.name,
          initialChildren: children,
        );

  static const String name = 'StudentLayoutBuilder';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.StudentMobileHomeScreen]
class StudentMobileHomeRoute extends _i25.PageRouteInfo<void> {
  const StudentMobileHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          StudentMobileHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.StudentMobileInfoScreen]
class StudentMobileInfoRoute
    extends _i25.PageRouteInfo<StudentMobileInfoRouteArgs> {
  StudentMobileInfoRoute({
    required _i27.ApplicationInfo applicationInfo,
    _i26.Key? key,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          StudentMobileInfoRoute.name,
          args: StudentMobileInfoRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileInfoRoute';

  static const _i25.PageInfo<StudentMobileInfoRouteArgs> page =
      _i25.PageInfo<StudentMobileInfoRouteArgs>(name);
}

class StudentMobileInfoRouteArgs {
  const StudentMobileInfoRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i27.ApplicationInfo applicationInfo;

  final _i26.Key? key;

  @override
  String toString() {
    return 'StudentMobileInfoRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i22.StudentMobileProfileScreen]
class StudentMobileProfileRoute extends _i25.PageRouteInfo<void> {
  const StudentMobileProfileRoute({List<_i25.PageRouteInfo>? children})
      : super(
          StudentMobileProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentMobileProfileRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.StudentWebHomeScreen]
class StudentWebHomeRoute extends _i25.PageRouteInfo<void> {
  const StudentWebHomeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          StudentWebHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentWebHomeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i25.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i25.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
