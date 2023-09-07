import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';
import 'package:web_school/views/widgets/tiles/grey.dart';

@RoutePage()
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      studentDB.updateStudentListStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final ThemeData theme = Theme.of(context);

    final String date = DateFormat("MMMM-dd-yyyy").format(DateTime.now());

    return SafeArea(
      child: Scaffold(
        body: StreamWrapper<List<ApplicationInfo>>(
          stream: studentDB.studentListStream,
          child: (studentList) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Welcome, Admin",
                    style: theme.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 12.0),
                  GreyTile(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Dashboard",
                          style: theme.textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    "As of $date:",
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            context.pushRoute(const AdminStudentsRoute());
                          },
                          child: GreyTile(
                            backgroundColor: Colors.black,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "${studentList!.length}",
                                  style: theme.textTheme.titleMedium!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  "Total Students",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 50.0),
                                LinearPercentIndicator(
                                  percent: studentList.length / 100,
                                  barRadius: const Radius.circular(12),
                                  lineHeight: 12,
                                  backgroundColor: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: GreyTile(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              offset: const Offset(0, 4),
                              spreadRadius: 2,
                              blurRadius: 10,
                            )
                          ],
                          backgroundColor: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Text("${instructors!.length}",
                              //   style: theme.textTheme.titleMedium!.copyWith(
                              //   ),
                              // ),
                              const SizedBox(height: 4.0),
                              Text(
                                "Total Instructors",
                                style: theme.textTheme.bodyLarge!.copyWith(),
                              ),
                              const SizedBox(height: 50.0),
                              // LinearPercentIndicator(
                              //   percent: instructors.length / 100,
                              //   barRadius: const Radius.circular(12),
                              //   lineHeight: 12,
                              //   progressColor: ColorTheme.primaryRed,
                              //   backgroundColor: ColorTheme.primaryBlack.withOpacity(0.1),
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
