import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/widgets/cartography_widget.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/widgets/feature_icon.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/widgets/profile_description.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/widgets/test_detail_card.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/widgets/test_feature_card.dart';

class BookingDetailsScreen extends StatelessWidget {
  const BookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
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
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container with two cards
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            spreadRadius: 1,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          // First Card - Image and Title
                          const TestDetailCard(
                            imagePath: AppImages.test1,
                            title: "Complete Blood Count (CBC)",
                            subtitle: "29 Parameters",
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          // Second Card - Features and Buttons
                          TestFeatureCard(
                            features: const [
                              "Total 29 Tests",
                              "Overnight Fasting Required",
                              "For All Genders",
                              "Online Report within 1 Day",
                              "For All Genders",
                              "Online Report within 1 Day",
                            ],
                            price: "₹1399",
                            onAddToCart: () {
                              context.push("/checkout");
                            },
                            onBookNow: () {
                              context.push("/checkout");
                            },
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    // Profile description
                    const ProfileDescription(
                      description:
                          "The Complete Blood Count (CBC) test analyzes red blood cells, "
                          "white blood cells, and platelets, providing vital insights into your "
                          "health. It helps diagnose anemia, infections, leukemia, and clotting disorders.",
                    ),
                    const SizedBox(height: 21),
                    // Features
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FeatureIconCard(
                          text: "NABL, CAP, UKAS",
                          icon: AppImages.certifiedLogo,
                        ),
                        FeatureIconCard(
                          text: "NABL, CAP, UKAS",
                          icon: AppImages.agentsLogo,
                        ),
                        FeatureIconCard(
                          text: "Guaranteed Precision",
                          icon: AppImages.precisionLogo,
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    // CartographySection
                    const CartographySection(
                      tests: [
                        "Haemoglobin (Hb)",
                        "RBC Count",
                        "PCV / Hematocrit",
                        "MCV",
                      ],
                    ),
                    const SizedBox(height: 35),

                    // Bottom Buttons
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            margin: const EdgeInsets.only(bottom: 21),
            child: Row(
              children: [
                Expanded(
                    child: SolidButtonWidget(
                  label: "Add to Cart",
                  onPressed: () {
                    context.push("/checkout");
                  },
                  backgroundColor: AppColors.orange,
                  isCircle: true,
                )),
                const SizedBox(width: 10),
                Expanded(
                    child: SolidButtonWidget(
                  label: "Book Now",
                  onPressed: () {
                    context.push("/checkout");
                  },
                  backgroundColor: AppColors.teal,
                  isCircle: true,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
