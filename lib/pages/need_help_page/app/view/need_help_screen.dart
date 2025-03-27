import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/dropdown_text_field.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/numeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class NeedHelpScreen extends StatelessWidget {
  const NeedHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Dismiss keyboard when tapping outside of text fields
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      NavBar(
                        leadingIcon: FloatingButton(
                          onPressed: () {
                            context.pop();
                          },
                          iconPath: AppIcons.angleSmallRight,
                          backgroundColor: AppColors.white,
                          iconColor: AppColors.black,
                          isDisabled: false,
                          buttonSize: 42,
                          iconSize: 20,
                          isRotated: true,
                        ),
                        trailingIcon: const SizedBox(),
                      ),
                      const SizedBox(height: 13),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Need Assistance? We're Here to Help!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 34),

                            TextfieldDropdown<String>(
                              title: "Inquiry Type",
                              label: '',
                              hintText: 'Inquiry Type',
                              selectedItem: '',
                              items: const [
                                "Billing",
                                "Technical Issue",
                                "General Inquiry"
                              ],
                              onItemSelected: (accountType) {},
                              getDisplayText: (accountType) => accountType,
                            ),
                            const SizedBox(height: 12),
                            // Issue Description TextField
                            TextField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                hintText: "Describe Your Issue",
                                hintStyle: const TextStyle(
                                  color: Color(0xFF727272),
                                ),
                                filled: true,
                                fillColor: Colors.white, // Background color
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color:
                                        Color(0xFFD1EDEB), // Light teal border
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Colors
                                        .teal, // Border color when focused
                                    width: 1.0,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFD1EDEB), // Default border
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Expanded(
                                  child: AlphaNumericTextfieldWidget(
                                    onTextChanged: (value) {},
                                    labelText: "DD-MM-YYYY",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: NumericTextfieldWidget(
                                    onTextChanged: (value) {},
                                    hintText: 'Age',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            const Text("Gender"),
                            const SizedBox(height: 3),
                            Row(
                              children: [
                                buildGenderButton("Male", true),
                                const SizedBox(width: 10),
                                buildGenderButton("Female", false),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                Expanded(
                                  child: AlphaNumericTextfieldWidget(
                                    onTextChanged: (value) {},
                                    labelText: "Height (ft/inch)",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: NumericTextfieldWidget(
                                    onTextChanged: (value) {},
                                    hintText: 'Weight (kg)',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 40),
                            // Request a Callback Button
                            SolidButtonWidget(
                              label: "Continue",
                              onPressed: () {
                                context.push("/health_score_form");
                              },
                              isCircle: true,
                            ),
                            // Add some bottom padding to ensure content is not hidden
                            const SizedBox(height: 20),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget buildGenderButton(String text, bool male) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 38,
        width: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(211, 211, 211, 0.7),
              blurRadius: 1,
              spreadRadius: 0.7,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              male ? AppIcons.male : AppIcons.female,
              width: 18,
              height: 18,
              colorFilter: const ColorFilter.mode(
                Colors.teal,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              text,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
