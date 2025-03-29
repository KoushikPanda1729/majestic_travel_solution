import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

/// Onboarding navigation button (Next/Previous)
class FloatingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String iconPath;
  final Color backgroundColor;
  final Color iconColor;
  final bool isRotated;
  final bool boxShadow;
  final bool isDisabled;
  final bool isActive;
  final double buttonSize;
  final double iconSize;

  const FloatingButton({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.backgroundColor,
    required this.iconColor,
    this.isRotated = false,
    required this.isDisabled,
    this.isActive = false,
    required this.buttonSize,
    required this.iconSize,
    this.boxShadow = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isDisabled ? null : onPressed,
      child: Container(
        width: buttonSize,
        height: buttonSize,
        decoration: BoxDecoration(
          color: isDisabled ? Colors.grey : backgroundColor,
          shape: BoxShape.circle,
          boxShadow: boxShadow
              ? const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: Offset(0, 1),
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Transform.rotate(
            angle: isRotated ? 3.1416 : 0,
            child: SvgPicture.asset(
              iconPath,
              height: iconSize,
              width: iconSize,
              colorFilter: ColorFilter.mode(
                isActive ? AppColors.teal : iconColor,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
