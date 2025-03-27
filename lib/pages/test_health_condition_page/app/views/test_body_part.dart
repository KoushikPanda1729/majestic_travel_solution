import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/category_chips/app/view/category_chips.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:majestic_travel_solution/commons/components/package_card/app/view/test_package_card.dart';

class TestBodyPart extends StatelessWidget {
  const TestBodyPart({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> testPackages = [
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Liver Panel 1: LFT',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
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
                  hintText: "Search by Health Condition",
                  onChanged: (value) {},
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            width: double.infinity,
            child: CategoryChips(
              categories: const [
                "Liver",
                "Kidney",
                "Lungs",
                "Thyroid",
                "Bladder",
                "Heart",
                "Diabetes",
                "Cancer",
                "Blood",
              ],
              onSelected: (selectedCategory) {},
            ),
          ),
          const SizedBox(height: 31),
          Expanded(
            child: Column(
              children: [
                const Text(
                  "Liver Tests/ Packages",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 15),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      padding:
                          EdgeInsets.zero, // Remove default ListView padding
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
          )
        ],
      ),
    );
  }
}
