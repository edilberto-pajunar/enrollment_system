import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/values/strings/colors.dart';

@RoutePage()
class PaymentHistoryScreen extends StatefulWidget {
  const PaymentHistoryScreen({
    required this.applicationInfo,
    required this.paymentList,
    super.key,
  });

  final List<ApplicationInfo> applicationInfo;
  final List<Payment> paymentList;

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
      appBar: AppBar(
        title: Text("Payment History"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: paymentList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {},
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
                                Text(applicationInfo[index].studentInfo.name),
                                Text("${applicationInfo[index].schoolInfo.gradeToEnroll.label}"),
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

// @override
// void initState() {
//   super.initState();
//   WidgetsBinding.instance.addPostFrameCallback((_) {
//     final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);
//     paymentDB.updatePaymentModelStream();
//   });
//
// }
//
// final GlobalKey<ScaffoldState> globalKey = GlobalKey();
//
// @override
// Widget build(BuildContext context) {
//
//   final ThemeData theme = Theme.of(context);
//   final PaymentDB paymentDB = Provider.of<PaymentDB>(context);
//
//   return Scaffold(
//     appBar: AppBar(
//       title: Text("Payments"),
//     ),
//     body: SafeArea(
//       child: StreamWrapper<List<Payment>>(
//         stream: paymentDB.paymentModelStream,
//         child: (paymentList) {
//           return Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: paymentList!.length,
//                     itemBuilder: (context, index) {
//
//                       final paymentInfo = paymentList[index].paymentDescription;
//                       return InkWell(
//                         onTap: () {
//                           context.router.push(PaymentUpdateRoute(
//                             payment: paymentList[index],
//                           ));
//                         },
//                         child: Container(
//                           padding: const EdgeInsets.all(12.0),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black.withOpacity(0.09),
//                                 offset: Offset(0, 4),
//                                 blurRadius: 10.0,
//                               ),
//                               BoxShadow(
//                                 color: Colors.white,
//                                 offset: Offset(0, -4),
//                                 blurRadius: 10.0,
//                               )
//                             ],
//                             borderRadius: BorderRadius.circular(8.0),
//                           ),
//                           child: Column(
//                             children: [
//                               Text("# ${paymentInfo.first.refNumber}",
//                                 style: theme.textTheme.bodyLarge!.copyWith(
//                                   fontWeight: FontWeight.w700,
//                                 ),
//                               ),
//                               Text("Status: ${paymentInfo.first.status}",
//                                 style: theme.textTheme.bodyMedium!.copyWith(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       ),
//     ),
//   );
// }
}