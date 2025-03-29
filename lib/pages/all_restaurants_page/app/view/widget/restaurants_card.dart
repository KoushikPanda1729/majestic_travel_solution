import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class RestaurantCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final String description;
  final double rating;
  final VoidCallback? onTap;
  final VoidCallback onFavoritePressed;
  final bool isFavorite;

  const RestaurantCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.location,
      required this.description,
      this.rating = 0.0,
      required this.onFavoritePressed,
      this.isFavorite = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 6.0,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with rating and favorite button
            Stack(children: [
              // Restaurant image
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  imageUrl,
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Rating
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Favorite button
              Positioned(
                right: 8,
                top: 8,
                child: FloatingButton(
                  onPressed: onFavoritePressed ?? () {},
                  iconPath: isFavorite ? AppIcons.heartFill : AppIcons.heart3,
                  backgroundColor: Colors.white.withOpacity(0.3),
                  iconColor: isFavorite ? Colors.red : Colors.white,
                  isDisabled: false,
                  buttonSize: 42,
                  iconSize: 18,
                  boxShadow: false,
                ),
              )
            ]),

            // Restaurant details
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Restaurant name
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Location
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.location_on,
                          color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        location,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),

                  // Description
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
