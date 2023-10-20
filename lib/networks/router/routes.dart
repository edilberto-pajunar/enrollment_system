import 'package:auto_route/auto_route.dart';
import 'package:web_school/networks/router/routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: ResponsiveBuilder.page, initial: true),
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
        AutoRoute(page: StudentLayoutBuilder.page),
        AutoRoute(page: StudentMobileHomeRoute.page),
        AutoRoute(page: StudentMobileChangePassRoute.page),
        AutoRoute(page: StudentMobileInfoRoute.page),
        AutoRoute(page: StudentMobileEnrollmentRoute.page),
        AutoRoute(page: StudentMobileScheduleRoute.page),
        AutoRoute(page: AdminInstructorHomeRoute.page),
        AutoRoute(page: AdminAddInstructorRoute.page),
        AutoRoute(page: AdminInstructorSectionRoute.page),
        AutoRoute(page: AdminInstructorGradeRoute.page),
        AutoRoute(page: AdminInstructorStudentListRoute.page),
        AutoRoute(page: AdminEditInstructorRoute.page),
        AutoRoute(page: AdminScheduleStudentRoute.page),
        AutoRoute(page: SummaryPaymentRoute.page),
        AutoRoute(page: PaymentUpdateRoute.page),
        AutoRoute(page: InstructorHomeRoute.page),
        AutoRoute(page: InstructorGradeRoute.page),
        AutoRoute(page: InstructorScheduleRoute.page),

        AutoRoute(page: WebStudentHomeRoute.page),
      ];
}
