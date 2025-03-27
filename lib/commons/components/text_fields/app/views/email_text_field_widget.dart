import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/base_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/email_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/base_text_field_widget.dart';

class EmailTextfieldWidget extends BaseTextfieldWidget {
  final String initialText;
  final bool hasClearTextButton;
  final String? leadingIconPath;
  final String? trailingIconPath;

  const EmailTextfieldWidget({
    super.key,
    this.initialText = "",
    this.hasClearTextButton = false,
    this.leadingIconPath,
    this.trailingIconPath,
    super.enabled,
    super.readOnly,
    super.focusNode,
    super.labelText,
    required super.onTextChanged,
    super.hintText = "",
  });

  @override
  EmailTextFieldWidgetState createState() => EmailTextFieldWidgetState();
}

class EmailTextFieldWidgetState
    extends BaseTextfieldWidgetState<EmailTextfieldWidget> {
  @override
  BaseTextFieldViewModel createViewModel() {
    return EmailTextfieldViewmodel(
      TextFieldEntity(
          text: widget.initialText,
          hasClearTextButton: widget.hasClearTextButton,
          leadingIconPath: widget.leadingIconPath,
          trailingIconPath: widget.trailingIconPath,
          labelText: widget.labelText),
    );
  }
}
