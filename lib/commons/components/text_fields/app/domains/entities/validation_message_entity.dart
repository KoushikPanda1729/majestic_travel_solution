import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class ValidationMessage {
  final String message;
  final String iconPath;
  final bool isValid;
  final Color color; // Add color property

  ValidationMessage(
    this.message,
    this.iconPath, {
    this.isValid = false,
    this.color = AppColors.orange,
  });

  @override
  String toString() {
    return 'ValidationMessage(message: $message, iconPath: $iconPath, isValid: $isValid, color: $color)';
  }
}
