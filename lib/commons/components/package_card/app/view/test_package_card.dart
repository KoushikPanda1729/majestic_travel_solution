import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TestPackageCard extends StatelessWidget {
  final String title;
  final String parameters;
  final int price;
  final VoidCallback onDetailsPressed;
  final VoidCallback onBookNowPressed;

  const TestPackageCard({
    super.key,
    required this.title,
    required this.parameters,
    required this.price,
    required this.onDetailsPressed,
    required this.onBookNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // Upper section (Title, Parameters, Details)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: const BoxDecoration(
              color: Color(0xFFD1EDEB),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 9),

                // Parameters & Details
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 32,
                          height: 32,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          alignment: Alignment.center,
                          child: SvgPicture.asset(
                            AppIcons.dna,
                            height: 20,
                            width: 20,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          parameters,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF484848),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: onDetailsPressed,
                      child: const Text(
                        "Details",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.teal,
                          fontSize: 14,
                          color: Colors.teal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Lower section (Price & Book Now)
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Price
                Text(
                  "₹$price",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Book Now Button
                SizedBox(
                  height: 22,
                  width: 92,
                  child: OutlineButtonWidget(
                    label: "Book Now",
                    onPressed: () {},
                    labelColor: AppColors.white,
                    borderColor: AppColors.white,
                    isCircle: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
