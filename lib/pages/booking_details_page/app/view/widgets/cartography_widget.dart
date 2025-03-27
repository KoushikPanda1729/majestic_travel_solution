import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class CartographySection extends StatelessWidget {
  final List<String> tests;

  const CartographySection({super.key, required this.tests});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.teal.withOpacity(0.4)),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                      text: "Test(s) ",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Mulish"),
                    ),
                    TextSpan(
                      text: "Included",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontFamily: "Mulish",
                      ), // Teal color
                    ),
                  ],
                ),
              ),
              Text(
                "(${tests.length})",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.teal, // Teal color
                  fontFamily: "Mulish",
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // List of Tests
          Column(
            children: tests.map((test) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      test,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Mulish",
                      ),
                    ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.teal,
                    ),
                    contentPadding: EdgeInsets.zero,
                  ),
                  if (test != tests.last)
                    const Divider(
                      height: 1,
                      color: AppColors.unselect,
                    ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
