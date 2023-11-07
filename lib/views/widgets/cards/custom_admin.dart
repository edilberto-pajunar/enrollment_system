import 'package:flutter/material.dart';
import 'package:web_school/values/strings/images.dart';

class CustomAdminCard extends StatelessWidget {
  const CustomAdminCard({
    required this.onTap,
    required this.imageIcon,
    required this.title,
    required this.subtitle,
    required this.color,
    super.key,
  });
  
  final Function() onTap;
  final String imageIcon;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: color,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onTap,
          hoverColor: Colors.white24,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
              vertical: 12.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: SizedBox.square(
                    dimension: size.width * 0.09,
                    child: Image.asset(
                      imageIcon,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(title,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4.0),
                Text(subtitle,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Column(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Text(title,
                //             style: theme.textTheme.titleSmall!.copyWith(
                //               color: Colors.white,
                //               fontWeight: FontWeight.w700,
                //             ),
                //           ),
                //           const SizedBox(height: 4.0),
                //           Text(subtitle,
                //             style: theme.textTheme.bodyMedium!.copyWith(
                //               color: Colors.white,
                //               fontSize: 12.0
                //             ),
                //           ),
                //         ],
                //       ),
                //       Opacity(
                //         opacity: 0.3,
                //         child: Image.asset(PngImages.addPeople),
                //       ),
                //     ],
                //   ),
                // ),
                // InkWell(
                //   onTap: onTap,
                //   child: Container(
                //     padding: const EdgeInsets.symmetric(vertical: 4.0),
                //     color: color,
                //     child: Center(
                //       child: Row(
                //         crossAxisAlignment: CrossAxisAlignment.center,
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //           Text("More info",
                //             style: theme.textTheme.bodyMedium!.copyWith(
                //               color: Colors.white,
                //             ),
                //           ),
                //           const SizedBox(width: 8.0),
                //           Icon(Icons.arrow_circle_right,
                //             color: Colors.white,
                //             size: 15,
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                // ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
