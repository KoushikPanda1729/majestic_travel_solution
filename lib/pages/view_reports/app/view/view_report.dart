import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/view_reports/app/view/widget/test_result_card.dart';

class ViewReport extends StatelessWidget {
  const ViewReport({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> testResults = [
      {
        "status": "Recent",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
      {
        "status": "Previous",
        "date": "19-03-2025",
        "title": "Complete Blood Count (CBC)"
      },
    ];

    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          // Custom Back Button
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
          const SizedBox(height: 17),
          // List of Test Results
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: testResults.length,
              itemBuilder: (context, index) {
                return TestResultCard(
                  status: testResults[index]['status'],
                  date: testResults[index]['date'],
                  title: testResults[index]['title'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
