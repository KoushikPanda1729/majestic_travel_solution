import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class StepperItem extends StatelessWidget {
  final int step;
  final int currentStep;
  final String label;
  final String icon;

  const StepperItem({
    super.key,
    required this.step,
    required this.currentStep,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = step <= currentStep;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isActive ? AppColors.teal : const Color(0xFFD1EDEB),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SvgPicture.asset(
            icon,
            width: 18,
            height: 18,
            colorFilter: ColorFilter.mode(
              isActive ? Colors.white : AppColors.teal,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontFamily: "Mulish",
            color: isActive ? Colors.teal : Colors.grey,
            fontWeight: isActive ? FontWeight.w400 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
