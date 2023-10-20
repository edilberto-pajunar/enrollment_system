import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/models/payment.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/constant/payment_status.dart';
import 'package:web_school/views/widgets/body/wrapper/stream.dart';

@RoutePage()
class SummaryPaymentScreen extends StatefulWidget {
  const SummaryPaymentScreen({
    required this.applicationInfo,
    super.key,
  });

  final List<ApplicationInfo> applicationInfo;

  @override
  State<SummaryPaymentScreen> createState() => _SummaryPaymentScreenState();
}

class _SummaryPaymentScreenState extends State<SummaryPaymentScreen> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);
      paymentDB.updatePaymentModelStream();
    });

  }

  final GlobalKey<ScaffoldState> globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {

    final ThemeData theme = Theme.of(context);
    final PaymentDB paymentDB = Provider.of<PaymentDB>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Payments"),
      ),
      body: SafeArea(
        child: StreamWrapper<List<PaymentModel>>(
          stream: paymentDB.paymentModelStream,
          child: (paymentList) {
            return Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: paymentList!.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            context.router.push(PaymentUpdateRoute(
                              paymentInfo: paymentList[index],
                            ));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.09),
                                  offset: Offset(0, 4),
                                  blurRadius: 10.0,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(0, -4),
                                  blurRadius: 10.0,
                                )
                              ],
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Column(
                              children: [
                                Text("# ${paymentList[index].refNumber}",
                                  style: theme.textTheme.bodyLarge!.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text("Status: ${paymentList[index].status}",
                                  style: theme.textTheme.bodyMedium!.copyWith(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
        ),
      ),
    );
  }
}
