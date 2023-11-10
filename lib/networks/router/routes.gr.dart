// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i42;
import 'package:flutter/cupertino.dart' as _i47;
import 'package:flutter/material.dart' as _i44;
import 'package:web_school/models/application/application.dart' as _i45;
import 'package:web_school/models/instructor.dart' as _i43;
import 'package:web_school/models/payment.dart' as _i46;
import 'package:web_school/models/user.dart' as _i48;
import 'package:web_school/views/screens/admin/admin_home.dart' as _i3;
import 'package:web_school/views/screens/admin/admin_wrapper.dart' as _i41;
import 'package:web_school/views/screens/admin/body/instructor/add_instructor.dart'
    as _i1;
import 'package:web_school/views/screens/admin/body/instructor/edit_instructor.dart'
    as _i2;
import 'package:web_school/views/screens/admin/body/instructor/general/grade.dart'
    as _i4;
import 'package:web_school/views/screens/admin/body/instructor/general/instructor_list.dart'
    as _i5;
import 'package:web_school/views/screens/admin/body/instructor/general/section.dart'
    as _i6;
import 'package:web_school/views/screens/admin/body/instructor/general/student/student.dart'
    as _i7;
import 'package:web_school/views/screens/admin/body/payment/payment_list.dart'
    as _i39;
import 'package:web_school/views/screens/admin/body/payment/payment_student_list.dart'
    as _i23;
import 'package:web_school/views/screens/admin/body/student/profile/component/profile.dart'
    as _i9;
import 'package:web_school/views/screens/admin/body/student/schedule.dart'
    as _i8;
import 'package:web_school/views/screens/admin/body/student/student_list.dart'
    as _i10;
import 'package:web_school/views/screens/auth/login.dart' as _i20;
import 'package:web_school/views/screens/forms/form.dart' as _i13;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i11;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i14;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i40;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i12;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i21;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i22;
import 'package:web_school/views/screens/instructor/body/profile/profile.dart'
    as _i17;
import 'package:web_school/views/screens/instructor/body/students/grade/junior_grade.dart'
    as _i16;
import 'package:web_school/views/screens/instructor/body/students/grade/senior_grade.dart'
    as _i19;
import 'package:web_school/views/screens/instructor/body/students/schedule.dart'
    as _i18;
import 'package:web_school/views/screens/instructor/home.dart' as _i15;
import 'package:web_school/views/screens/layout/mobile/home.dart' as _i25;
import 'package:web_school/views/screens/layout/web/home.dart' as _i26;
import 'package:web_school/views/screens/responsive/layout.dart' as _i24;
import 'package:web_school/views/screens/student/body/profile/change_pass.dart'
    as _i35;
import 'package:web_school/views/screens/student/body/profile/enrollment.dart'
    as _i36;
import 'package:web_school/views/screens/student/body/profile/profile.dart'
    as _i37;
import 'package:web_school/views/screens/student/body/profile/schedule.dart'
    as _i38;
import 'package:web_school/views/screens/student/home.dart' as _i27;
import 'package:web_school/views/screens/student/mobile/home.dart' as _i30;
import 'package:web_school/views/screens/student/mobile/payment/home.dart'
    as _i34;
import 'package:web_school/views/screens/student/mobile/profile/change_pass.dart'
    as _i28;
import 'package:web_school/views/screens/student/mobile/profile/enrollment.dart'
    as _i29;
import 'package:web_school/views/screens/student/mobile/profile/info.dart'
    as _i31;
import 'package:web_school/views/screens/student/mobile/profile/profile.dart'
    as _i32;
import 'package:web_school/views/screens/student/mobile/profile/schedule.dart'
    as _i33;

