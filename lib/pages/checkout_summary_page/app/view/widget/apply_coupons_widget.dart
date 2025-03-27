import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:dotted_border/dotted_border.dart';

class ApplyCouponsWidget extends StatelessWidget {
  const ApplyCouponsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white, // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingButton(
                  onPressed: () {
                    context.pop();
                  },
                  iconPath: AppIcons.angleSmallRight,
                  backgroundColor: AppColors.white,
                  iconColor: AppColors.teal,
                  isDisabled: false,
                  buttonSize: 42,
                  iconSize: 18,
                  isRotated: true,
                ),
                const Text(
                  "Apply Coupons",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish",
                  ),
                ),
                const SizedBox(),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Coupon Input Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.lightTeal.withOpacity(0.4)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Enter Coupon Code",
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColors.black.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Apply",
                      style: TextStyle(
                        color: AppColors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 13),
          // Coupon List
          Container(
            height: 400,
            decoration: const BoxDecoration(
              color: Color(0xFFD1EDEB),
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 20,
              horizontal: 16,
            ),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  CouponItem(),
                  CouponItem(),
                  CouponItem(),
                  CouponItem(),
                  CouponItem()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CouponItem extends StatelessWidget {
  const CouponItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Stack(
        children: [
          // Main card with custom shape
          ClipPath(
            clipper: CouponClipper(),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 23),
              decoration: const BoxDecoration(
                color: AppColors.white,
              ),
              child: Column(
                children: [
                  // Coupon Header
                  Row(
                    children: [
                      Image.asset(AppImages.logo, width: 77, height: 28),
                      const SizedBox(
                        width: 26,
                      ),
                      const Expanded(
                        child: Text(
                          "FLAT Rs. 4800 OFF on Full Body Health Checkup",
                          style: TextStyle(
                              fontSize: 12,
                              fontFamily: "Mulish",
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF727272)),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 7),

                  // Expiry Date
                  const Text(
                    "Expires On: 15/04/2025",
                    style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Coupon Code & Apply Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: "Code: ", // "Code:" in gray
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF727272), // Gray color
                              ),
                            ),
                            TextSpan(
                              text: "NEWGOLD12", // Coupon code in black
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black, // Black color
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Apply",
                          style: TextStyle(
                            color: Color(0xFF00B5B0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Horizontal dotted line using dotted_border package
          Positioned(
            left: 12,
            right: 12,
            top: 30,
            bottom: 0,
            child: Center(
              child: DottedBorder(
                customPath: (size) {
                  return Path()
                    ..moveTo(0, 0)
                    ..lineTo(size.width, 0);
                },
                color: Colors.grey.withOpacity(0.5),
                strokeWidth: 1,
                dashPattern: const [5, 3],
                child: const SizedBox(
                  height: 0,
                  width: double.infinity,
                ),
              ),
            ),
          ),

          // Left circular notch
          Positioned(
            left: 0,
            top: 30,
            bottom: 0,
            child: Center(
              child: Container(
                width: 12,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFFD1EDEB),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomRight: Radius.circular(12),
                  ),
                ),
              ),
            ),
          ),

          // Right circular notch
          Positioned(
            right: 0,
            top: 30,
            bottom: 0,
            child: Center(
              child: Container(
                width: 12,
                height: 24,
                decoration: const BoxDecoration(
                  color: Color(0xFFD1EDEB),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
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

// Custom clipper for the coupon shape
class CouponClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Left side with indentation
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.5 - 12);
    path.arcToPoint(
      Offset(0, size.height * 0.5 + 12),
      radius: const Radius.circular(12),
      clockwise: false,
    );
    path.lineTo(0, size.height);

    // Bottom edge
    path.lineTo(size.width, size.height);

    // Right side with indentation
    path.lineTo(size.width, size.height * 0.5 + 12);
    path.arcToPoint(
      Offset(size.width, size.height * 0.5 - 12),
      radius: const Radius.circular(12),
      clockwise: false,
    );
    path.lineTo(size.width, 0);

    // Close the path
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
