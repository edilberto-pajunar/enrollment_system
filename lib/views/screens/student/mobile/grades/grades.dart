import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

class StudentMobileGradeScreen extends StatefulWidget {
  const StudentMobileGradeScreen({super.key});

  @override
  State<StudentMobileGradeScreen> createState() =>
      _StudentMobileGradeScreenState();
}

class _StudentMobileGradeScreenState extends State<StudentMobileGradeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB =
          Provider.of<StudentDB>(context, listen: false);
      studentDB.updateListSubjectStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Subjects"),
        ),
        body: StreamWrapper<List<Subject>>(
          stream: studentDB.listSubjectStream,
          child: (subjectList) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(columns: const [
                DataColumn(
                  label: Text("Name"),
                ),
                DataColumn(
                  label: Text("Grades"),
                ),
                DataColumn(
                  label: Text("Grades"),
                ),
              ], rows: [
                ...subjectList!.map((e) {
                  return DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(e.name),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(e.name),
                        ),
                      ),
                      DataCell(
                        SizedBox(
                          width: 100,
                          child: Text(e.name),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ]),
            );
          },
        ),
      ),
    );
  }
}
