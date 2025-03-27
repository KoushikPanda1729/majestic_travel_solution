import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

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
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(0, AppIcons.homeButton, "Home"),
          _buildNavItem(1, AppIcons.needHelpButton, "Need Help"),
          _buildNavItem(2, AppIcons.callButton, "Call"),
          _buildNavItem(3, AppIcons.trackButton, "Track"),
          _buildNavItem(4, AppIcons.userButton, "Account"),
        ],
      ),
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
          if (isActive)
            Container(
              width: 40,
              height: 3,
              decoration: BoxDecoration(
                color: AppColors.teal,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          const SizedBox(height: 4),
          SvgPicture.asset(
            icon,
            height: 25,
            width: 25,
            colorFilter: isActive
                ? const ColorFilter.mode(AppColors.teal, BlendMode.srcIn)
                : ColorFilter.mode(
                    AppColors.black.withOpacity(0.4), BlendMode.srcIn),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color:
                  isActive ? AppColors.teal : AppColors.black.withOpacity(0.4),
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