abstract class $AppRouter extends _i42.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i42.PageFactory> pagesMap = {
    AdminAddInstructorRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminAddInstructorScreen(),
      );
    },
    AdminEditInstructorRoute.name: (routeData) {
      final args = routeData.argsAs<AdminEditInstructorRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.AdminEditInstructorScreen(
          instructorData: args.instructorData,
          key: args.key,
        ),
      );
    },
    AdminHomeRoute.name: (routeData) {
      final args = routeData.argsAs<AdminHomeRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.AdminHomeScreen(
          studentList: args.studentList,
          paymentList: args.paymentList,
          instructorList: args.instructorList,
          key: args.key,
        ),
      );
    },
    AdminInstructorGradeRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AdminInstructorGradeScreen(),
      );
    },
    AdminInstructorListRoute.name: (routeData) {
      final args = routeData.argsAs<AdminInstructorListRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.AdminInstructorListScreen(
          instructorList: args.instructorList,
          key: args.key,
        ),
      );
    },
    AdminInstructorSectionRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.AdminInstructorSectionScreen(),
      );
    },
    AdminInstructorStudentListRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.AdminInstructorStudentListScreen(),
      );
    },
    AdminScheduleStudentRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.AdminScheduleStudentScreen(),
      );
    },
    AdminStudentProfileRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.AdminStudentProfileScreen(),
      );
    },
    AdminStudentsListRoute.name: (routeData) {
      final args = routeData.argsAs<AdminStudentsListRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.AdminStudentsListScreen(
          studentList: args.studentList,
          key: args.key,
        ),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.FormsScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.IncomingJuniorFormScreen(),
      );
    },
    InstructorHomeRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.InstructorHomeScreen(),
      );
    },
    InstructorJuniorGradeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorJuniorGradeRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.InstructorJuniorGradeScreen(
          isJunior: args.isJunior,
          studentData: args.studentData,
          instructor: args.instructor,
          key: args.key,
        ),
      );
    },
    InstructorProfileRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorProfileRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.InstructorProfileScreen(
          instructor: args.instructor,
          key: args.key,
        ),
      );
    },
    InstructorScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorScheduleRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.InstructorScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    InstructorSeniorGradeRoute.name: (routeData) {
      final args = routeData.argsAs<InstructorSeniorGradeRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.InstructorSeniorGradeScreen(
          isJunior: args.isJunior,
          studentData: args.studentData,
          key: args.key,
        ),
      );
    },
    LoginRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.OtherSchoolScreen(),
      );
    },
    PaymentHistoryRoute.name: (routeData) {
      final args = routeData.argsAs<PaymentHistoryRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.PaymentHistoryScreen(
          applicationInfo: args.applicationInfo,
          paymentList: args.paymentList,
          summaryIndex: args.summaryIndex,
          key: args.key,
        ),
      );
    },
    ResponsiveBuilder.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.ResponsiveBuilder(),
      );
    },
    ResponsiveMobileRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.ResponsiveMobileScreen(),
      );
    },
    ResponsiveWebRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.ResponsiveWebScreen(),
      );
    },
    StudentHomeRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.StudentHomeScreen(),
      );
    },
    StudentMobileChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileChangePassRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i28.StudentMobileChangePassScreen(
          currentPassword: args.currentPassword,
          key: args.key,
        ),
      );
    },
    StudentMobileEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileEnrollmentRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i29.StudentMobileEnrollmentScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileHomeRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileHomeRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i30.StudentMobileHomeScreen(
          userModel: args.userModel,
          key: args.key,
        ),
      );
    },
    StudentMobileInfoRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileInfoRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i31.StudentMobileInfoScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileProfileRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i32.StudentMobileProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentMobileScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentMobileScheduleRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i33.StudentMobileScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentPaymentHomeRoute.name: (routeData) {
      final args = routeData.argsAs<StudentPaymentHomeRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i34.StudentPaymentHomeScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebChangePassRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebChangePassRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i35.StudentWebChangePassScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebEnrollmentRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebEnrollmentRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i36.StudentWebEnrollmentScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebProfileRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebProfileRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i37.StudentWebProfileScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    StudentWebScheduleRoute.name: (routeData) {
      final args = routeData.argsAs<StudentWebScheduleRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i38.StudentWebScheduleScreen(
          applicationInfo: args.applicationInfo,
          key: args.key,
        ),
      );
    },
    SummaryPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<SummaryPaymentRouteArgs>();
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i39.SummaryPaymentScreen(
          applicationInfo: args.applicationInfo,
          paymentList: args.paymentList,
          key: args.key,
        ),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i40.TransfereeJuniorScreen(),
      );
    },
    WrapperAdminRoute.name: (routeData) {
      return _i42.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i41.WrapperAdminScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminAddInstructorScreen]
