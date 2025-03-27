import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class HealthPackageCard extends StatelessWidget {
  final String title;
  final String icon;
  final int numberOfTests;
  final double amount;
  final VoidCallback onBookNow;

  const HealthPackageCard({
    super.key,
    required this.title,
    required this.icon,
    required this.numberOfTests,
    required this.amount,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      width: 171,
      decoration: BoxDecoration(
        color: AppColors.lightTeal.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'Mulish',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Container(
                    width: 27,
                    height: 27,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      borderRadius:
                          BorderRadius.circular(12), // Rounded corners
                    ),
                    padding: const EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      icon,
                      width: 18,
                      height: 18,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "$numberOfTests Tests",
                    style: const TextStyle(
                      fontSize: 9,
                      fontFamily: 'Mulish',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 34),
              GestureDetector(
                onTap: () {
                  // Implement "Know More" functionality
                },
                child: const Text(
                  "Know More",
                  style: TextStyle(
                    color: AppColors.teal,
                    fontSize: 12,
                    height: 1,
                    fontFamily: 'Mulish',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 4.3),
              Text(
                "₹$amount",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Mulish',
                ),
              ),
              const SizedBox(height: 7.5),
            ],
          ),
          SizedBox(
            width: 137,
            height: 32,
            child: SolidButtonWidget(
              label: "Book Now",
              onPressed: onBookNow,
              isCircle: true,
            ),
          )
        ],
      ),
    );
  }
}
