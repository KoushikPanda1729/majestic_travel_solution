import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/featured_card.dart';

class MyTrip extends StatefulWidget {
  const MyTrip({super.key});

  @override
  State<MyTrip> createState() => _MyTripState();
}

class _MyTripState extends State<MyTrip> {
  final List<Map<String, dynamic>> trips = [
    {
      "imageUrl": AppImages.destination1,
      "tripName": "New Year Trip",
      "location": "Victoria, Seychelles",
      "price": "1450",
      "daysRemaining": 3,
      "people": 4,
    },
  ];

  final List<Map<String, dynamic>> recentTrips = [
    {
      "location": "London Trip",
      "imageUrl": AppImages.destination1,
      "duration": "1 months ago"
    },
    {
      "location": "Victoria Trip",
      "imageUrl": AppImages.destination2,
      "duration": "2 months ago"
    },
    {
      "location": "Seychelles Trip",
      "imageUrl": AppImages.destination3,
      "duration": "3 months ago"
    },
    {
      "location": "Dubai Trip",
      "imageUrl": AppImages.destination4,
      "duration": "4 months ago"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
                      "My Trip ",
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
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Ongoing Trip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Column(
                      children: trips.map<Widget>((trip) {
                        return FeaturedCard(
                          width: double.infinity,
                          child: buildTripCard(
                            imageUrl: trip["imageUrl"],
                            tripName: trip["tripName"],
                            location: trip["location"],
                            price: trip["price"],
                            daysRemaining: trip["daysRemaining"],
                            people: trip["people"],
                            onUpdateTap: () {},
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      "Recent Trip",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var recentTrip in recentTrips)
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: FeaturedCard(
                                width: 200,
                                height: 250,
                                child: buildTopPlaceCard(
                                  recentTrip["imageUrl"],
                                  recentTrip["location"],
                                  recentTrip["duration"],
                                  () => context.push("/place_details"),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: SolidButtonWidget(
                label: "Add new Trip",
                onPressed: () {
                  context.push("/add_trip");
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTripCard({
    required String imageUrl,
    required String tripName,
    required String location,
    required String price,
    required int daysRemaining,
    required int people,
    required VoidCallback onUpdateTap,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with price tag
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              imageUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Trip details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.attach_money,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 2),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                // Trip name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      tripName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$daysRemaining more days',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),

                // Location and days remaining
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.location,
                          colorFilter: ColorFilter.mode(
                            Colors.grey[600]!,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          location,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      '$people People',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                SolidButtonWidget(
                  label: 'Add Update',
                  isEnabled: false,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTopPlaceCard(
      String imageUrl, String location, String duration, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            // Background Image
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imageUrl), // Replace with your image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Floating Details
            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      location,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      duration,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
