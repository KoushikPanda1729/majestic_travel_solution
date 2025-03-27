import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/base_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/domain/entities/button_entity.dart';

class OutlineButtonWidget extends BaseButtonWidget {
  OutlineButtonWidget({
    required String label,
    Color? labelColor,
    String? iconPath,
    Color? borderColor,
    Color? iconColor,
    bool isLeadingIcon = true,
    bool isEnabled = true,
    bool isCircle = false,
    required super.onPressed,
    super.isLoading = false,
    super.key,
  }) : super(
            buttonEntity: ButtonEntity(
          label: label,
          labelColor: labelColor,
          iconPath: iconPath,
          isLeadingIcon: isLeadingIcon,
          isEnabled: isEnabled,
          isSolid: false,
          borderColor: borderColor,
          iconColor: iconColor,
          isCircle: isCircle,
        ));
  @override
  Widget buildButtonContent(BuildContext context) {
    return GestureDetector(
      onTap: buttonEntity.isEnabled ? onPressed : null,
      child: Container(
        height: 45.0,
        decoration: BoxDecoration(
          border: Border.all(
            color: buttonEntity.isEnabled
                ? buttonEntity.borderColor ?? Theme.of(context).primaryColor
                : buttonEntity.borderColor?.withOpacity(0.5) ??
                    Theme.of(context).primaryColor.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(
            buttonEntity.isCircle! ? 28.0 : 8.0,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
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
