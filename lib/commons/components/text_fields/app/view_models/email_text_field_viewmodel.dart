import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/validation_message_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/utils/email_validator.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/base_text_field_viewmodel.dart';

class EmailTextfieldViewmodel extends BaseTextFieldViewModel {
  EmailTextfieldViewmodel(super.initialState);
  @override
  List<ValidationMessage> validateText(TextFieldEntity state) {
    if (state.isDirty) {
      return EmailValidator.validate(state.text);
    }
    return [];
  }
}
