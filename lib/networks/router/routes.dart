import 'package:auto_route/auto_route.dart';
import 'package:web_school/networks/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: ContinueJuniorRoute.page),
        AutoRoute(page: IncomingJuniorFormRoute.page),
        AutoRoute(page: TransfereeJuniorRoute.page),
        AutoRoute(page: NewSeniorRoute.page),
        AutoRoute(page: ContinuingSeniorRoute.page),
        AutoRoute(page: OtherSchoolRoute.page),
        AutoRoute(page: FormsRoute.page),
        AutoRoute(page: AdminHomeRoute.page),
        AutoRoute(page: AdminStudentsRoute.page),
        AutoRoute(page: AdminStudentProfileRoute.page),
        AutoRoute(page: StudentHomeRoute.page),
      ];
}
