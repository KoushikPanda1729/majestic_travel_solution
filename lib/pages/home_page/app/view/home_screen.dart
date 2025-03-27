import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/body_parts_grid.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/care_card_section.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/category_scroll.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/health_packages.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/medical_services_flex.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/promo_section.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/sliding_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NavBar(),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 20),
                SlidingBanner(),
                SizedBox(height: 18),
                MedicalServicesFlex(),
                SizedBox(height: 21),
                HealthPackages(),
                SizedBox(height: 21),
                CategoryScroll(),
                SizedBox(height: 21),
                PromoSection(),
                SizedBox(height: 21),
                BodyPartsGrid(),
                SizedBox(height: 21),
                CareCardSection(),
                SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
