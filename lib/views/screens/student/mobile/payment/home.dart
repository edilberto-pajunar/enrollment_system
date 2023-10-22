import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class StudentPaymentHomeScreen extends StatefulWidget {
  const StudentPaymentHomeScreen({
    required this.applicationInfo,
    super.key,
  });

  final ApplicationInfo applicationInfo;

  @override
  State<StudentPaymentHomeScreen> createState() => _StudentPaymentHomeScreenState();
}

class _StudentPaymentHomeScreenState extends State<StudentPaymentHomeScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);
      paymentDB.updateStudentPaymentStream(id: widget.applicationInfo.userModel.id);
      // paymentDB.updateStudentPayment(context, widget.applicationInfo.userModel.id);
    });
  }

  @override
  Widget build(BuildContext context) {

    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: StreamWrapper<PaymentModel>(
        stream: paymentDB.studentPaymentStream,
        child: (paymentList) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Your current balance is: ${widget.applicationInfo.studentInfo.balance}"),

                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
