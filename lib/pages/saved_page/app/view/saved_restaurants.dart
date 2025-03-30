import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/all_restaurants_page/app/view/widget/restaurants_card.dart';

class SavedRestaurants extends StatefulWidget {
  const SavedRestaurants({super.key});

  @override
  State<SavedRestaurants> createState() => _SavedRestaurantsState();
}

class _SavedRestaurantsState extends State<SavedRestaurants> {
  // Example data for restaurants
  final List<Map<String, dynamic>> restaurants = [
    {
      'imageUrl': AppImages.restaurant1,
      'name': 'The Spice Garden',
      'location': 'Mumbai',
      'description':
          'A vibrant restaurant known for its rich Indian spices and flavors.',
      'rating': 4.5,
      'showRating': true,
      'isFavorite': true,
    },
    {
      'imageUrl': AppImages.restaurant2,
      'name': 'Seaside Bites',
      'location': 'Goa',
      'description':
          'A beachside eatery offering fresh seafood and stunning ocean views.',
      'rating': 4.9,
      'showRating': true,
      'isFavorite': true,
    },
    {
      'imageUrl': AppImages.restaurant3,
      'name': 'Mountain Treats',
      'location': 'Manali',
      'description':
          'A cozy spot in the hills serving delicious local Himachali cuisine.',
      'rating': 4.2,
      'showRating': true,
      'isFavorite': true,
    },
    {
      'imageUrl': AppImages.restaurant4,
      'name': 'Heritage Haveli',
      'location': 'Jaipur',
      'description':
          'A traditional Rajasthani restaurant with royal decor and authentic flavors.',
      'rating': 4.7,
      'showRating': true,
      'isFavorite': true,
    },
    {
      'imageUrl': AppImages.restaurant5,
      'name': 'Urban Bites',
      'location': 'Bangalore',
      'description':
          'A modern eatery offering a mix of continental and Indian fusion dishes.',
      'rating': 4.3,
      'showRating': true,
      'isFavorite': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Your existing NavBar
            NavBar(
              leadingIcon: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingButton(
                      onPressed: () {
                        context.pop();
                      },
                      iconPath: AppIcons.angleRight,
                      isRotated: true,
                      backgroundColor: Colors.black.withOpacity(0.1),
                      iconColor: Colors.black,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 18,
                      boxShadow: false,
                    ),
                    const Text(
                      "Saved Restaurants ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
              trailingIcon: const SizedBox(),
            ),

            // Title for the restaurants page

            // Expanded is needed to make ListView work inside Column
            Expanded(
              child: ListView.builder(
                itemCount: restaurants.length,
                itemBuilder: (context, index) {
                  final restaurant = restaurants[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: RestaurantCard(
                      onTap: () => context.push("/restaurants_details"),
                      imageUrl: restaurant['imageUrl'],
                      name: restaurant['name'],
                      location: restaurant['location'],
                      description: restaurant['description'],
                      rating: restaurant['rating'],
                      isFavorite: restaurant['isFavorite'],
                      onFavoritePressed: () {
                        setState(() {
                          // Toggle favorite status
                          restaurant['isFavorite'] = !restaurant['isFavorite'];
                        });
                      },
                    ),
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
