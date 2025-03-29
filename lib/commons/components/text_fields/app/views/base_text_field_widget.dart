import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/helper_message_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/text_field_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/domains/entities/validation_message_entity.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/view_models/base_text_field_viewmodel.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

abstract class BaseTextfieldWidget extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onTextChanged;
  final FocusNode? focusNode;
  final bool enabled;
  final bool readOnly;
  final String? labelText;
  final bool borderNone;

  const BaseTextfieldWidget(
      {super.key,
      required this.hintText,
      required this.onTextChanged,
      this.focusNode,
      this.enabled = true,
      this.readOnly = false,
      this.labelText,
      this.borderNone = false});

  @override
  BaseTextfieldWidgetState<BaseTextfieldWidget> createState();
}

abstract class BaseTextfieldWidgetState<T extends BaseTextfieldWidget>
    extends State<T> {
  late TextEditingController controller;
  late BaseTextFieldViewModel viewModel;

  BaseTextFieldViewModel createViewModel();

  @override
  void initState() {
    super.initState();
    viewModel = createViewModel();

    controller = TextEditingController(text: viewModel.value.text);

    controller.addListener(() {
      viewModel.updateText(controller.text);
      widget.onTextChanged(controller.text);
    });

    viewModel.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextFieldEntity>(
      valueListenable: viewModel,
      builder: (context, state, child) {
        if (controller.text != state.text) {
          controller.text = state.text;
          controller.selection = TextSelection.fromPosition(
            TextPosition(offset: controller.text.length),
          );
        }

        final validationMessages = viewModel.validateText(state);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildTextField(state),
            if (validationMessages.isNotEmpty) const SizedBox(height: 8.0),
            buildValidationMessages(validationMessages),
          ],
        );
      },
    );
  }

  Widget buildTextField(TextFieldEntity state) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        style: const TextStyle(
          fontFamily: 'Mulish',
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.black,
        ),
        controller: controller,
        focusNode: widget.focusNode,
        obscureText: state.obscureText,
        enabled: widget.enabled,
        readOnly: widget.readOnly,
        inputFormatters: state.inputFormatters,
        decoration: InputDecoration(
          labelText: state.labelText,
          isCollapsed: true,
          contentPadding: const EdgeInsetsDirectional.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ),
          labelStyle: TextStyle(
            color: AppColors.black.withOpacity(0.5),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(0.5),
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          prefixIcon: buildLeadingIcon(state),
          suffixIcon: buildTrailingIcon(state),
          suffixIconConstraints: const BoxConstraints(
            maxHeight: 18.0,
            maxWidth: 60.0,
          ),
          border: widget.borderNone
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
          enabledBorder: widget.borderNone
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
          focusedBorder: widget.borderNone
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.5),
                    width: 1.0,
                  ),
                ),
          errorBorder: widget.borderNone
              ? InputBorder.none
              : OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                    color: AppColors.orange,
                    width: 1.0,
                  ),
                ),
        ),
        onChanged: (text) {
          viewModel.updateText(text);
          widget.onTextChanged(text);
        },
      ),
    );
  }

  Widget? buildLeadingIcon(TextFieldEntity state) {
    if (state.leadingIconPath != null) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: SvgPicture.asset(
          state.leadingIconPath!,
          height: 24.0,
          width: 24.0,
        ),
      );
    }
    return null;
  }

  Widget? buildTrailingIcon(TextFieldEntity state) {
    if (state.hasClearTextButton && state.text.isNotEmpty) {
      return IconButton(
        icon: SvgPicture.asset(AppIcons.crossSmall),
        onPressed: viewModel.clearText,
      );
    } else if (state.trailingIconPath != null) {
      return IconButton(
        icon: SvgPicture.asset(state.trailingIconPath!),
        onPressed: state.obscureText ? viewModel.toggleObscureText : null,
      );
    }
    return null;
  }

  Widget buildHelperMessages(List<HelperMessage> messages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: messages.map((message) {
        return Row(
          children: [
            SvgPicture.asset(
              message.iconPath,
              height: 16.0,
              width: 16.0,
              colorFilter: const ColorFilter.mode(
                AppColors.teal,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4.0),
            Text(
              message.message,
              style: const TextStyle(
                fontFamily: 'Mulish',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: AppColors.teal,
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  Widget buildValidationMessages(List<ValidationMessage> messages) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (int i = 0; i < messages.length; i++) ...[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                messages[i].iconPath,
                height: 20.0,
                width: 20.0,
                colorFilter: ColorFilter.mode(
                  messages[i].color,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 4.0),
              Flexible(
                child: Text(
                  messages[i].message,
                  style: TextStyle(
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: messages[i].color,
                  ),
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
          if (i < messages.length - 1) const SizedBox(height: 8.0),
        ],
      ],
    );
  }
}
