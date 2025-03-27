import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class MemberTile extends StatelessWidget {
  final String name;
  final String gender;
  final String age;
  final bool isSelected;
  final VoidCallback onTap;

  const MemberTile({
    super.key,
    required this.name,
    required this.gender,
    required this.age,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(
              color: isSelected ? AppColors.teal : AppColors.lightTeal,
              width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? Colors.teal.withOpacity(0.1) : Colors.white,
        ),
        child: Row(
          children: [
            ProfileAvatar(
              imagePath: AppImages.profilePicture,
              onTap: () {},
              size: 40,
              isEditingIcon: false,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                      fontFamily: "Mulish",
                      color: Colors.black87,
                    ),
                  ),
                  Text(
                    "$gender, $age Yrs.",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(
                Icons.check_circle,
                color: Colors.teal,
              ),
          ],
        ),
      ),
    );
  }
}
