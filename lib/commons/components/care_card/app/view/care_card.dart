import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class CareCard extends StatelessWidget {
  final String text;
  final String icon;
  final VoidCallback onPress;

  const CareCard({
    super.key,
    required this.text,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 144,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.teal, width: 1.5),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                text,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mulish',
                ),
              ),
            ),
            const SizedBox(width: 8),
            SvgPicture.asset(
              icon,
              width: 24,
              height: 24,
              colorFilter:
                  const ColorFilter.mode(AppColors.teal, BlendMode.srcIn),
            ),
          ],
        ),
      ),
    );
  }
}
