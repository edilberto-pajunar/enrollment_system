import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/values/strings/constant/payment_status.dart';

@RoutePage()
class PaymentUpdateScreen extends StatefulWidget {
  const PaymentUpdateScreen({
    required this.payment,
    super.key,
  });

  final Payment payment;

  @override
  State<PaymentUpdateScreen> createState() => _PaymentUpdateScreenState();
}

class _PaymentUpdateScreenState extends State<PaymentUpdateScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);
      paymentDB.updateStudentStream(id: widget.payment.id);
      paymentDB.updateStudentPaymentStream(id: widget.payment.id);
    });
  }


  @override
  Widget build(BuildContext context) {

    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);
    final ThemeData theme = Theme.of(context);

    final paymentInfo = widget.payment.paymentDescription!.first;


    return Scaffold(
      appBar: AppBar(
        title: Text("#${paymentInfo.refNumber}"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Text("Name: ${applicationInfo!.studentInfo.name}"),
                      Text("Amount: ₱${paymentInfo.amount}"),
                      Text("Reference number: ${paymentInfo.refNumber}"),
                      Text("Status: ${paymentInfo.status}"),
                      const SizedBox(height: 24.0),


                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          paymentDB.updatePaymentStatus(context,
                            status: PaymentStatus.accepted,
                            id: widget.payment.id,
                          );
                          // customDialog.showAgree(context,
                          //   onTap: () {
                          //     paymentDB.updatePaymentStatus(
                          //       status: PaymentStatus.accepted,
                          //       id: widget.paymentInfo.id,
                          //     ).then((value) {
                          //       context.popRoute();
                          //     });
                          //   },
                          //   message: "Are you certain you wish to confirm this payment?"
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                          backgroundColor: ColorTheme.primaryRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "Confirm",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    VerticalDivider(
                      width: 1,
                    ),

                    Expanded(
                      child: ElevatedButton(
                        onPressed: () async {
                          await paymentDB.updatePaymentStatus(context,
                            status: PaymentStatus.rejected,
                            id: widget.payment.id,
                          );
                          // customDialog.showAgree(context,
                          //     onTap: () {
                          //       paymentDB.updatePaymentStatus(
                          //         status: PaymentStatus.rejected,
                          //         id: widget.paymentInfo.id,
                          //       ).then((value) {
                          //         context.popRoute();
                          //       });
                          //     },
                          //     message: "Are you certain you wish to decline this payment?"
                          // );
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
                          backgroundColor: ColorTheme.primaryYellow,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(12.0),
                            ),
                          ),
                        ),
                        child: Text(
                          "Reject",
                          style: theme.textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
