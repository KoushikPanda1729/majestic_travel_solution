import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/components/package_card/app/view/health_package_card.dart';

class HealthPackages extends StatelessWidget {
  const HealthPackages({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> healthPackages = [
      {
        "title": "Complete Blood Test Package",
        "icon": AppIcons.dna,
        "numberOfTests": 30,
        "amount": 3999.0,
      },
      {
        "title": "Complete Blood Test Package",
        "icon": AppIcons.dna,
        "numberOfTests": 40,
        "amount": 4999.0,
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Popular ",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontFamily: 'Mulish',
                      ),
                    ),
                    TextSpan(
                      text: "Health Packages",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.teal,
                        fontFamily: 'Mulish',
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () => context.push("/popular-health-package"),
                child: const Text(
                  "See All",
                  style: TextStyle(
                    color: AppColors.teal,
                    fontFamily: 'Mulish',
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 15),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: healthPackages.map((package) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 17), // Add gap of 17px between cards
                  child: HealthPackageCard(
                    title: package["title"],
                    icon: package["icon"],
                    numberOfTests: package["numberOfTests"],
                    amount: package["amount"],
                    onBookNow: () => context.push("/booking_details"),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
