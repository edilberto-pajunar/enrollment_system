import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:web_school/networks/auth.dart';
import 'package:web_school/networks/router/routes.gr.dart';
import 'package:web_school/values/strings/colors.dart';
import 'package:web_school/values/strings/images.dart';
import 'package:web_school/views/widgets/buttons/primary.dart';

@RoutePage()
class ResponsiveWebScreen extends StatefulWidget {
  const ResponsiveWebScreen({super.key});

  @override
  State<ResponsiveWebScreen> createState() => _ResponsiveWebScreenState();
}

class _ResponsiveWebScreenState extends State<ResponsiveWebScreen> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.asset(Videos.background)
      ..initialize().then((_) {
        setState(() {});
      })
      ..setLooping(true)
      ..setVolume(0)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: size.height,
            width: size.width,
            child: VideoPlayer(_videoPlayerController),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.3),
                borderRadius: BorderRadius.circular(24.0),
              ),
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
                      const SizedBox(height: 100),
                      Text(
                        "Logged in as a",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      PrimaryButton(
                        label: "Instructor",
                        onPressed: () {
                          auth.updateAuthor("instructor");
                          context.pushRoute(const LoginRoute());
                        },
                      ),
                      const SizedBox(height: 12.0),
                      PrimaryButton(
                        label: "Student",
                        onPressed: () {
                          auth.updateAuthor("student");
                          context.pushRoute(const LoginRoute());
                        },
                      ),
                      const SizedBox(height: 12.0),
                      PrimaryButton(
                        label: "Admin",
                        onPressed: () {
                          auth.updateAuthor("admin");
                          context.pushRoute(const LoginRoute());
                        },
                      ),
                      const SizedBox(height: 24.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                      "Let us help you make your document."),
                                  GestureDetector(
                                    onTap: () =>
                                        context.pushRoute(const FormsRoute()),
                                    child: Text(
                                      "Click here to start.",
                                      style: TextStyle(
                                        color: ColorTheme.primaryRed,
                                      ),
                                    ),
                                  )
                                ],
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
          ),
        ],
      ),
    );
  }
}
