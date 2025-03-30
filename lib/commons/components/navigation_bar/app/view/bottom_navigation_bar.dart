import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/place_details_page/app/view/place_details.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int activeIndex;
  final Function(int)? onItemTapped;

  const BottomNavigationBarWidget({
    super.key,
    this.activeIndex = 0,
    this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildNavItem(0, AppIcons.homeButton, "Home"),
              _buildNavItem(1, AppIcons.heart3, "Saved"),
              const SizedBox(width: 50), // Space for floating button
              _buildNavItem(2, AppIcons.bell, "Notifications"),
              _buildNavItem(3, AppIcons.userButton, "Profile"),
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.of(context).padding.bottom + 10,
          child: FloatingButton(
            onPressed: () {
              GoRouter.of(context).push("/add_trip");
            },
            iconPath: AppIcons.add,
            backgroundColor: AppColors.black,
            iconColor: AppColors.white,
            isDisabled: false,
            buttonSize: 50,
            iconSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    final bool isActive = index == activeIndex;

    return GestureDetector(
      onTap: () {
        if (onItemTapped != null) {
          onItemTapped!(index);
        }
      },
      child: Column(
        children: [
          const SizedBox(height: 4),
          SvgPicture.asset(
            icon,
            height: 25,
            width: 25,
            colorFilter: isActive
                ? const ColorFilter.mode(AppColors.black, BlendMode.srcIn)
                : ColorFilter.mode(
                    AppColors.black.withOpacity(0.4), BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color:
                  isActive ? AppColors.black : AppColors.black.withOpacity(0.4),
              fontSize: 10,
              height: 1,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
