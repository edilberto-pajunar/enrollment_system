import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/student/subject.dart';
import 'package:web_school/views/screens/mobile/home.dart';
import 'package:flutter/services.dart';

@RoutePage()
class GeneratedReportScreen extends StatefulWidget {
  const GeneratedReportScreen({super.key});

  @override
  State<GeneratedReportScreen> createState() => _GeneratedReportScreenState();
}

class _GeneratedReportScreenState extends State<GeneratedReportScreen> {
  List<Subject> subjects = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadSubjects();
    });
    super.initState();
  }

  Future loadSubjects() async {
    final data = await rootBundle.loadString('assets/json/subjectss.json');
    subjects =
        (json.decode(data) as List).map((i) => Subject.fromMap(i)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Generated Report"),
        centerTitle: true,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Table(
                  border: TableBorder.all(color: Colors.black),
                  children: [
                    TableRow(children: [
                      ReportCardHeader(
                        text: 'Subjects',
                      ),
                      ReportCardHeader(
                        text: '1st\n Term',
                      ),
                      ReportCardHeader(
                        text: '2nd\n Term',
                      ),
                      ReportCardHeader(
                        text: '3rd\n Term',
                      ),
                      ReportCardHeader(
                        text: '4th\n Term',
                      ),
                      ReportCardHeader(
                        text: 'Final',
                      ),
                      ReportCardHeader(
                        text: 'Units',
                      ),
                      ReportCardHeader(
                        text: 'Passed or Failed',
                      ),
                    ]),
                    ...subjects.map((e) => generateTableRow(e))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TableRow generateTableRow(Subject subject) {
    String finalGrade = computeFinalGrade(subject).toString();
    return TableRow(children: [
      ReportCardValue(text: subject.name),
      ReportCardValue(text: subject.grades[0].grade.toString()),
      ReportCardValue(text: subject.grades[1].grade.toString()),
      ReportCardValue(text: subject.grades[2].grade.toString()),
      ReportCardValue(text: subject.grades[3].grade.toString()),
      ReportCardValue(text: subject.units.toString()),
      ReportCardValue(text: finalGrade),
      ReportCardValue(text: "Passed"),
    ]);
  }
}

double computeFinalGrade(Subject subject) {
  return ((subject.grades[0].grade ?? 0) +
          (subject.grades[1].grade ?? 0) +
          (subject.grades[2].grade ?? 0) +
          (subject.grades[3].grade ?? 0)) /
      4;
}

class ReportCardHeader extends StatelessWidget {
  const ReportCardHeader({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Text(
          text,
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ReportCardValue extends StatelessWidget {
  const ReportCardValue({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
        textAlign: TextAlign.center,
      ),
    );
  }
}
