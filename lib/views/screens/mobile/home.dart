import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/screens/auth/login.dart';
import 'package:web_school/views/screens/forms/form.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';

class ResponsiveMobileScreen extends StatefulWidget {
  const ResponsiveMobileScreen({super.key});

  @override
  State<ResponsiveMobileScreen> createState() => _ResponsiveMobileScreenState();
}

class _ResponsiveMobileScreenState extends State<ResponsiveMobileScreen> {

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    final ThemeData theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      PngImages.background,
                      height: 120,
                      width: 120,
                    ),
                    const SizedBox(height: 24.0),
                    Text("St.Jude Agro Industrial Secondary School",
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Text("Topas Proper Nabua, Camarines Sur",
                      style: theme.textTheme.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 100),
                    Text(
                      "Logged in as a",
                      style: theme.textTheme.bodyMedium!.copyWith(
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    PrimaryButton(
                      label: "Instructor",
                      onPressed: () {
                        auth.updateAuthor("instructor");
                        context.go(LoginScreen.route);
                      },
                    ),
                    const SizedBox(height: 12.0),
                    PrimaryButton(
                      label: "Student",
                      onPressed: () {
                        auth.updateAuthor("student");
                        context.go(LoginScreen.route);
                      },
                    ),
                    const SizedBox(height: 12.0),
                    PrimaryButton(
                      label: "Admin",
                      onPressed: () {
                        auth.updateAuthor("admin");
                        context.go(LoginScreen.route);
                      },
                    ),
                    const SizedBox(height: 24.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                                "Let us help you make your document."),
                            GestureDetector(
                              onTap: () => context.go(FormsScreen.route),
                              child: Text(
                                "Click here to start.",
                                style: TextStyle(
                                  color: ColorTheme.primaryRed,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
