import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CustomDialog {
  void showAgree(
    BuildContext context, {
    required Function()? onTap,
  }) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: const Text("Are you sure you want to delete?"),
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
}
