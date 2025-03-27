import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class HealthCard extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onPress;

  const HealthCard({
    super.key,
    required this.icon,
    required this.text,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 61,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.lightTeal, width: 1),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.lightTeal, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                icon,
                width: 17,
                height: 17,
              ),
            ),
            const SizedBox(height: 5),
            // Text with overflow and max width
            Text(
              text,
              style: const TextStyle(
                fontSize: 10,
                height: 1,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              softWrap: false,
            ),
          ],
        ),
      ),
    );
  }
}
