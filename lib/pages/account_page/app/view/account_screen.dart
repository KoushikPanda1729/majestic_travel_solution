import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/open_custom_buttomsheet/open_custom_buttomsheet.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menuItems = [
      {
        "title": "Bookings",
        "subtitle": "Check Your Booking Status",
        "onTap": () => context.push("/bookings"),
      },
      {
        "title": "Track",
        "subtitle": "Check Your Report Status",
        "onTap": () => context.push("/track"),
      },
      {
        "title": "Settings",
        "subtitle": "Manage Your Preferences",
        "onTap": () => context.push("/settings"),
      },
      {
        "title": "Help",
        "subtitle": "Get Support and FAQs",
        "onTap": () => context.push("/help"),
      },
      {
        "title": "Logout",
        "subtitle": "Sign Out from Your Account",
        "onTap": () {
          openCustomBottomSheet(
            context: context,
            child: const LogOutWidget(),
          );
        },
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Francesco',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'Francesco@gmail.com',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ProfileAvatar(
                      imagePath: AppImages.profilePicture,
                      onTap: () {
                        context.push("/add_family_member_and_edit_profile",
                            extra: true);
                      },
                      isEditingIcon: true,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Column(
                  children: menuItems
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: BorderedMenuListItem(
                            title: item["title"]!,
                            subtitle: item["subtitle"]!,
                            iconColor: Colors.black,
                            onTap: item["onTap"],
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BorderedMenuListItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color iconColor;
  final VoidCallback onTap;

  const BorderedMenuListItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.black.withOpacity(0.4),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: iconColor,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.black54,
          ),
        ),
        trailing: SvgPicture.asset(
          AppIcons.angleRight,
          colorFilter: const ColorFilter.mode(
            AppColors.black,
            BlendMode.srcIn,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Are you sure you want to logout?",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: SolidButtonWidget(
                  label: "Cancel",
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: SolidButtonWidget(
                  label: "Logout",
                  onPressed: () => context.go('/login'),
                  backgroundColor: AppColors.orange,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
