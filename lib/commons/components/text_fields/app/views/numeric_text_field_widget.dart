import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/base_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/numeric_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/base_text_field_widget.dart';

class NumericTextfieldWidget extends BaseTextfieldWidget {
  final String initialText;
  final bool hasClearTextButton;
  final String? leadingIconPath;
  final double? leadingIconSize;
  final String? trailingIconPath;

  const NumericTextfieldWidget({
    super.key,
    this.initialText = '',
    this.hasClearTextButton = false,
    this.leadingIconPath,
    this.leadingIconSize,
    this.trailingIconPath,
    super.hintText = "",
    bool? enabled,
    bool? readOnly,
    super.focusNode,
    super.labelText,
    required super.onTextChanged,
    super.borderNone = false,
  });

  @override
  NumericTextfieldWidgetState createState() => NumericTextfieldWidgetState();
}

class NumericTextfieldWidgetState
    extends BaseTextfieldWidgetState<NumericTextfieldWidget> {
  @override
  BaseTextFieldViewModel createViewModel() {
    return NumericTextfieldViewmodel(
      TextFieldEntity(
        text: widget.initialText,
        hasClearTextButton: widget.hasClearTextButton,
        leadingIconPath: widget.leadingIconPath,
        trailingIconPath: widget.trailingIconPath,
        leadingIconSize: widget.leadingIconSize,
        labelText: widget.labelText,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9 ]')),
        ],
      ),
    );
  }

  @override
  Widget? buildLeadingIcon(TextFieldEntity state) {
    if (state.leadingIconPath == null) return null;

    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16.0, end: 8.0),
      child: SvgPicture.asset(
        state.leadingIconPath!,
        width: state.leadingIconSize,
      ),
    );
  }
}
