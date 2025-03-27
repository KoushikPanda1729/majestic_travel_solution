// import 'package:flutter/material.dart';
// import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

// class ProfileAvatar extends StatelessWidget {
//   final String imagePath;
//   final double size;
//   final VoidCallback onTap;
//   final bool isEditingIcon;

//   const ProfileAvatar({
//     super.key,
//     required this.imagePath,
//     this.size = 64, // Default size
//     required this.onTap,
//     this.isEditingIcon = true, // Default to true
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         GestureDetector(
//           onTap: onTap,
//           child: Container(
//             width: size,
//             height: size,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(color: AppColors.teal, width: 2),
//             ),
//             child: CircleAvatar(
//               radius: size / 2,
//               backgroundColor: Colors.grey[300],
//               backgroundImage: AssetImage(imagePath),
//             ),
//           ),
//         ),
//         if (isEditingIcon)
//           Positioned(
//             right: 2,
//             bottom: 2,
//             child: Container(
//               padding: const EdgeInsets.all(2),
//               decoration: BoxDecoration(
//                 color: Colors.teal,
//                 shape: BoxShape.circle,
//                 border: Border.all(color: Colors.white, width: 2),
//               ),
//               child: const Icon(
//                 Icons.edit,
//                 size: 16,
//                 color: Colors.white,
//               ),
//             ),
//           ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final double size;
  final VoidCallback onTap;
  final bool isEditingIcon;
  final bool isUploadMode; // New parameter

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.size = 64, // Default size
    required this.onTap,
    this.isEditingIcon = true, // Default to true
    this.isUploadMode = false, // Default to false
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.teal, width: 2),
            ),
            child: CircleAvatar(
              radius: size / 2,
              backgroundColor: Colors.grey[300],
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
        if (isEditingIcon || isUploadMode)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.teal,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(
                isUploadMode
                    ? Icons.camera_alt
                    : Icons.edit, // Show camera icon if isUploadMode is true
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
