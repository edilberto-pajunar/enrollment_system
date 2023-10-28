// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i41;
import 'package:flutter/material.dart' as _i43;
import 'package:web_school/models/application/application.dart' as _i46;
import 'package:web_school/models/instructor.dart' as _i42;
import 'package:web_school/models/payment.dart' as _i47;
import 'package:web_school/models/student/subject.dart' as _i45;
import 'package:web_school/models/user.dart' as _i44;
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
import 'package:web_school/views/screens/admin/payment/summary.dart' as _i38;
import 'package:web_school/views/screens/admin/payment/update.dart' as _i22;
import 'package:web_school/views/screens/admin/student/list.dart' as _i10;
import 'package:web_school/views/screens/admin/student/profile.dart' as _i9;
import 'package:web_school/views/screens/admin/student/schedule.dart' as _i8;
import 'package:web_school/views/screens/auth/login.dart' as _i19;
import 'package:web_school/views/screens/forms/form.dart' as _i13;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i11;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i14;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i39;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i12;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i20;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i21;
import 'package:web_school/views/screens/instructor/grade.dart' as _i15;
import 'package:web_school/views/screens/instructor/home.dart' as _i16;
import 'package:web_school/views/screens/instructor/profile.dart' as _i17;
import 'package:web_school/views/screens/instructor/schedule.dart' as _i18;
import 'package:web_school/views/screens/mobile/home.dart' as _i24;
import 'package:web_school/views/screens/responsive/layout.dart' as _i23;
import 'package:web_school/views/screens/responsive/student.dart' as _i26;
import 'package:web_school/views/screens/student/mobile/home.dart' as _i29;
import 'package:web_school/views/screens/student/mobile/payment/home.dart'
    as _i33;
import 'package:web_school/views/screens/student/mobile/profile/change_pass.dart'
    as _i27;
import 'package:web_school/views/screens/student/mobile/profile/enrollment.dart'
    as _i28;
import 'package:web_school/views/screens/student/mobile/profile/info.dart'
    as _i30;
import 'package:web_school/views/screens/student/mobile/profile/profile.dart'
    as _i31;
import 'package:web_school/views/screens/student/mobile/profile/schedule.dart'
    as _i32;
import 'package:web_school/views/screens/student/web/profile/change_pass.dart'
    as _i34;
import 'package:web_school/views/screens/student/web/profile/enrollment.dart'
    as _i35;
import 'package:web_school/views/screens/student/web/profile/profile.dart'
    as _i36;
import 'package:web_school/views/screens/student/web/profile/schedule.dart'
    as _i37;
import 'package:web_school/views/screens/web/home.dart' as _i25;
import 'package:web_school/views/screens/web/student/home.dart' as _i40;

