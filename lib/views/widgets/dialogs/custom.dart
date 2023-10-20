import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_school/models/application/application.dart';
import 'package:web_school/networks/commons.dart';
import 'package:web_school/networks/payment.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';
import 'package:web_school/views/widgets/fields/primary.dart';

class CustomDialog {
  void showAgree(
    BuildContext context, {
    required Function()? onTap,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(message),
          actions: [
            TextButton(
              onPressed: onTap,
              child: const Text("Yes"),
            ),
            TextButton(
              onPressed: () => context.popRoute(),
              child: const Text("No"),
            ),
          ],
        );
      },
    );
  }

  void showPayment(BuildContext context, ApplicationInfo applicationInfo) {

    final GlobalKey<FormState> formKey = GlobalKey();
    final PaymentDB paymentDB = Provider.of<PaymentDB>(context, listen: false);

    final ThemeData theme = Theme.of(context);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enrollment Payment"),
          content: StatefulBuilder(
            builder: (context, setState) => SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Description:",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("Enrollment fee (Additional if transferee)",
                      style: theme.textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 24.0),

                    Text("Please pay to the following credentials:",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text("Name: Delmar",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text("Account number: +639684059727",
                      style: theme.textTheme.bodyMedium,
                    ),
                    Text("Amount: PHP 1300.00",
                      style: theme.textTheme.bodyMedium,
                    ),

                    Image.asset(PngImages.paymentQr),
                    const SizedBox(height: 24.0),

                    Text("Please type the reference number in your receipt:",
                      style: theme.textTheme.bodyMedium,
                    ),
                    PrimaryTextField(
                      fieldKey: PaymentDB.amountKey,
                      controller: PaymentDB.amountText,
                      label: "Reference Number:",
                      validator: Commons.forcedTextValidator,
                    ),

                    PrimaryTextField(
                      fieldKey: PaymentDB.referenceKey,
                      controller: PaymentDB.referenceText,
                      label: "Amount:",
                      textInput: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      validator: Commons.forcedTextValidator,
                    ),
                    const SizedBox(height: 24.0),
                    PrimaryButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          paymentDB.updateStudentPayment(context, applicationInfo.userModel.id);
                        }
                      },
                      label: "Submit",
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

}
