import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/validation_message_entity.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class EmailValidator {
  EmailValidator(String email);
  static bool isValid(String email) {
    if (email.isEmpty) return false;
    const emailPattern =
        r'^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$';
    return RegExp(emailPattern).hasMatch(email);
  }

  static List<ValidationMessage> validate(String email) {
    final List<ValidationMessage> validationMessages = [];
    if (email.isEmpty) {
      validationMessages.add(ValidationMessage(
          "Email can not be empty", AppIcons.warning,
          isValid: false, color: AppColors.orange));
    } else if (!isValid(email)) {
      validationMessages.add(ValidationMessage(
          "Please Enter a Valid Email", AppIcons.warning,
          color: AppColors.orange));
    }
    return validationMessages;
  }
}
