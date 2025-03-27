import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TestSummaryCard extends StatelessWidget {
  final String testName;
  final String price;
  final VoidCallback onRemove;

  const TestSummaryCard({
    super.key,
    required this.testName,
    required this.price,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                testName,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontFamily: "Mulish",
                  fontSize: 17,
                ),
              ),
              GestureDetector(
                onTap: onRemove,
                child: SvgPicture.asset(
                  AppIcons.crossSmall,
                  colorFilter: const ColorFilter.mode(
                    AppColors.teal,
                    BlendMode.srcIn,
                  ),
                  width: 25,
                  height: 25,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            price,
            style: const TextStyle(
              color: Colors.teal,
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish",
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
