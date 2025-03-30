import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class TouristSpot extends StatelessWidget {
  const TouristSpot({super.key});

  final List<Map<String, dynamic>> touristSpots = const [
    {
      "name": "Victoria, Tourist Spot",
      "location": "Victoria, Seychelles",
      "rating": 4.5,
      "openHours": "Open 3 hours",
      "timeRange": "02:30 PM to 06:30 PM",
      "images": [
        AppImages.location1,
        AppImages.location2,
        AppImages.location3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
    {
      "name": "Cherrapunji, Tourist Spot",
      "location": "Cherrapunji, Seychelles",
      "rating": 4.8,
      "openHours": "Open 5 hours",
      "timeRange": "10:00 AM to 03:00 PM",
      "images": [
        AppImages.destination1,
        AppImages.destination2,
        AppImages.destination3,
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            NavBar(
              leadingIcon: FloatingButton(
                onPressed: () {
                  context.pop();
                },
                iconPath: AppIcons.angleSmallRight,
                backgroundColor: AppColors.black,
                iconColor: AppColors.white,
                isDisabled: false,
                buttonSize: 42,
                iconSize: 20,
                isRotated: true,
              ),
              trailingIcon: const SizedBox(),
            ),
            SearchBarWidget(onChanged: (_) {}),
            Expanded(
              child: ListView.builder(
                itemCount: touristSpots.length,
                itemBuilder: (context, index) {
                  final spot = touristSpots[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 25.0),
                    child: TouristSpotCard(
                      onTap: () => context.push("/tourist_spot_details"),
                      name: spot["name"],
                      location: spot["location"],
                      rating: spot["rating"],
                      openHours: spot["openHours"],
                      timeRange: spot["timeRange"],
                      images: List<String>.from(spot["images"]),
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

class TouristSpotCard extends StatelessWidget {
  final String name;
  final String location;
  final double rating;
  final String openHours;
  final String timeRange;
  final List<String> images;
  final VoidCallback onTap;

  const TouristSpotCard(
      {super.key,
      required this.name,
      required this.location,
      required this.rating,
      required this.openHours,
      required this.timeRange,
      required this.images,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              children: images.map((img) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, top: 2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        img,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: 8),
          Text(name,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const SizedBox(height: 4),
          Text(location,
              style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 4),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating.floor() ? Icons.star : Icons.star_border,
                color: Colors.amber,
                size: 16,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(openHours,
                    style: TextStyle(
                        color: Colors.red.shade700,
                        fontSize: 12,
                        fontWeight: FontWeight.w500)),
              ),
              const SizedBox(width: 8),
              Text(timeRange,
                  style: const TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ],
      ),
    );
  }
}
