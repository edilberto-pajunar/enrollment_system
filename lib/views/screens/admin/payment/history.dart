import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/values/strings/colors.dart';

@RoutePage()
class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({
    required this.applicationInfo,
    required this.paymentList,
    required this.summaryIndex,
    super.key,
  });

  final ApplicationInfo applicationInfo;
  final List<Payment> paymentList;
  final int summaryIndex;

  @override
  State<PaymentHistoryScreen> createState() => _PaymentHistoryScreenState();
}

class _PaymentHistoryScreenState extends State<PaymentHistoryScreen> {


  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final paymentList = widget.paymentList;
    final applicationInfo = widget.applicationInfo;

    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("${applicationInfo.studentInfo.name} Payment",
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: paymentList.length,
                itemBuilder: (context, index) {
                  return Slidable(
                    startActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.green,
                          onPressed: (context) {},
                          icon: Icons.check,
                          label: "Accept",
                        )
                      ],
                    ),
                    endActionPane: ActionPane(
                      motion: const StretchMotion(),
                      children: [
                        SlidableAction(
                          backgroundColor: Colors.red,
                          onPressed: (context) {},
                          icon: Icons.close,
                          label: "Reject",
                        )
                      ],
                    ),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: ColorTheme.primaryRed.withOpacity(0.8),
                              child: Text("${index + 1}",
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("#${paymentList[widget.summaryIndex].paymentDescription[index].refNumber}"),
                                Text("${paymentList[widget.summaryIndex].paymentDescription[index].status}"),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
