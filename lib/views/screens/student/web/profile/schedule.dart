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
class StudentWebScheduleScreen extends StatefulWidget {

  const StudentWebScheduleScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentWebScheduleScreen> createState() => _StudentWebScheduleScreenState();
}

class _StudentWebScheduleScreenState extends State<StudentWebScheduleScreen> {

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

    return Scaffold(
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children:
                                subject.schedule!.map((Schedule? schedule) {
                                  final DateTime date =
                                  schedule!.getNextDayTime(schedule);
                                  final String startDate =
                                  DateFormat("EEEE, h:mma").format(date);
                                  final String endDate =
                                  DateFormat("h:mma").format(date.add(
                                    Duration(hours: 1),
                                  ));
                                  print(date);
                                  return Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 1.0),
                                      child: Text(
                                        "$startDate/$endDate",
                                        style: theme.textTheme.bodySmall,
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
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
    );
  }
}

