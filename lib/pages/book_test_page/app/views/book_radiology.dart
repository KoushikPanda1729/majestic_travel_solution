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

class BookRadiology extends StatelessWidget {
  const BookRadiology({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> testPackages = [
      {
        'title': 'Electrocardiogram (ECG)',
        'parameters': 'Reports in 24 - 48 Hrs',
        'price': 3999
      },
      {
        'title': 'Ultrasound Whole Abdomen',
        'parameters': 'Reports in 24 - 48 Hrs',
        'price': 3999
      },
      {
        'title': 'Tread Mill Test (TMT)',
        'parameters': 'Reports in 24 - 48 Hrs',
        'price': 3999
      },
      {
        'title': 'Ultrasound Abdomen Pelvis',
        'parameters': 'Reports in 24 - 48 Hrs',
        'price': 3999
      }
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
              children: [
                SearchBarWidget(
                  onChanged: (value) {},
                ),
                const SizedBox(height: 8),
                FilterSwitchWidget(
                  isSwitched: true,
                  onToggle: (value) {},
                  onFilterPressed: () {
                    openCustomBottomSheet(
                      context: context,
                      child: BookTestFilter(
                        categories: const [
                          "BMD",
                          "Cardiology",
                          "CT Scan",
                          "ENT",
                          "Neurology",
                          "Pulmonology",
                          "Ultrasound",
                          "X-Ray"
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
