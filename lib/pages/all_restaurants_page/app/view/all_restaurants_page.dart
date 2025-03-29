import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/all_restaurants_page/app/view/widget/restaurants_card.dart';

class RestaurantsPage extends StatefulWidget {
  const RestaurantsPage({super.key});

  @override
  State<RestaurantsPage> createState() => _RestaurantsPageState();
}

class _RestaurantsPageState extends State<RestaurantsPage> {
  // Example data for restaurants
  final List<Map<String, dynamic>> restaurants = [
    {
      'imageUrl': AppImages.silong,
      'name': 'City Hut Family Dhaba',
      'location': 'Shillong',
      'description': 'Casual dhaba with palm frond covered roof...',
      'rating': 0.0,
      'showRating': false,
      'isFavorite': false,
    },
    {
      'imageUrl': AppImages.silong,
      'name': 'City Hut Family Dhaba',
      'location': 'Shillong',
      'description': 'Casual dhaba with palm frond covered roof...',
      'rating': 4.9,
      'showRating': true,
      'isFavorite': true,
    },
    {
      'imageUrl': AppImages.silong,
      'name': 'City Hut Family Dhaba',
      'location': 'Shillong',
      'description': 'Casual dhaba with palm frond covered roof...',
      'rating': 0.0,
      'showRating': false,
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
                      "Restaurants in siliong",
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
