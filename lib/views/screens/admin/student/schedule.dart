import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/student/schedule.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/views/screens/admin/student/calendar.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class AdminScheduleStudentScreen extends StatefulWidget {
  const AdminScheduleStudentScreen({
    super.key,
  });

  @override
  State<AdminScheduleStudentScreen> createState() => _AdminScheduleStudentScreenState();
}

class _AdminScheduleStudentScreenState extends State<AdminScheduleStudentScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.getStudentIdLocal().then((value) {
        adminDB.updateStudentStream();
        adminDB.updateListSubjectStream();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);

    return Scaffold(
      appBar: !kIsWeb ? AppBar() : null,
      body: SafeArea(
        child: StreamWrapper<ApplicationInfo>(
          stream: adminDB.studentStream,
          child: (applicationInfo) {
            return StreamWrapper<List<Subject>>(
              stream: adminDB.listSubjectStream,
              child: (subjectList) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${applicationInfo!.personalInfo.firstName}, Schedule",
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
            );
          }
        ),
      ),
    );
  }
}

class DataSource extends CalendarDataSource {
  DataSource(List<TimeRegion> source) {
    appointments = source;
  }
}
