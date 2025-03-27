import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alphabetic_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/email_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final ValueNotifier<bool> isMaleNotifier = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Create your account",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish",
                      ),
                    ),
                    const SizedBox(height: 40),
                    AlphabeticTextfieldWidget(
                      labelText: "Name*",
                      onTextChanged: (value) {},
                    ),
                    const SizedBox(height: 16),
                    EmailTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "Email*",
                    ),
                    const SizedBox(height: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildLabel("Date of Birth*"),
                        const SizedBox(height: 12),
                        AlphaNumericTextfieldWidget(
                          onTextChanged: (value) {},
                          labelText: "DD-MM-YYYY",
                        ),
                        const SizedBox(height: 20),
                        buildLabel("Gender*"),
                        const SizedBox(height: 12),
                        ValueListenableBuilder<bool>(
                          valueListenable: isMaleNotifier,
                          builder: (context, isMale, child) {
                            return Row(
                              children: [
                                buildGenderButton("Male", true, isMale),
                                const SizedBox(width: 10),
                                buildGenderButton("Female", false, isMale),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    AlphabeticTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "City*",
                    ),
                    const SizedBox(height: 16),
                    AlphaNumericTextfieldWidget(
                      onTextChanged: (value) {},
                      labelText: "Referral Code (Optional)",
                    ),
                    const SizedBox(height: 40),
                    SolidButtonWidget(
                      label: "Click Here",
                      onPressed: () {
                        context.go("/");
                      },
                      isCircle: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontFamily: "Mulish",
        color: Colors.teal,
      ),
    );
  }

  Widget buildGenderButton(String text, bool male, bool isMale) {
    return GestureDetector(
      onTap: () {
        isMaleNotifier.value = male;
      },
      child: Container(
        height: 38,
        width: 83,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: isMale == male
              ? [
                  const BoxShadow(
                    color: Color.fromRGBO(211, 211, 211, 0.7),
                    blurRadius: 1,
                    spreadRadius: 0.7,
                    offset: Offset(0, 0),
                  ),
                ]
              : [],
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
