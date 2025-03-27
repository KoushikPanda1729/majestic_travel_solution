import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class TestFeatureCard extends StatelessWidget {
  final List<String> features;
  final String price;
  final VoidCallback onAddToCart;
  final VoidCallback onBookNow;

  const TestFeatureCard({
    super.key,
    required this.features,
    required this.price,
    required this.onAddToCart,
    required this.onBookNow,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFD1EDEB),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 216, 215, 215),
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Features section
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      (features.length / 2).ceil(),
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              width: 15,
                              height: 15,
                              AppIcons.check,
                              colorFilter: const ColorFilter.mode(
                                AppColors.teal,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                features[index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muilsh",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20), // Space between columns
                // Right Column
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: List.generate(
                      (features.length / 2).floor(),
                      (index) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              width: 15,
                              height: 15,
                              AppIcons.check,
                              colorFilter: const ColorFilter.mode(
                                AppColors.teal,
                                BlendMode.srcIn,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                features[(features.length / 2).ceil() + index],
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Muilsh",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Price and Buttons section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontFamily: "Mulish",
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 28,
                      width: 98,
                      child: OutlineButtonWidget(
                        label: "Add to Cart",
                        onPressed: onAddToCart,
                        isCircle: true,
                        borderColor: AppColors.white,
                        labelColor: AppColors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 28,
                      width: 98,
                      child: SolidButtonWidget(
                        label: "Add to Cart",
                        onPressed: onBookNow,
                        isCircle: true,
                        backgroundColor: AppColors.orange,
                        labelColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