abstract class $AppRouter extends _i41.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i41.PageFactory> pagesMap = {
    AdminAddInstructorRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAddInstructorScreen(),
      );
    },
    AdminEditInstructorRoute.name: (routeData) {
      final args = routeData.argsAs<AdminEditInstructorRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AdminEditInstructorScreen(
          instructorData: args.instructorData,
          key: args.key,
        ),
      );
    },
    AdminHomeRoute.name: (routeData) {
      final args = routeData.argsAs<AdminHomeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AdminHomeScreen(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    AdminInstructorGradeRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminInstructorGradeScreen(),
      );
    },
    AdminInstructorHomeRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AdminInstructorHomeScreen(),
      );
    },
    AdminInstructorSectionRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminInstructorSectionScreen(),
      );
    },
    AdminInstructorStudentListRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminInstructorStudentListScreen(),
      );
    },
    AdminScheduleStudentRoute.name: (routeData) {
      final args = routeData.argsAs<AdminScheduleStudentRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
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
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.AdminStudentProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    AdminStudentsRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.AdminStudentsScreen(),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.FormsScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.IncomingJuniorFormScreen(),
      );
    },
    InstructorGradeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorGradeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.InstructorGradeScreen(
          isJunior: args.isJunior,
          studentData: args.studentData,
          instructor: args.instructor,
          key: args.key,
        ),
      );
    },
    InstructorHomeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorHomeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.InstructorHomeScreen(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    InstructorProfileRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorProfileRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.InstructorProfileScreen(
          instructor: args.instructor,
          key: args.key,
        ),
      );
    },
    InstructorScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorScheduleRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.InstructorScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.OtherSchoolScreen(),
      );
    },
    PaymentUpdateRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentUpdateRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i22.PaymentUpdateScreen(
          payment: args.payment,
          key: args.key,
        ),
      );
    },
    ResponsiveBuilder.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.ResponsiveBuilder(),
      );
    },
    ResponsiveMobileRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ResponsiveMobileScreen(),
      );
    },
    ResponsiveWebRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ResponsiveWebScreen(),
      );
    },
    StudentLayoutBuilder.name: (routeData) {
      final args = routeData.argsAs<StudentLayoutBuilderArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i26.StudentLayoutBuilder(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    StudentMobileChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileChangePassRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.StudentMobileChangePassScreen(
          currentPassword: args.currentPassword,
          key: args.key,
        ),
      );
    },
    StudentMobileEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileEnrollmentRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.StudentMobileEnrollmentScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileHomeRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileHomeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.StudentMobileHomeScreen(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    StudentMobileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileInfoRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.StudentMobileInfoScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileProfileRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.StudentMobileProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileScheduleRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.StudentMobileScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentPaymentHomeRoute.name: (routeData) {
      final args = routeData.argsAs<StudentPaymentHomeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.StudentPaymentHomeScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebChangePassRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.StudentWebChangePassScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebEnrollmentRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.StudentWebEnrollmentScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebProfileRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.StudentWebProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebScheduleRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.StudentWebScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    SummaryPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryPaymentRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.SummaryPaymentScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i39.TransfereeJuniorScreen(),
      );
    },
    WebStudentHomeRoute.name: (routeData) {
      final args = routeData.argsAs<WebStudentHomeRouteArgs>();
      return _i41.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i40.WebStudentHomeScreen(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAddInstructorScreen]
class AdminAddInstructorRoute extends _i41.PageRouteInfo<void> {
  const AdminAddInstructorRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminAddInstructorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAddInstructorRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminEditInstructorScreen]
class AdminEditInstructorRoute
    extends _i41.PageRouteInfo<AdminEditInstructorRouteArgs> {
  AdminEditInstructorRoute({
    required _i42.Instructor instructorData,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          AdminEditInstructorRoute.name,
          args: AdminEditInstructorRouteArgs(
            instructorData: instructorData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminEditInstructorRoute';

  static const _i41.PageInfo<AdminEditInstructorRouteArgs> page =
      _i41.PageInfo<AdminEditInstructorRouteArgs>(name);
}

class AdminEditInstructorRouteArgs {
  const AdminEditInstructorRouteArgs({
    required this.instructorData,
    this.key,
  });

  final _i42.Instructor instructorData;

  final _i43.Key? key;

  @override
  String toString() {
    return 'AdminEditInstructorRouteArgs{instructorData: $instructorData, key: $key}';
  }
}

/// generated route for
/// [_i3.AdminHomeScreen]
class AdminHomeRoute extends _i41.PageRouteInfo<AdminHomeRouteArgs> {
  AdminHomeRoute({
    required _i44.UserModel userModel,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          AdminHomeRoute.name,
          args: AdminHomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i41.PageInfo<AdminHomeRouteArgs> page =
      _i41.PageInfo<AdminHomeRouteArgs>(name);
}

class AdminHomeRouteArgs {
  const AdminHomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i44.UserModel userModel;

  final _i43.Key? key;

  @override
  String toString() {
    return 'AdminHomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i4.AdminInstructorGradeScreen]
class AdminInstructorGradeRoute extends _i41.PageRouteInfo<void> {
  const AdminInstructorGradeRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminInstructorGradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorGradeRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminInstructorHomeScreen]
class AdminInstructorHomeRoute extends _i41.PageRouteInfo<void> {
  const AdminInstructorHomeRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminInstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorHomeRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i6.AdminInstructorSectionScreen]
class AdminInstructorSectionRoute extends _i41.PageRouteInfo<void> {
  const AdminInstructorSectionRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminInstructorSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorSectionRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminInstructorStudentListScreen]
class AdminInstructorStudentListRoute extends _i41.PageRouteInfo<void> {
  const AdminInstructorStudentListRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminInstructorStudentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorStudentListRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminScheduleStudentScreen]
class AdminScheduleStudentRoute
    extends _i41.PageRouteInfo<AdminScheduleStudentRouteArgs> {
  AdminScheduleStudentRoute({
    required List<_i45.Subject> subjectList,
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
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

  static const _i41.PageInfo<AdminScheduleStudentRouteArgs> page =
      _i41.PageInfo<AdminScheduleStudentRouteArgs>(name);
}

class AdminScheduleStudentRouteArgs {
  const AdminScheduleStudentRouteArgs({
    required this.subjectList,
    required this.applicationInfo,
    this.key,
  });

  final List<_i45.Subject> subjectList;

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'AdminScheduleStudentRouteArgs{subjectList: $subjectList, applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i9.AdminStudentProfileScreen]
class AdminStudentProfileRoute
    extends _i41.PageRouteInfo<AdminStudentProfileRouteArgs> {
  AdminStudentProfileRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          AdminStudentProfileRoute.name,
          args: AdminStudentProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i41.PageInfo<AdminStudentProfileRouteArgs> page =
      _i41.PageInfo<AdminStudentProfileRouteArgs>(name);
}

class AdminStudentProfileRouteArgs {
  const AdminStudentProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'AdminStudentProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i10.AdminStudentsScreen]
class AdminStudentsRoute extends _i41.PageRouteInfo<void> {
  const AdminStudentsRoute({List<_i41.PageRouteInfo>? children})
      : super(
          AdminStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentsRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i11.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i41.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i41.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i13.FormsScreen]
class FormsRoute extends _i41.PageRouteInfo<void> {
  const FormsRoute({List<_i41.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i14.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i41.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i41.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i15.InstructorGradeScreen]
class InstructorGradeRoute
    extends _i41.PageRouteInfo<InstructorGradeRouteArgs> {
  InstructorGradeRoute({
    required bool isJunior,
    required _i46.ApplicationInfo studentData,
    required _i42.Instructor instructor,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          InstructorGradeRoute.name,
          args: InstructorGradeRouteArgs(
            isJunior: isJunior,
            studentData: studentData,
            instructor: instructor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorGradeRoute';

  static const _i41.PageInfo<InstructorGradeRouteArgs> page =
      _i41.PageInfo<InstructorGradeRouteArgs>(name);
}

class InstructorGradeRouteArgs {
  const InstructorGradeRouteArgs({
    required this.isJunior,
    required this.studentData,
    required this.instructor,
    this.key,
  });

  final bool isJunior;

  final _i46.ApplicationInfo studentData;

  final _i42.Instructor instructor;

  final _i43.Key? key;

  @override
  String toString() {
    return 'InstructorGradeRouteArgs{isJunior: $isJunior, studentData: $studentData, instructor: $instructor, key: $key}';
  }
}

/// generated route for
/// [_i16.InstructorHomeScreen]
class InstructorHomeRoute extends _i41.PageRouteInfo<InstructorHomeRouteArgs> {
  InstructorHomeRoute({
    required _i44.UserModel userModel,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          InstructorHomeRoute.name,
          args: InstructorHomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorHomeRoute';

  static const _i41.PageInfo<InstructorHomeRouteArgs> page =
      _i41.PageInfo<InstructorHomeRouteArgs>(name);
}

class InstructorHomeRouteArgs {
  const InstructorHomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i44.UserModel userModel;

  final _i43.Key? key;

  @override
  String toString() {
    return 'InstructorHomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i17.InstructorProfileScreen]
class InstructorProfileRoute
    extends _i41.PageRouteInfo<InstructorProfileRouteArgs> {
  InstructorProfileRoute({
    required _i42.Instructor instructor,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          InstructorProfileRoute.name,
          args: InstructorProfileRouteArgs(
            instructor: instructor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorProfileRoute';

  static const _i41.PageInfo<InstructorProfileRouteArgs> page =
      _i41.PageInfo<InstructorProfileRouteArgs>(name);
}

class InstructorProfileRouteArgs {
  const InstructorProfileRouteArgs({
    required this.instructor,
    this.key,
  });

  final _i42.Instructor instructor;

  final _i43.Key? key;

  @override
  String toString() {
    return 'InstructorProfileRouteArgs{instructor: $instructor, key: $key}';
  }
}

/// generated route for
/// [_i18.InstructorScheduleScreen]
class InstructorScheduleRoute
    extends _i41.PageRouteInfo<InstructorScheduleRouteArgs> {
  InstructorScheduleRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          InstructorScheduleRoute.name,
          args: InstructorScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorScheduleRoute';

  static const _i41.PageInfo<InstructorScheduleRouteArgs> page =
      _i41.PageInfo<InstructorScheduleRouteArgs>(name);
}

class InstructorScheduleRouteArgs {
  const InstructorScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'InstructorScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i19.LoginScreen]
class LoginRoute extends _i41.PageRouteInfo<void> {
  const LoginRoute({List<_i41.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i20.NewSeniorScreen]
class NewSeniorRoute extends _i41.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i41.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i21.OtherSchoolScreen]
class OtherSchoolRoute extends _i41.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i41.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PaymentUpdateScreen]
class PaymentUpdateRoute extends _i41.PageRouteInfo<PaymentUpdateRouteArgs> {
  PaymentUpdateRoute({
    required _i47.Payment payment,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          PaymentUpdateRoute.name,
          args: PaymentUpdateRouteArgs(
            payment: payment,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentUpdateRoute';

  static const _i41.PageInfo<PaymentUpdateRouteArgs> page =
      _i41.PageInfo<PaymentUpdateRouteArgs>(name);
}

class PaymentUpdateRouteArgs {
  const PaymentUpdateRouteArgs({
    required this.payment,
    this.key,
  });

  final _i47.Payment payment;

  final _i43.Key? key;

  @override
  String toString() {
    return 'PaymentUpdateRouteArgs{payment: $payment, key: $key}';
  }
}

/// generated route for
/// [_i23.ResponsiveBuilder]
class ResponsiveBuilder extends _i41.PageRouteInfo<void> {
  const ResponsiveBuilder({List<_i41.PageRouteInfo>? children})
      : super(
          ResponsiveBuilder.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveBuilder';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i24.ResponsiveMobileScreen]
class ResponsiveMobileRoute extends _i41.PageRouteInfo<void> {
  const ResponsiveMobileRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ResponsiveMobileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveMobileRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ResponsiveWebScreen]
class ResponsiveWebRoute extends _i41.PageRouteInfo<void> {
  const ResponsiveWebRoute({List<_i41.PageRouteInfo>? children})
      : super(
          ResponsiveWebRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveWebRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i26.StudentLayoutBuilder]
class StudentLayoutBuilder
    extends _i41.PageRouteInfo<StudentLayoutBuilderArgs> {
  StudentLayoutBuilder({
    required _i44.UserModel userModel,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentLayoutBuilder.name,
          args: StudentLayoutBuilderArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentLayoutBuilder';

  static const _i41.PageInfo<StudentLayoutBuilderArgs> page =
      _i41.PageInfo<StudentLayoutBuilderArgs>(name);
}

class StudentLayoutBuilderArgs {
  const StudentLayoutBuilderArgs({
    required this.userModel,
    this.key,
  });

  final _i44.UserModel userModel;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentLayoutBuilderArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i27.StudentMobileChangePassScreen]
class StudentMobileChangePassRoute
    extends _i41.PageRouteInfo<StudentMobileChangePassRouteArgs> {
  StudentMobileChangePassRoute({
    required String currentPassword,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileChangePassRoute.name,
          args: StudentMobileChangePassRouteArgs(
            currentPassword: currentPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileChangePassRoute';

  static const _i41.PageInfo<StudentMobileChangePassRouteArgs> page =
      _i41.PageInfo<StudentMobileChangePassRouteArgs>(name);
}

class StudentMobileChangePassRouteArgs {
  const StudentMobileChangePassRouteArgs({
    required this.currentPassword,
    this.key,
  });

  final String currentPassword;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileChangePassRouteArgs{currentPassword: $currentPassword, key: $key}';
  }
}

/// generated route for
/// [_i28.StudentMobileEnrollmentScreen]
class StudentMobileEnrollmentRoute
    extends _i41.PageRouteInfo<StudentMobileEnrollmentRouteArgs> {
  StudentMobileEnrollmentRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileEnrollmentRoute.name,
          args: StudentMobileEnrollmentRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileEnrollmentRoute';

  static const _i41.PageInfo<StudentMobileEnrollmentRouteArgs> page =
      _i41.PageInfo<StudentMobileEnrollmentRouteArgs>(name);
}

class StudentMobileEnrollmentRouteArgs {
  const StudentMobileEnrollmentRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileEnrollmentRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i29.StudentMobileHomeScreen]
class StudentMobileHomeRoute
    extends _i41.PageRouteInfo<StudentMobileHomeRouteArgs> {
  StudentMobileHomeRoute({
    required _i44.UserModel userModel,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileHomeRoute.name,
          args: StudentMobileHomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileHomeRoute';

  static const _i41.PageInfo<StudentMobileHomeRouteArgs> page =
      _i41.PageInfo<StudentMobileHomeRouteArgs>(name);
}

class StudentMobileHomeRouteArgs {
  const StudentMobileHomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i44.UserModel userModel;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileHomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i30.StudentMobileInfoScreen]
class StudentMobileInfoRoute
    extends _i41.PageRouteInfo<StudentMobileInfoRouteArgs> {
  StudentMobileInfoRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileInfoRoute.name,
          args: StudentMobileInfoRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileInfoRoute';

  static const _i41.PageInfo<StudentMobileInfoRouteArgs> page =
      _i41.PageInfo<StudentMobileInfoRouteArgs>(name);
}

class StudentMobileInfoRouteArgs {
  const StudentMobileInfoRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileInfoRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i31.StudentMobileProfileScreen]
class StudentMobileProfileRoute
    extends _i41.PageRouteInfo<StudentMobileProfileRouteArgs> {
  StudentMobileProfileRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileProfileRoute.name,
          args: StudentMobileProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileProfileRoute';

  static const _i41.PageInfo<StudentMobileProfileRouteArgs> page =
      _i41.PageInfo<StudentMobileProfileRouteArgs>(name);
}

class StudentMobileProfileRouteArgs {
  const StudentMobileProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i32.StudentMobileScheduleScreen]
class StudentMobileScheduleRoute
    extends _i41.PageRouteInfo<StudentMobileScheduleRouteArgs> {
  StudentMobileScheduleRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentMobileScheduleRoute.name,
          args: StudentMobileScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileScheduleRoute';

  static const _i41.PageInfo<StudentMobileScheduleRouteArgs> page =
      _i41.PageInfo<StudentMobileScheduleRouteArgs>(name);
}

class StudentMobileScheduleRouteArgs {
  const StudentMobileScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentMobileScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i33.StudentPaymentHomeScreen]
class StudentPaymentHomeRoute
    extends _i41.PageRouteInfo<StudentPaymentHomeRouteArgs> {
  StudentPaymentHomeRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentPaymentHomeRoute.name,
          args: StudentPaymentHomeRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentPaymentHomeRoute';

  static const _i41.PageInfo<StudentPaymentHomeRouteArgs> page =
      _i41.PageInfo<StudentPaymentHomeRouteArgs>(name);
}

class StudentPaymentHomeRouteArgs {
  const StudentPaymentHomeRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentPaymentHomeRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i34.StudentWebChangePassScreen]
class StudentWebChangePassRoute
    extends _i41.PageRouteInfo<StudentWebChangePassRouteArgs> {
  StudentWebChangePassRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentWebChangePassRoute.name,
          args: StudentWebChangePassRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebChangePassRoute';

  static const _i41.PageInfo<StudentWebChangePassRouteArgs> page =
      _i41.PageInfo<StudentWebChangePassRouteArgs>(name);
}

class StudentWebChangePassRouteArgs {
  const StudentWebChangePassRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentWebChangePassRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i35.StudentWebEnrollmentScreen]
class StudentWebEnrollmentRoute
    extends _i41.PageRouteInfo<StudentWebEnrollmentRouteArgs> {
  StudentWebEnrollmentRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentWebEnrollmentRoute.name,
          args: StudentWebEnrollmentRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebEnrollmentRoute';

  static const _i41.PageInfo<StudentWebEnrollmentRouteArgs> page =
      _i41.PageInfo<StudentWebEnrollmentRouteArgs>(name);
}

class StudentWebEnrollmentRouteArgs {
  const StudentWebEnrollmentRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentWebEnrollmentRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i36.StudentWebProfileScreen]
class StudentWebProfileRoute
    extends _i41.PageRouteInfo<StudentWebProfileRouteArgs> {
  StudentWebProfileRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentWebProfileRoute.name,
          args: StudentWebProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebProfileRoute';

  static const _i41.PageInfo<StudentWebProfileRouteArgs> page =
      _i41.PageInfo<StudentWebProfileRouteArgs>(name);
}

class StudentWebProfileRouteArgs {
  const StudentWebProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentWebProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i37.StudentWebScheduleScreen]
class StudentWebScheduleRoute
    extends _i41.PageRouteInfo<StudentWebScheduleRouteArgs> {
  StudentWebScheduleRoute({
    required _i46.ApplicationInfo applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          StudentWebScheduleRoute.name,
          args: StudentWebScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebScheduleRoute';

  static const _i41.PageInfo<StudentWebScheduleRouteArgs> page =
      _i41.PageInfo<StudentWebScheduleRouteArgs>(name);
}

class StudentWebScheduleRouteArgs {
  const StudentWebScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i46.ApplicationInfo applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'StudentWebScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i38.SummaryPaymentScreen]
class SummaryPaymentRoute extends _i41.PageRouteInfo<SummaryPaymentRouteArgs> {
  SummaryPaymentRoute({
    required List<_i46.ApplicationInfo> applicationInfo,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          SummaryPaymentRoute.name,
          args: SummaryPaymentRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryPaymentRoute';

  static const _i41.PageInfo<SummaryPaymentRouteArgs> page =
      _i41.PageInfo<SummaryPaymentRouteArgs>(name);
}

class SummaryPaymentRouteArgs {
  const SummaryPaymentRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final List<_i46.ApplicationInfo> applicationInfo;

  final _i43.Key? key;

  @override
  String toString() {
    return 'SummaryPaymentRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i39.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i41.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i41.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i41.PageInfo<void> page = _i41.PageInfo<void>(name);
}

/// generated route for
/// [_i40.WebStudentHomeScreen]
class WebStudentHomeRoute extends _i41.PageRouteInfo<WebStudentHomeRouteArgs> {
  WebStudentHomeRoute({
    required _i44.UserModel userModel,
    _i43.Key? key,
    List<_i41.PageRouteInfo>? children,
  }) : super(
          WebStudentHomeRoute.name,
          args: WebStudentHomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'WebStudentHomeRoute';

  static const _i41.PageInfo<WebStudentHomeRouteArgs> page =
      _i41.PageInfo<WebStudentHomeRouteArgs>(name);
}

class WebStudentHomeRouteArgs {
  const WebStudentHomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i44.UserModel userModel;

  final _i43.Key? key;

  @override
  String toString() {
    return 'WebStudentHomeRouteArgs{userModel: $userModel, key: $key}';
  }
}
