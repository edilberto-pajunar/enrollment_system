import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/student.dart';

@RoutePage()
class StudentMobileProfileScreen extends StatefulWidget {
  const StudentMobileProfileScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentMobileProfileScreen> createState() =>
      _StudentMobileProfileScreenState();
}

class _StudentMobileProfileScreenState extends State<StudentMobileProfileScreen> {

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final ThemeData theme = Theme.of(context);

    final personal = widget.applicationInfo.personalInfo;

    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Welcome, ${personal.firstName} ${personal.lastName}",
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 12.0),
                Container(
                  width: size.width,
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(12.0)),
                  child: Text(
                      "Admission Status: ${studentDB.enrollmentStatus(widget.applicationInfo.studentInfo)}"),
                ),
                const SizedBox(height: 24.0),
                Text("This is your schedule today",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 8.0),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border.all(),
                              shape: BoxShape.circle,
                            ),
                            child: Text("M"),
                          ),
                          const SizedBox(width: 8.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Monday",
                                style: theme.textTheme.titleSmall,
                              ),
                              const SizedBox(height: 4.0),
                              Text("12:00PM - 1:00PM",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),


                // Expanded(
                //   child: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.red,
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(12.0),
                //         topLeft: Radius.circular(12.0),
                //       ),
                //     ),
                //     child: Column(
                //       children: [
                //         Text("Your schedule today"),
                //         Wrap(
                //           children: [
                //             Card(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Text("Monday"),
                //                   Text("English"),
                //                   Text("12:00AM")
                //                 ],
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
        ),
      ),
    );
  }
}
