import 'package:go_router/go_router.dart';
import 'package:web_school/models/user.dart';
import 'package:web_school/views/screens/admin/home.dart';
import 'package:web_school/views/screens/auth/login.dart';
import 'package:web_school/views/screens/forms/form.dart';
import 'package:web_school/views/screens/forms/junior/continue.dart';
import 'package:web_school/views/screens/forms/junior/incoming.dart';
import 'package:web_school/views/screens/forms/junior/transferee.dart';
import 'package:web_school/views/screens/forms/senior/continue.dart';
import 'package:web_school/views/screens/forms/senior/from_sjaiss.dart';
import 'package:web_school/views/screens/forms/senior/other.dart';
import 'package:web_school/views/screens/responsive/layout.dart';

class CustomRouter {
  final router = GoRouter(
    routes: [
      GoRoute(path: "/", builder: (context, state) => ResponsiveBuilder()),
      GoRoute(path: LoginScreen.route, builder: (context, state) => LoginScreen()),
      GoRoute(path: FormsScreen.route, builder: (context, state) => FormsScreen()),
      GoRoute(path: IncomingJuniorFormScreen.route, builder: (context, state) => IncomingJuniorFormScreen()),
      GoRoute(path: TransfereeJuniorScreen.route, builder: (context, state) => TransfereeJuniorScreen()),
      GoRoute(path: ContinueJuniorScreen.route, builder: (context, state) => ContinueJuniorScreen()),
      GoRoute(path: NewSeniorScreen.route, builder: (context, state) => NewSeniorScreen()),
      GoRoute(path: OtherSchoolScreen.route, builder: (context, state) => OtherSchoolScreen()),
      GoRoute(path: ContinueJuniorScreen.route, builder: (context, state) => ContinuingSeniorScreen()),
      GoRoute(path: AdminHomeScreen.route, builder: (context, state) => AdminHomeScreen(userModel: state.extra as UserModel)),
    ],
  );
}