import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/instructor.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/admin.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/networks/student.dart';
import 'package:web_school/views/screens/admin/home/components/body.dart';
import 'package:web_school/views/screens/admin/home/components/drawer.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({
    super.key,
  });


  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final StudentDB studentDB = Provider.of<StudentDB>(context, listen: false);
      studentDB.updateStudentListStream();
      final AdminDB adminDB = Provider.of<AdminDB>(context, listen: false);
      adminDB.updateInstructorListStream();
      final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);
      paymentDB.updatePaymentModelStream();
    });
  }

  @override
  Widget build(BuildContext context) {
    final StudentDB studentDB = Provider.of<StudentDB>(context);
    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);
    final AdminDB adminDB = Provider.of<AdminDB>(context);
    final Auth auth = Provider.of<Auth>(context);
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    // final String date = DateFormat("MMMM-dd-yyyy").format(DateTime.now());

    return WillPopScope(
      onWillPop: null,
      child: SafeArea(
        child: Scaffold(
          appBar: !kIsWeb ? AppBar(
            automaticallyImplyLeading: false,
            actions: [
              TextButton(
                onPressed: () {
                  auth.logout(context);
                },
                child: Text(
                  "Logout",
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ) : null,
          body: Container(
            height: size.height,
            child: StreamWrapper<List<Instructor>>(
                stream: adminDB.instructorListStream,
                child: (instructorList) {
                  return StreamWrapper<List<Payment>>(
                    stream: paymentDB.paymentModelStream,
                    child: (paymentList) {
                      return StreamWrapper<List<ApplicationInfo>>(
                        stream: studentDB.studentListStream,
                        child: (studentList) {
                          return LayoutBuilder(
                            builder: (context, constraints) {
                              if (constraints.maxWidth < 600) {
                                return Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Admin Dashboard",
                                          style: theme.textTheme.titleLarge,
                                        ),
                                        AdminBody(
                                          studentList: studentList!,
                                          instructorList: instructorList!,
                                          paymentList: paymentList!,
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return SizedBox(
                                  height: size.height,
                                  child: SingleChildScrollView(
                                    child: Row(
                                      children: [
                                        AdminDrawer(
                                          studentList: studentList!,
                                          instructorList: instructorList!,
                                          paymentList: paymentList!,
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Padding(
                                            padding: const EdgeInsets.all(24.0),
                                            child: AdminBody(
                                              studentList: studentList,
                                              instructorList: instructorList,
                                              paymentList: paymentList,

                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }

                            }
                          );
                        },
                      );
                    }
                  );
                }),
          ),
        ),
      ),
    );
  }
}
