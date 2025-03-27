import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/base_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/domain/entities/button_entity.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class SolidButtonWidget extends BaseButtonWidget {
  final Color? backgroundColor;
  SolidButtonWidget({
    required String label,
    Color? labelColor,
    String? iconPath,
    bool isLeadingIcon = true,
    bool isEnabled = true,
    this.backgroundColor = AppColors.teal,
    required super.onPressed,
    super.isLoading = false,
    bool isCircle = false,
    super.key,
  }) : super(
            buttonEntity: ButtonEntity(
          label: label,
          labelColor: labelColor ?? AppColors.white,
          iconPath: iconPath,
          isLeadingIcon: isLeadingIcon,
          isEnabled: isEnabled,
          isSolid: true,
          isCircle: isCircle,
        ));

  @override
  Widget buildButtonContent(BuildContext context) {
    return GestureDetector(
      onTap: buttonEntity.isEnabled ? onPressed : null,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          color: buttonEntity.isEnabled
              ? backgroundColor
              : backgroundColor?.withOpacity(0.5),
          borderRadius: BorderRadius.circular(
            buttonEntity.isCircle! ? 28.0 : 8.0,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (isLoading)
                    buildLoadingIndicator()
                  else ...[
                    if (buttonEntity.isLeadingIcon) buildIcon(),
                    if (buttonEntity.iconPath != null &&
                        buttonEntity.label != '')
                      const SizedBox(width: 10),
                    buildLabel(),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
