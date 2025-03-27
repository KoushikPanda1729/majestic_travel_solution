import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class FilterSwitchWidget extends StatelessWidget {
  final bool isSwitched;
  final VoidCallback onFilterPressed;
  final ValueChanged<bool> onToggle;

  const FilterSwitchWidget({
    super.key,
    required this.isSwitched,
    required this.onToggle,
    required this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () => onToggle(!isSwitched), // Toggle the switch state
              child: Container(
                width: 35,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSwitched ? AppColors.teal : Colors.grey.shade400,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 4),
                alignment:
                    isSwitched ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  width: 13,
                  height: 13,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 5),
            const Text(
              'Include Packages',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0xFF727272),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: onFilterPressed,
          child: Row(
            children: [
              const Text(
                'Filter',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF727272),
                ),
              ),
              const SizedBox(width: 5),
              SvgPicture.asset(
                AppIcons.filter,
                width: 28,
                height: 28,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
