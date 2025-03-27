import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/package_card/app/view/test_package_card.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class ScoreListPage extends StatefulWidget {
  const ScoreListPage({super.key});

  @override
  State<ScoreListPage> createState() => _ScoreListPageState();
}

class _ScoreListPageState extends State<ScoreListPage> {
  int selectedTab = 0;
  final List<String> tabs = ["High (2)", "Medium (5)", "Low (4)"];
  final List<Map<String, dynamic>> risks = [
    {"title": "Iron Deficiency", "level": 0},
    {"title": "Vitamin B12 Deficiency", "level": 0},
    {"title": "Cholesterol", "level": 1},
    {"title": "Diabetes Risk", "level": 1},
    {"title": "Blood Pressure", "level": 1},
    {"title": "Heart Disease", "level": 2},
    {"title": "Thyroid Issues", "level": 2},
  ];

  final List<String> includedTests = [
    "Blood Sugar",
    "Vitamin D",
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> testPackages = [
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
      {
        'title': 'Complete Blood Count (CBC)',
        'parameters': '60 Parameter(s) Covered',
        'price': 3999
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          // Health Score Section
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFD1EDEB),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                const Text(
                                  "Your Health Score",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: "Mulish",
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    const SizedBox(
                                      width: 180,
                                      height: 180,
                                    ),
                                    CircularPercentIndicator(
                                      radius: 90.0,
                                      lineWidth: 15.0,
                                      percent: 0.5,
                                      center: const Text(
                                        "50%",
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      linearGradient: LinearGradient(
                                        colors: [
                                          Colors.red.withOpacity(0.7),
                                          Colors.teal,
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomLeft,
                                      ),
                                      backgroundColor: AppColors.white,
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Last Checked : 25-03-2025",
                                  style: TextStyle(
                                    color: Color(0xFF3C3C3C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  width: 120,
                                  height: 37,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.teal,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    ),
                                    child: const Text(
                                      "Recheck",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 26),

                          // Probable Risks Section
                          const Text(
                            "Your Probable Risks",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 17),

                          CartographySection(tests: includedTests, tabs: tabs),

                          const SizedBox(height: 35),
                          const Text(
                            "Suggested Tests Based on Your Health Score",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Mulish",
                              color: AppColors.black,
                            ),
                          ),
                          const SizedBox(
                            height: 17,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Test Package List as SliverList
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) => Padding(
                          padding: const EdgeInsets.only(bottom: 14),
                          child: TestPackageCard(
                            title: testPackages[index]['title'],
                            parameters: testPackages[index]['parameters'],
                            price: testPackages[index]['price'],
                            onDetailsPressed: () {},
                            onBookNowPressed: () {},
                          ),
                        ),
                        childCount: testPackages.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// The CartographySection remains the same as in the previous code
class CartographySection extends StatelessWidget {
  final List<String> tests;
  final List<String> tabs;

  const CartographySection(
      {super.key, required this.tests, required this.tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFD1EDEB),
        ),
      ),
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 31,
                width: 85,
                child: SolidButtonWidget(
                  label: "High (2)",
                  onPressed: () {},
                ),
              ),
              OutlineButtonWidget(
                label: "Medium (5)",
                onPressed: () {},
                borderColor: Colors.transparent,
                labelColor: Colors.teal,
              ),
              OutlineButtonWidget(
                label: "Low (4)",
                onPressed: () {},
                borderColor: Colors.transparent,
                labelColor: Colors.teal,
              ),
            ],
          ),

          const SizedBox(height: 33),

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
                    trailing: SvgPicture.asset(
                      AppIcons.angleSmallDown,
                      colorFilter: const ColorFilter.mode(
                        AppColors.teal,
                        BlendMode.srcIn,
                      ),
                      width: 15,
                      height: 15,
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
