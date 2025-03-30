import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alphabetic_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class PlanTripScreen extends StatefulWidget {
  const PlanTripScreen({super.key});

  @override
  State<PlanTripScreen> createState() => _PlanTripScreenState();
}

class _PlanTripScreenState extends State<PlanTripScreen> {
  int guestCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            NavBar(
              leadingIcon: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingButton(
                      onPressed: () {
                        context.pop();
                      },
                      iconPath: AppIcons.angleRight,
                      isRotated: true,
                      backgroundColor: Colors.black.withOpacity(0.1),
                      iconColor: Colors.black,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                      boxShadow: false,
                    ),
                    const Text(
                      "Plan a New Trip ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              trailingIcon: const SizedBox(),
            ),

            // Main Content
            Expanded(
              child: Container(
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App Logo
                      Center(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              AppImages.logo,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Heading
                      const Center(
                        child: Text(
                          "Let's Get Start Plan\nA New Trip",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),

                      // Where to
                      const Text(
                        "Where to?",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      AlphabeticTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "eg: victoria",
                      ),
                      const SizedBox(height: 24),

                      // Trip Date
                      const Text(
                        "Trip Date",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),

                      AlphaNumericTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "DD/MM/YYYY",
                      ),
                      const SizedBox(height: 24),

                      // Add guest list
                      const Text(
                        "Add guest list",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              setState(() {
                                if (guestCount > 0) guestCount--;
                              });
                            },
                            icon: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child:
                                  const Icon(Icons.remove, color: Colors.black),
                            ),
                          ),
                          Text(
                            guestCount.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                guestCount++;
                              });
                            },
                            icon: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(Icons.add, color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Trip Name
                      const Text(
                        "Trip Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 8),
                      AlphabeticTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "eg: victoria trip",
                      ),
                      const SizedBox(height: 30),

                      SolidButtonWidget(
                        label: "Let's Start your Plan",
                        onPressed: () {
                          context.push("/my_trip");
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),

            // Bottom Home Indicator (iPhone style)
            Container(
              width: double.infinity,
              height: 5,
              color: Colors.white,
              alignment: Alignment.center,
              child: Container(
                width: 100,
                height: 5,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
