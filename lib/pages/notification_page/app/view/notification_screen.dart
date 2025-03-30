import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List<Map<String, String>> notifications = const [
    {
      "title": "Booking Confirmed",
      "description": "Your trip to Maldives has been confirmed. Get ready!"
    },
    {
      "title": "New Destination Added",
      "description": "Explore the hidden gems of Bali with our latest package."
    },
    {
      "title": "Discount Alert!",
      "description":
          "Limited-time 20% discount on your next trip to Seychelles."
    },
    {
      "title": "Flight Schedule Update",
      "description":
          "Your flight to Paris has been rescheduled. Check your email."
    },
    {
      "title": "Travel Safety Tips",
      "description":
          "Learn how to stay safe while traveling in new destinations."
    },
    {
      "title": "Loyalty Rewards Earned",
      "description":
          "You've earned 500 travel points! Redeem them on your next trip."
    },
    {
      "title": "Exclusive Beach Resort Offer",
      "description":
          "Stay at the luxurious Bora Bora resort with a 3-night free stay."
    },
    {
      "title": "New Adventure Package",
      "description":
          "Experience thrilling activities in the Swiss Alps this season."
    },
    {
      "title": "Upcoming Trip Reminder",
      "description":
          "Your trip to Santorini is in 3 days. Time to pack your bags!"
    },
    {
      "title": "Customer Support Assistance",
      "description":
          "We are here to help! Contact us for any travel-related queries."
    }
  ];

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

            const SizedBox(height: 8),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: ListView.separated(
                  itemCount: notifications.length,
                  separatorBuilder: (context, index) =>
                      Divider(color: Colors.grey.withOpacity(0.3)),
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
                        notifications[index]["title"]!,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        notifications[index]["description"]!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        // Handle notification tap
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
