import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/book_test_page/app/views/widgets/book_test_filter.dart';
import 'package:majestic_travel_solution/pages/book_test_page/app/views/widgets/filter_switch_widget.dart';
import 'package:majestic_travel_solution/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:majestic_travel_solution/commons/components/package_card/app/view/test_package_card.dart';

class BookTest extends StatelessWidget {
  const BookTest({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> testPackages = [
      {
        'title': 'Complete Blood Test',
        'parameters': '60 Parameters',
        'price': 3999
      },
      {
        'title': 'Diabetes Screening',
        'parameters': '20 Parameters',
        'price': 1999
      },
      {
        'title': 'Liver Function Test',
        'parameters': '15 Parameters',
        'price': 2499
      },
      {
        'title': 'Kidney Function Test',
        'parameters': '12 Parameters',
        'price': 1799
      },
      {
        'title': 'Thyroid Profile',
        'parameters': '10 Parameters',
        'price': 1299
      },
      {
        'title': 'Heart Health Package',
        'parameters': '25 Parameters',
        'price': 3499
      },
      {
        'title': 'Vitamin Deficiency Test',
        'parameters': '8 Parameters',
        'price': 999
      },
      {
        'title': 'Comprehensive Health Checkup',
        'parameters': '75 Parameters',
        'price': 4999
      },
      {
        'title': 'Allergy Screening',
        'parameters': '30 Parameters',
        'price': 2799
      },
      {'title': 'Bone Health Test', 'parameters': '5 Parameters', 'price': 899},
    ];

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
          const SizedBox(height: 17),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchBarWidget(
                  onChanged: (value) {},
                ),
                const SizedBox(height: 17),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    PillTagChip(
                      label: "Complete Blood Count",
                      onRemove: () {
                        // Handle remove action
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                FilterSwitchWidget(
                  isSwitched: true,
                  onToggle: (value) {},
                  onFilterPressed: () {
                    openCustomBottomSheet(
                      context: context,
                      child: BookTestFilter(
                        categories: const [
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "leukemia",
                          "leukemia",
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "ABO Incompatibility",
                          "Acid Base Imbalance",
                          "leukemia",
                        ],
                        onApply: (selected) {},
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            // This is the key change
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: testPackages.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: TestPackageCard(
                    title: testPackages[index]['title'],
                    parameters: testPackages[index]['parameters'],
                    price: testPackages[index]['price'],
                    onDetailsPressed: () {},
                    onBookNowPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PillTagChip extends StatelessWidget {
  final String label;
  final VoidCallback onRemove;

  const PillTagChip({
    super.key,
    required this.label,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD7F1F0), // Light teal background
        borderRadius: BorderRadius.circular(20), // Rounded border
        border: Border.all(color: const Color(0xFF00A9A7)), // Teal border
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
              color: Colors.black, // Black text color
            ),
          ),
          const SizedBox(width: 8), // Space between text and icon
          GestureDetector(
            onTap: onRemove,
            child: const Icon(
              Icons.close,
              size: 18,
              color: Color(0xFF00A9A7), // Teal close icon
            ),
          ),
        ],
      ),
    );
  }
}
