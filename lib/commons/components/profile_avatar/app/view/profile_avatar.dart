import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imagePath;
  final String label;
  final double size;
  final VoidCallback onTap;
  final bool isEditingIcon;
  final bool isUploadMode;
  final Color? borderColor;

  const ProfileAvatar({
    super.key,
    required this.imagePath,
    this.size = 64,
    required this.onTap,
    this.isEditingIcon = false,
    this.isUploadMode = false,
    this.borderColor,
    this.label = "",
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: borderColor ?? Colors.transparent,
                    width: 3,
                  ),
                ),
                child: Container(
                  margin: const EdgeInsets.all(0.1),
                  child: CircleAvatar(
                    radius: size / 2,
                    backgroundColor: Colors.grey[300],
                    backgroundImage: AssetImage(imagePath),
                  ),
                ),
              ),
              if (label != '')
                SizedBox(
                  width: 50,
                  child: Text(
                    label,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                )
            ],
          ),
        ),
        if (isEditingIcon || isUploadMode)
          Positioned(
            right: 2,
            bottom: 2,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
              child: Icon(
                isUploadMode ? Icons.camera_alt : Icons.edit,
                size: 16,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}
