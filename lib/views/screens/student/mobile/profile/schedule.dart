import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/schedule.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/admin/student/calendar.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class StudentMobileScheduleScreen extends StatefulWidget {
  const StudentMobileScheduleScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentMobileScheduleScreen> createState() => _StudentMobileScheduleScreenState();
}

class _StudentMobileScheduleScreenState extends State<StudentMobileScheduleScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      studentDB.updateListSubjectStream(widget.applicationInfo.userModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return SafeArea(
      child: Scaffold(
        body: StreamWrapper<List<Subject>>(
          stream: studentDB.listSubjectStream,
          child: (subjectList) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.applicationInfo.personalInfo.firstName}, Schedule",
                      style: theme.textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          )),
                      child: DataTable(
                        dataRowMaxHeight: 150,
                        columnSpacing: 0,
                        columns: [
                          DataColumn(
                            label: Text("Subject"),
                          ),
                          DataColumn(
                            label: Text("Schedule"),
                          ),
                        ],
                        rows: subjectList!.map((Subject subject) {
                          return DataRow(cells: [
                            DataCell(
                              Text(
                                subject.name,
                                style: theme.textTheme.bodySmall,
                              ),
                            ),
                            DataCell(
                              subject.schedule!.isNotEmpty ? Padding(
                                padding: const EdgeInsets.symmetric(vertical: 2.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: subject.schedule!.map((Schedule? schedule) {

                                    final DateTime date = schedule!.getNextDayTime(schedule);
                                    final String startDate = DateFormat("EEEE, h:mma").format(date);
                                    final String endDate = DateFormat("h:mma").format(date.add(Duration(hours: 1),));

                                    return Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 1.0,
                                        ),
                                        child: Text(
                                          true ? "N/A" : "$startDate/$endDate",
                                          style: theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ) : Text("N/A")
                            ),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}

