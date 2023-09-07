// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:web_school/views/screens/admin/home.dart' as _i1;
import 'package:web_school/views/screens/admin/student/list.dart' as _i3;
import 'package:web_school/views/screens/admin/student/profile.dart' as _i2;
import 'package:web_school/views/screens/auth/home.dart' as _i7;
import 'package:web_school/views/screens/auth/login.dart' as _i9;
import 'package:web_school/views/screens/forms/form.dart' as _i6;
import 'package:web_school/views/screens/forms/junior/continue.dart' as _i4;
import 'package:web_school/views/screens/forms/junior/incoming.dart' as _i8;
import 'package:web_school/views/screens/forms/junior/transferee.dart' as _i13;
import 'package:web_school/views/screens/forms/senior/continue.dart' as _i5;
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart' as _i10;
import 'package:web_school/views/screens/forms/senior/other.dart' as _i11;
import 'package:web_school/views/screens/student/home.dart' as _i12;

abstract class $AppRouter extends _i14.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i14.PageFactory> pagesMap = {
    AdminHomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AdminHomeScreen(),
      );
    },
    AdminStudentProfileRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AdminStudentProfileScreen(),
      );
    },
    AdminStudentsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AdminStudentsScreen(),
      );
    },
    ContinueJuniorRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ContinueJuniorScreen(),
      );
    },
    ContinuingSeniorRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ContinuingSeniorScreen(),
      );
    },
    FormsRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.FormsScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.HomeScreen(),
      );
    },
    IncomingJuniorFormRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.IncomingJuniorFormScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.LoginScreen(),
      );
    },
    NewSeniorRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.NewSeniorScreen(),
      );
    },
    OtherSchoolRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OtherSchoolScreen(),
      );
    },
    StudentHomeRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.StudentHomeScreen(),
      );
    },
    TransfereeJuniorRoute.name: (routeData) {
      return _i14.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.TransfereeJuniorScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.AdminHomeScreen]
class AdminHomeRoute extends _i14.PageRouteInfo<void> {
  const AdminHomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AdminHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminHomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AdminStudentProfileScreen]
class AdminStudentProfileRoute extends _i14.PageRouteInfo<void> {
  const AdminStudentProfileRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AdminStudentProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentProfileRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AdminStudentsScreen]
class AdminStudentsRoute extends _i14.PageRouteInfo<void> {
  const AdminStudentsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          AdminStudentsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AdminStudentsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ContinueJuniorScreen]
class ContinueJuniorRoute extends _i14.PageRouteInfo<void> {
  const ContinueJuniorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ContinueJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinueJuniorRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ContinuingSeniorScreen]
class ContinuingSeniorRoute extends _i14.PageRouteInfo<void> {
  const ContinuingSeniorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          ContinuingSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContinuingSeniorRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i6.FormsScreen]
class FormsRoute extends _i14.PageRouteInfo<void> {
  const FormsRoute({List<_i14.PageRouteInfo>? children})
      : super(
          FormsRoute.name,
          initialChildren: children,
        );

  static const String name = 'FormsRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i8.IncomingJuniorFormScreen]
class IncomingJuniorFormRoute extends _i14.PageRouteInfo<void> {
  const IncomingJuniorFormRoute({List<_i14.PageRouteInfo>? children})
      : super(
          IncomingJuniorFormRoute.name,
          initialChildren: children,
        );

  static const String name = 'IncomingJuniorFormRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i9.LoginScreen]
class LoginRoute extends _i14.PageRouteInfo<void> {
  const LoginRoute({List<_i14.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i10.NewSeniorScreen]
class NewSeniorRoute extends _i14.PageRouteInfo<void> {
  const NewSeniorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          NewSeniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewSeniorRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OtherSchoolScreen]
class OtherSchoolRoute extends _i14.PageRouteInfo<void> {
  const OtherSchoolRoute({List<_i14.PageRouteInfo>? children})
      : super(
          OtherSchoolRoute.name,
          initialChildren: children,
        );

  static const String name = 'OtherSchoolRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i12.StudentHomeScreen]
class StudentHomeRoute extends _i14.PageRouteInfo<void> {
  const StudentHomeRoute({List<_i14.PageRouteInfo>? children})
      : super(
          StudentHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'StudentHomeRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}

/// generated route for
/// [_i13.TransfereeJuniorScreen]
class TransfereeJuniorRoute extends _i14.PageRouteInfo<void> {
  const TransfereeJuniorRoute({List<_i14.PageRouteInfo>? children})
      : super(
          TransfereeJuniorRoute.name,
          initialChildren: children,
        );

  static const String name = 'TransfereeJuniorRoute';

  static const _i14.PageInfo<void> page = _i14.PageInfo<void>(name);
}
