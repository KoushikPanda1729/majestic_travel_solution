import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TextfieldDropdown<T> extends StatelessWidget {
  final String label;
  final String title;
  final String hintText;
  final T selectedItem;
  final List<T> items;
  final bool isDisabled;
  final bool isCircularBorder;
  final bool borderNone;
  final ValueChanged<T> onItemSelected;
  final String Function(T) getDisplayText;
  final Widget Function(T)? itemBuilder;

  const TextfieldDropdown({
    super.key,
    required this.label,
    this.title = "",
    required this.hintText,
    required this.selectedItem,
    required this.items,
    required this.onItemSelected,
    required this.getDisplayText,
    this.itemBuilder,
    this.isCircularBorder = false,
    this.isDisabled = false,
    this.borderNone = false,
  });

  void _openPicker(BuildContext context) {
    openCustomBottomSheet(
      context: context,
      child: items.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18,
                            height: 1.22,
                            fontWeight: FontWeight.w600,
                          ),
                        ))
                    : const SizedBox.shrink(),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    start: 16.0,
                    end: 16.0,
                    top: 12.0,
                  ),
                  child: SizedBox(
                    height: 500,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: items.map((item) {
                          final bool isSelected = item == selectedItem;
                          return Column(
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        onItemSelected(item);
                                        Navigator.pop(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 12.0),
                                        child: itemBuilder?.call(item) ??
                                            Text(
                                              getDisplayText(item),
                                              style: TextStyle(
                                                fontSize: 14,
                                                height: 1.8,
                                                fontWeight: FontWeight.w500,
                                                color: isSelected
                                                    ? AppColors.teal
                                                    : Colors.black,
                                              ),
                                            ),
                                      ),
                                    ),
                                    isSelected
                                        ? SvgPicture.asset(
                                            AppIcons.check,
                                            colorFilter: const ColorFilter.mode(
                                              AppColors.teal,
                                              BlendMode.srcIn,
                                            ),
                                            width: 20,
                                            height: 20,
                                          )
                                        : const SizedBox()
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12.0),
                            ],
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              child: const Center(
                child: Text(
                  'No category available',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.8,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label.isEmpty
            ? const SizedBox.shrink()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.8,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
        TextFormField(
          controller: TextEditingController(text: getDisplayText(selectedItem)),
          readOnly: true,
          enabled: !isDisabled,
          onTap: () => _openPicker(context),
          style: const TextStyle(
            fontSize: 16,
            height: 1.8,
            fontWeight: FontWeight.w500,
          ),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsetsDirectional.all(
              10.0,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
              fontSize: 14,
              height: 1.8,
              fontWeight: FontWeight.w500,
              color: Color(0xFF727272),
            ),
            border: borderNone
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: isCircularBorder
                        ? BorderRadius.circular(30.0)
                        : BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1EDEB),
                      width: 1.0,
                    ),
                  ),
            enabledBorder: borderNone
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: isCircularBorder
                        ? BorderRadius.circular(30.0)
                        : BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: Color(0xFFD1EDEB),
                      width: 1.0,
                    ),
                  ),
            focusedBorder: borderNone
                ? InputBorder.none
                : OutlineInputBorder(
                    borderRadius: isCircularBorder
                        ? BorderRadius.circular(30.0)
                        : BorderRadius.circular(8.0),
                    borderSide: const BorderSide(
                      color: AppColors.teal,
                      width: 1.0,
                    ),
                  ),
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(
                  end: 5.0), // Reduced from 13.0
              child: SizedBox(
                width: 18.0,
                height: 18.0,
                child: SvgPicture.asset(
                  AppIcons.angleSmallDown,
                  height: 18.0,
                  width: 18.0,
                ),
              ),
            ),
            suffixIconConstraints: const BoxConstraints(
              maxHeight: 18.0,
              maxWidth: 24.0, // Reduced from 34.0
            ),
          ),
        ),
      ],
    );
  }
}
