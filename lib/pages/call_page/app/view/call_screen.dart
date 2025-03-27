import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({super.key});

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
          const SizedBox(height: 24),

          // Support Title
          const Center(
            child: Text(
              "Need Help?",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Support Description
          Center(
            child: Text(
              "Our support team is available 24/7 to assist you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          ),
          const SizedBox(height: 40),

          // Support Agent Profile
          Center(
            child: Column(
              children: [
                ProfileAvatar(
                  imagePath: AppImages.profilePicture,
                  onTap: () {},
                  isEditingIcon: false,
                  size: 80,
                ),
                const SizedBox(height: 12),
                const Text(
                  "Dr. Reddy",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Customer Support",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),

          // Call and Chat Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SolidButtonWidget(
                  label: "Call Support",
                  onPressed: () {},
                  isLeadingIcon: true,
                  iconPath: AppIcons.call,
                  isCircle: true,
                ),
                const SizedBox(height: 16),
                OutlineButtonWidget(
                  label: "Chat with Support",
                  onPressed: () {},
                  isLeadingIcon: true,
                  iconPath: AppIcons.chat,
                  labelColor: AppColors.teal,
                  borderColor: AppColors.teal,
                  isCircle: true,
                ),
              ],
            ),
          ),
          const Spacer(),

          // Help Center Link
          Center(
            child: TextButton(
              onPressed: () {
                // Navigate to Help Center
              },
              child: const Text(
                "Visit Help Center",
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.teal,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColors.teal,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
