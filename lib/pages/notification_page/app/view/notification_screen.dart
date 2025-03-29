import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Custom NavBar with Back Button
            NavBar(
              leadingIcon: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingButton(
                      onPressed: () => context.pop(),
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.black,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 20,
                      isRotated: true,
                    ),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              trailingIcon: const SizedBox(),
            ),

            // Header

            const SizedBox(height: 8),

            Expanded(
              child: ListView.separated(
                itemCount: 10, // Example notification count
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.black.withOpacity(0.1),
                      child: SvgPicture.asset(
                        AppIcons.bell,
                        colorFilter: const ColorFilter.mode(
                          AppColors.black,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                    title: Text(
                      "New Notification ${index + 1}",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    subtitle: Text(
                      "This is the detail of notification ${index + 1}.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      // Handle notification tap
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
