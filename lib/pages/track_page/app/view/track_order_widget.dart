import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

// Order Step Model
class OrderStep {
  final String title;
  final String date;
  final bool isCompleted;

  OrderStep({
    required this.title,
    required this.date,
    required this.isCompleted,
  });
}

// List of Order Steps
final List<OrderStep> orderSteps = [
  OrderStep(
      title: "Test Confirmed", date: "Mon, 24th Feb' 25", isCompleted: true),
  OrderStep(
      title: "Sample Collected", date: "Mon, 26th Feb' 25", isCompleted: true),
  OrderStep(
      title: "Sample Sent for Test",
      date: "Mon, 27th Feb' 25",
      isCompleted: true),
  OrderStep(
      title: "Sample Processing",
      date: "Mon, 29th Feb' 25",
      isCompleted: false),
  OrderStep(
      title: "Report Uploaded", date: "Mon, 1st Mar' 25", isCompleted: false),
];

class TrackOrderWidget extends StatelessWidget {
  const TrackOrderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Custom Back Button and Header
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () => context.pop(),
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
          const SizedBox(height: 16),

          // Title
          const Center(
            child: Text(
              "Track Order",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Mulish",
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Order ID
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Order ID: 12345",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              )),

          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: orderSteps.length,
                itemBuilder: (context, index) {
                  final step = orderSteps[index];
                  final isLastStep = index == orderSteps.length - 1;
                  final isNextStepCompleted =
                      !isLastStep && orderSteps[index + 1].isCompleted;

                  return TimelineStepWidget(
                    title: step.title,
                    date: step.date,
                    isCompleted: step.isCompleted,
                    showLine: !isLastStep,
                    isNextStepCompleted: isNextStepCompleted,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimelineStepWidget extends StatelessWidget {
  final String title;
  final String date;
  final bool isCompleted;
  final bool showLine;
  final bool isNextStepCompleted;

  const TimelineStepWidget({
    super.key,
    required this.title,
    required this.date,
    required this.isCompleted,
    required this.showLine,
    required this.isNextStepCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            // Step Circle Indicator
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isCompleted ? AppColors.teal : AppColors.white,
                border: Border.all(color: AppColors.teal, width: 1),
              ),
              child: isCompleted
                  ? const Icon(Icons.check, size: 14, color: AppColors.white)
                  : null,
            ),

            // Vertical Line (solid, dotted, or mixed)
            if (showLine)
              StepLine(
                  isCompleted: isCompleted,
                  isNextStepCompleted: isNextStepCompleted),
          ],
        ),
        const SizedBox(width: 10),

        // Step Details
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              date,
              style: const TextStyle(
                fontSize: 10,
                color: Color(0XFF727272),
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// **StepLine Widget**: Handles solid, dotted, and mixed step lines
class StepLine extends StatelessWidget {
  final bool isCompleted;
  final bool isNextStepCompleted;

  const StepLine(
      {super.key,
      required this.isCompleted,
      required this.isNextStepCompleted});

  @override
  Widget build(BuildContext context) {
    if (isCompleted && isNextStepCompleted) {
      return Container(width: 2, height: 50, color: AppColors.teal);
    } else if (!isCompleted && !isNextStepCompleted) {
      return const DottedVerticalLine(height: 50);
    } else {
      return Column(
        children: [
          Container(width: 2, height: 25, color: AppColors.teal),
          const DottedVerticalLine(height: 25),
        ],
      );
    }
  }
}

/// **Dotted Vertical Line Widget**: Handles rendering of a dotted line
class DottedVerticalLine extends StatelessWidget {
  final double height;

  const DottedVerticalLine({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 2,
      height: height,
      child: DottedBorder(
        color: const Color(0XFFC4C4C4),
        dashPattern: const [6, 4],
        strokeWidth: 1.5,
        padding: EdgeInsets.zero,
        customPath: (size) {
          return Path()
            ..moveTo(size.width / 2, 0)
            ..lineTo(size.width / 2, size.height);
        },
        child: const SizedBox(height: 50, width: 2),
      ),
    );
  }
}