class AdminAddInstructorRoute extends _i42.PageRouteInfo<void> {
  const AdminAddInstructorRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminAddInstructorRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminAddInstructorRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminEditInstructorScreen]
class AdminEditInstructorRoute
    extends _i42.PageRouteInfo<AdminEditInstructorRouteArgs> {
  AdminEditInstructorRoute({
    required _i43.Instructor instructorData,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          AdminEditInstructorRoute.name,
          args: AdminEditInstructorRouteArgs(
            instructorData: instructorData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminEditInstructorRoute';

  static const _i42.PageInfo<AdminEditInstructorRouteArgs> page =
      _i42.PageInfo<AdminEditInstructorRouteArgs>(name);
}

class AdminEditInstructorRouteArgs {
  const AdminEditInstructorRouteArgs({
    required this.instructorData,
    this.key,
  });

  final _i43.Instructor instructorData;

  final _i44.Key? key;

  @override
  String toString() {
    return 'AdminEditInstructorRouteArgs{instructorData: $instructorData, key: $key}';
  }
}

/// generated route for
/// [_i3.AdminHomeScreen]
class AdminHomeRoute extends _i42.PageRouteInfo<AdminHomeRouteArgs> {
  AdminHomeRoute({
    required List<_i45.ApplicationInfo> studentList,
    required List<_i46.Payment> paymentList,
    required List<_i43.Instructor> instructorList,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          AdminHomeRoute.name,
          args: AdminHomeRouteArgs(
            studentList: studentList,
            paymentList: paymentList,
            instructorList: instructorList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i42.PageInfo<AdminHomeRouteArgs> page =
      _i42.PageInfo<AdminHomeRouteArgs>(name);
}

class AdminHomeRouteArgs {
  const AdminHomeRouteArgs({
    required this.studentList,
    required this.paymentList,
    required this.instructorList,
    this.key,
  });

  final List<_i45.ApplicationInfo> studentList;

  final List<_i46.Payment> paymentList;

  final List<_i43.Instructor> instructorList;

  final _i44.Key? key;

  @override
  String toString() {
    return 'AdminHomeRouteArgs{studentList: $studentList, paymentList: $paymentList, instructorList: $instructorList, key: $key}';
  }
}

/// generated route for
/// [_i4.AdminInstructorGradeScreen]
class AdminInstructorGradeRoute extends _i42.PageRouteInfo<void> {
  const AdminInstructorGradeRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminInstructorGradeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorGradeRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AdminInstructorListScreen]
class AdminInstructorListRoute
    extends _i42.PageRouteInfo<AdminInstructorListRouteArgs> {
  AdminInstructorListRoute({
    required List<_i43.Instructor> instructorList,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          AdminInstructorListRoute.name,
          args: AdminInstructorListRouteArgs(
            instructorList: instructorList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminInstructorListRoute';

  static const _i42.PageInfo<AdminInstructorListRouteArgs> page =
      _i42.PageInfo<AdminInstructorListRouteArgs>(name);
}

class AdminInstructorListRouteArgs {
  const AdminInstructorListRouteArgs({
    required this.instructorList,
    this.key,
  });

  final List<_i43.Instructor> instructorList;

  final _i44.Key? key;

  @override
  String toString() {
    return 'AdminInstructorListRouteArgs{instructorList: $instructorList, key: $key}';
  }
}

/// generated route for
/// [_i6.AdminInstructorSectionScreen]
class AdminInstructorSectionRoute extends _i42.PageRouteInfo<void> {
  const AdminInstructorSectionRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminInstructorSectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorSectionRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i7.AdminInstructorStudentListScreen]
class AdminInstructorStudentListRoute extends _i42.PageRouteInfo<void> {
  const AdminInstructorStudentListRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminInstructorStudentListRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminInstructorStudentListRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i8.AdminScheduleStudentScreen]
class AdminScheduleStudentRoute extends _i42.PageRouteInfo<void> {
  const AdminScheduleStudentRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminScheduleStudentRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminScheduleStudentRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i9.AdminStudentProfileScreen]
class AdminStudentProfileRoute extends _i42.PageRouteInfo<void> {
  const AdminStudentProfileRoute({List<_i42.PageRouteInfo>? children})
      : super(
          AdminStudentProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i10.AdminStudentsListScreen]
class AdminStudentsListRoute
    extends _i42.PageRouteInfo<AdminStudentsListRouteArgs> {
  AdminStudentsListRoute({
    required List<_i45.ApplicationInfo> studentList,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          AdminStudentsListRoute.name,
          args: AdminStudentsListRouteArgs(
            studentList: studentList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AdminStudentsListRoute';

  static const _i42.PageInfo<AdminStudentsListRouteArgs> page =
      _i42.PageInfo<AdminStudentsListRouteArgs>(name);
}

class AdminStudentsListRouteArgs {
  const AdminStudentsListRouteArgs({
    required this.studentList,
    this.key,
  });

  final List<_i45.ApplicationInfo> studentList;

  final _i44.Key? key;

  @override
  String toString() {
    return 'AdminStudentsListRouteArgs{studentList: $studentList, key: $key}';
  }
}

/// generated route for
/// [_i11.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i42.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i12.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i42.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i13.FormsScreen]
class FormsRoute extends _i42.PageRouteInfo<void> {
  const FormsRoute({List<_i42.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i14.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i42.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i42.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i15.InstructorHomeScreen]
class InstructorHomeRoute extends _i42.PageRouteInfo<void> {
  const InstructorHomeRoute({List<_i42.PageRouteInfo>? children})
      : super(
          InstructorHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'InstructorHomeRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i16.InstructorJuniorGradeScreen]
class InstructorJuniorGradeRoute
    extends _i42.PageRouteInfo<InstructorJuniorGradeRouteArgs> {
  InstructorJuniorGradeRoute({
    required bool isJunior,
    required _i45.ApplicationInfo studentData,
    required _i43.Instructor instructor,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          InstructorJuniorGradeRoute.name,
          args: InstructorJuniorGradeRouteArgs(
            isJunior: isJunior,
            studentData: studentData,
            instructor: instructor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorJuniorGradeRoute';

  static const _i42.PageInfo<InstructorJuniorGradeRouteArgs> page =
      _i42.PageInfo<InstructorJuniorGradeRouteArgs>(name);
}

class InstructorJuniorGradeRouteArgs {
  const InstructorJuniorGradeRouteArgs({
    required this.isJunior,
    required this.studentData,
    required this.instructor,
    this.key,
  });

  final bool isJunior;

  final _i45.ApplicationInfo studentData;

  final _i43.Instructor instructor;

  final _i44.Key? key;

  @override
  String toString() {
    return 'InstructorJuniorGradeRouteArgs{isJunior: $isJunior, studentData: $studentData, instructor: $instructor, key: $key}';
  }
}

/// generated route for
/// [_i17.InstructorProfileScreen]
class InstructorProfileRoute
    extends _i42.PageRouteInfo<InstructorProfileRouteArgs> {
  InstructorProfileRoute({
    required _i43.Instructor instructor,
    _i47.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          InstructorProfileRoute.name,
          args: InstructorProfileRouteArgs(
            instructor: instructor,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorProfileRoute';

  static const _i42.PageInfo<InstructorProfileRouteArgs> page =
      _i42.PageInfo<InstructorProfileRouteArgs>(name);
}

class InstructorProfileRouteArgs {
  const InstructorProfileRouteArgs({
    required this.instructor,
    this.key,
  });

  final _i43.Instructor instructor;

  final _i47.Key? key;

  @override
  String toString() {
    return 'InstructorProfileRouteArgs{instructor: $instructor, key: $key}';
  }
}

/// generated route for
/// [_i18.InstructorScheduleScreen]
class InstructorScheduleRoute
    extends _i42.PageRouteInfo<InstructorScheduleRouteArgs> {
  InstructorScheduleRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          InstructorScheduleRoute.name,
          args: InstructorScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorScheduleRoute';

  static const _i42.PageInfo<InstructorScheduleRouteArgs> page =
      _i42.PageInfo<InstructorScheduleRouteArgs>(name);
}

class InstructorScheduleRouteArgs {
  const InstructorScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'InstructorScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i19.InstructorSeniorGradeScreen]
class InstructorSeniorGradeRoute
    extends _i42.PageRouteInfo<InstructorSeniorGradeRouteArgs> {
  InstructorSeniorGradeRoute({
    required bool isJunior,
    required _i45.ApplicationInfo studentData,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          InstructorSeniorGradeRoute.name,
          args: InstructorSeniorGradeRouteArgs(
            isJunior: isJunior,
            studentData: studentData,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'InstructorSeniorGradeRoute';

  static const _i42.PageInfo<InstructorSeniorGradeRouteArgs> page =
      _i42.PageInfo<InstructorSeniorGradeRouteArgs>(name);
}

class InstructorSeniorGradeRouteArgs {
  const InstructorSeniorGradeRouteArgs({
    required this.isJunior,
    required this.studentData,
    this.key,
  });

  final bool isJunior;

  final _i45.ApplicationInfo studentData;

  final _i44.Key? key;

  @override
  String toString() {
    return 'InstructorSeniorGradeRouteArgs{isJunior: $isJunior, studentData: $studentData, key: $key}';
  }
}

/// generated route for
/// [_i20.LoginScreen]
class LoginRoute extends _i42.PageRouteInfo<void> {
  const LoginRoute({List<_i42.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i21.NewSeniorScreen]
class NewSeniorRoute extends _i42.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i42.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i22.OtherSchoolScreen]
class OtherSchoolRoute extends _i42.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i42.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PaymentHistoryScreen]
class PaymentHistoryRoute extends _i42.PageRouteInfo<PaymentHistoryRouteArgs> {
  PaymentHistoryRoute({
    required _i45.ApplicationInfo applicationInfo,
    required List<_i46.Payment> paymentList,
    required int summaryIndex,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          PaymentHistoryRoute.name,
          args: PaymentHistoryRouteArgs(
            applicationInfo: applicationInfo,
            paymentList: paymentList,
            summaryIndex: summaryIndex,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PaymentHistoryRoute';

  static const _i42.PageInfo<PaymentHistoryRouteArgs> page =
      _i42.PageInfo<PaymentHistoryRouteArgs>(name);
}

class PaymentHistoryRouteArgs {
  const PaymentHistoryRouteArgs({
    required this.applicationInfo,
    required this.paymentList,
    required this.summaryIndex,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final List<_i46.Payment> paymentList;

  final int summaryIndex;

  final _i44.Key? key;

  @override
  String toString() {
    return 'PaymentHistoryRouteArgs{applicationInfo: $applicationInfo, paymentList: $paymentList, summaryIndex: $summaryIndex, key: $key}';
  }
}

/// generated route for
/// [_i24.ResponsiveBuilder]
class ResponsiveBuilder extends _i42.PageRouteInfo<void> {
  const ResponsiveBuilder({List<_i42.PageRouteInfo>? children})
      : super(
          ResponsiveBuilder.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveBuilder';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i25.ResponsiveMobileScreen]
class ResponsiveMobileRoute extends _i42.PageRouteInfo<void> {
  const ResponsiveMobileRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ResponsiveMobileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveMobileRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i26.ResponsiveWebScreen]
class ResponsiveWebRoute extends _i42.PageRouteInfo<void> {
  const ResponsiveWebRoute({List<_i42.PageRouteInfo>? children})
      : super(
          ResponsiveWebRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResponsiveWebRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i27.StudentHomeScreen]
class StudentHomeRoute extends _i42.PageRouteInfo<void> {
  const StudentHomeRoute({List<_i42.PageRouteInfo>? children})
      : super(
          StudentHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentHomeRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i28.StudentMobileChangePassScreen]
class StudentMobileChangePassRoute
    extends _i42.PageRouteInfo<StudentMobileChangePassRouteArgs> {
  StudentMobileChangePassRoute({
    required String currentPassword,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileChangePassRoute.name,
          args: StudentMobileChangePassRouteArgs(
            currentPassword: currentPassword,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileChangePassRoute';

  static const _i42.PageInfo<StudentMobileChangePassRouteArgs> page =
      _i42.PageInfo<StudentMobileChangePassRouteArgs>(name);
}

class StudentMobileChangePassRouteArgs {
  const StudentMobileChangePassRouteArgs({
    required this.currentPassword,
    this.key,
  });

  final String currentPassword;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileChangePassRouteArgs{currentPassword: $currentPassword, key: $key}';
  }
}

/// generated route for
/// [_i29.StudentMobileEnrollmentScreen]
class StudentMobileEnrollmentRoute
    extends _i42.PageRouteInfo<StudentMobileEnrollmentRouteArgs> {
  StudentMobileEnrollmentRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileEnrollmentRoute.name,
          args: StudentMobileEnrollmentRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileEnrollmentRoute';

  static const _i42.PageInfo<StudentMobileEnrollmentRouteArgs> page =
      _i42.PageInfo<StudentMobileEnrollmentRouteArgs>(name);
}

class StudentMobileEnrollmentRouteArgs {
  const StudentMobileEnrollmentRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileEnrollmentRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i30.StudentMobileHomeScreen]
class StudentMobileHomeRoute
    extends _i42.PageRouteInfo<StudentMobileHomeRouteArgs> {
  StudentMobileHomeRoute({
    required _i48.UserModel userModel,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileHomeRoute.name,
          args: StudentMobileHomeRouteArgs(
            userModel: userModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileHomeRoute';

  static const _i42.PageInfo<StudentMobileHomeRouteArgs> page =
      _i42.PageInfo<StudentMobileHomeRouteArgs>(name);
}

class StudentMobileHomeRouteArgs {
  const StudentMobileHomeRouteArgs({
    required this.userModel,
    this.key,
  });

  final _i48.UserModel userModel;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileHomeRouteArgs{userModel: $userModel, key: $key}';
  }
}

/// generated route for
/// [_i31.StudentMobileInfoScreen]
class StudentMobileInfoRoute
    extends _i42.PageRouteInfo<StudentMobileInfoRouteArgs> {
  StudentMobileInfoRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileInfoRoute.name,
          args: StudentMobileInfoRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileInfoRoute';

  static const _i42.PageInfo<StudentMobileInfoRouteArgs> page =
      _i42.PageInfo<StudentMobileInfoRouteArgs>(name);
}

class StudentMobileInfoRouteArgs {
  const StudentMobileInfoRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileInfoRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i32.StudentMobileProfileScreen]
class StudentMobileProfileRoute
    extends _i42.PageRouteInfo<StudentMobileProfileRouteArgs> {
  StudentMobileProfileRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileProfileRoute.name,
          args: StudentMobileProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileProfileRoute';

  static const _i42.PageInfo<StudentMobileProfileRouteArgs> page =
      _i42.PageInfo<StudentMobileProfileRouteArgs>(name);
}

class StudentMobileProfileRouteArgs {
  const StudentMobileProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i33.StudentMobileScheduleScreen]
class StudentMobileScheduleRoute
    extends _i42.PageRouteInfo<StudentMobileScheduleRouteArgs> {
  StudentMobileScheduleRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentMobileScheduleRoute.name,
          args: StudentMobileScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentMobileScheduleRoute';

  static const _i42.PageInfo<StudentMobileScheduleRouteArgs> page =
      _i42.PageInfo<StudentMobileScheduleRouteArgs>(name);
}

class StudentMobileScheduleRouteArgs {
  const StudentMobileScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentMobileScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i34.StudentPaymentHomeScreen]
class StudentPaymentHomeRoute
    extends _i42.PageRouteInfo<StudentPaymentHomeRouteArgs> {
  StudentPaymentHomeRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentPaymentHomeRoute.name,
          args: StudentPaymentHomeRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentPaymentHomeRoute';

  static const _i42.PageInfo<StudentPaymentHomeRouteArgs> page =
      _i42.PageInfo<StudentPaymentHomeRouteArgs>(name);
}

class StudentPaymentHomeRouteArgs {
  const StudentPaymentHomeRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentPaymentHomeRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i35.StudentWebChangePassScreen]
class StudentWebChangePassRoute
    extends _i42.PageRouteInfo<StudentWebChangePassRouteArgs> {
  StudentWebChangePassRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentWebChangePassRoute.name,
          args: StudentWebChangePassRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebChangePassRoute';

  static const _i42.PageInfo<StudentWebChangePassRouteArgs> page =
      _i42.PageInfo<StudentWebChangePassRouteArgs>(name);
}

class StudentWebChangePassRouteArgs {
  const StudentWebChangePassRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentWebChangePassRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i36.StudentWebEnrollmentScreen]
class StudentWebEnrollmentRoute
    extends _i42.PageRouteInfo<StudentWebEnrollmentRouteArgs> {
  StudentWebEnrollmentRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentWebEnrollmentRoute.name,
          args: StudentWebEnrollmentRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebEnrollmentRoute';

  static const _i42.PageInfo<StudentWebEnrollmentRouteArgs> page =
      _i42.PageInfo<StudentWebEnrollmentRouteArgs>(name);
}

class StudentWebEnrollmentRouteArgs {
  const StudentWebEnrollmentRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentWebEnrollmentRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i37.StudentWebProfileScreen]
class StudentWebProfileRoute
    extends _i42.PageRouteInfo<StudentWebProfileRouteArgs> {
  StudentWebProfileRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentWebProfileRoute.name,
          args: StudentWebProfileRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebProfileRoute';

  static const _i42.PageInfo<StudentWebProfileRouteArgs> page =
      _i42.PageInfo<StudentWebProfileRouteArgs>(name);
}

class StudentWebProfileRouteArgs {
  const StudentWebProfileRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentWebProfileRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i38.StudentWebScheduleScreen]
class StudentWebScheduleRoute
    extends _i42.PageRouteInfo<StudentWebScheduleRouteArgs> {
  StudentWebScheduleRoute({
    required _i45.ApplicationInfo applicationInfo,
    _i44.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          StudentWebScheduleRoute.name,
          args: StudentWebScheduleRouteArgs(
            applicationInfo: applicationInfo,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StudentWebScheduleRoute';

  static const _i42.PageInfo<StudentWebScheduleRouteArgs> page =
      _i42.PageInfo<StudentWebScheduleRouteArgs>(name);
}

class StudentWebScheduleRouteArgs {
  const StudentWebScheduleRouteArgs({
    required this.applicationInfo,
    this.key,
  });

  final _i45.ApplicationInfo applicationInfo;

  final _i44.Key? key;

  @override
  String toString() {
    return 'StudentWebScheduleRouteArgs{applicationInfo: $applicationInfo, key: $key}';
  }
}

/// generated route for
/// [_i39.SummaryPaymentScreen]
class SummaryPaymentRoute extends _i42.PageRouteInfo<SummaryPaymentRouteArgs> {
  SummaryPaymentRoute({
    required List<_i45.ApplicationInfo> applicationInfo,
    required List<_i46.Payment> paymentList,
    _i47.Key? key,
    List<_i42.PageRouteInfo>? children,
  }) : super(
          SummaryPaymentRoute.name,
          args: SummaryPaymentRouteArgs(
            applicationInfo: applicationInfo,
            paymentList: paymentList,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SummaryPaymentRoute';

  static const _i42.PageInfo<SummaryPaymentRouteArgs> page =
      _i42.PageInfo<SummaryPaymentRouteArgs>(name);
}

class SummaryPaymentRouteArgs {
  const SummaryPaymentRouteArgs({
    required this.applicationInfo,
    required this.paymentList,
    this.key,
  });

  final List<_i45.ApplicationInfo> applicationInfo;

  final List<_i46.Payment> paymentList;

  final _i47.Key? key;

  @override
  String toString() {
    return 'SummaryPaymentRouteArgs{applicationInfo: $applicationInfo, paymentList: $paymentList, key: $key}';
  }
}

/// generated route for
/// [_i40.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i42.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i42.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}

/// generated route for
/// [_i41.WrapperAdminScreen]
class WrapperAdminRoute extends _i42.PageRouteInfo<void> {
  const WrapperAdminRoute({List<_i42.PageRouteInfo>? children})
      : super(
          WrapperAdminRoute.name,
          initialChildren: children,
        );

  static const String name = 'WrapperAdminRoute';

  static const _i42.PageInfo<void> page = _i42.PageInfo<void>(name);
}
