import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/instructor.dart';

@RoutePage()
class InstructorProfileScreen extends StatelessWidget {
  const InstructorProfileScreen({
    required this.instructor,
    super.key,
  });

  final Instructor instructor;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
