import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/alpha_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/base_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/base_text_field_widget.dart';

class AlphabeticTextfieldWidget extends BaseTextfieldWidget {
  final String initialText;
  final bool hasClearTextButton;
  final String? leadingIconPath;
  final double? leadingIconSize;
  final String? trailingIconPath;

  const AlphabeticTextfieldWidget({
    super.key,
    required super.onTextChanged,
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
  });

  @override
  AlphabeticTextfieldWidgetState createState() =>
      AlphabeticTextfieldWidgetState();
}

class AlphabeticTextfieldWidgetState
    extends BaseTextfieldWidgetState<AlphabeticTextfieldWidget> {
  @override
  BaseTextFieldViewModel createViewModel() {
    return AlphabeticTextfieldViewmodel(
      TextFieldEntity(
        text: widget.initialText,
        labelText: widget.labelText,
        hasClearTextButton: widget.hasClearTextButton,
        leadingIconPath: widget.leadingIconPath,
        trailingIconPath: widget.trailingIconPath,
        leadingIconSize: widget.leadingIconSize,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')),
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
