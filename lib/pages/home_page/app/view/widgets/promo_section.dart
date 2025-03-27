import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class PromoSection extends StatelessWidget {
  const PromoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 155,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Image.asset(
          AppImages.offerBanner,
          fit: BoxFit.fill,
          width: double.infinity,
        ),
      ),
    );
  }
}
