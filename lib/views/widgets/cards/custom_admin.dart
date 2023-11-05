import 'package:flutter/material.dart';
import 'package:web_school/values/strings/images.dart';

class CustomAdminCard extends StatelessWidget {
  const CustomAdminCard({
    required this.onTap,
    required this.title,
    required this.subtitle,
    required this.color,
    super.key,
  });
  
  final Function() onTap;
  final String title;
  final String subtitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: color.withOpacity(0.7),
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                      style: theme.textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(subtitle,
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 12.0
                      ),
                    ),
                  ],
                ),
                Opacity(
                  opacity: 0.3,
                  child: Image.asset(PngImages.addPeople),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              color: color,
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("More info",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Icon(Icons.arrow_circle_right,
                      color: Colors.white,
                      size: 15,
                    )
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
