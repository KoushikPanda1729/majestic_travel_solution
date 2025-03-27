import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TestResultCard extends StatelessWidget {
  final String status;
  final String date;
  final String title;

  const TestResultCard({
    super.key,
    required this.status,
    required this.date,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD1EDEB)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 70,
                height: 25,
                child: SolidButtonWidget(
                  label: status,
                  onPressed: () {},
                ),
              ),

              // Date
              Text(
                date,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Test Title
          Text(
            title,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),

          const SizedBox(height: 16),

          // Action Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 114,
                height: 29,
                child: OutlineButtonWidget(
                  label: "View Details",
                  onPressed: () {},
                  borderColor: AppColors.teal,
                  labelColor: AppColors.teal,
                  isCircle: true,
                ),
              ),

              // Download Icon
              Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: SvgPicture.asset(
                    AppIcons.download,
                    colorFilter: const ColorFilter.mode(
                      AppColors.teal,
                      BlendMode.srcIn,
                    ),
                    width: 17,
                    height: 17,
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
