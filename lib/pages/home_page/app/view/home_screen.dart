import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/featured_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NavBar(
                trailingIcon: ProfileAvatar(
                  imagePath: AppImages.profilePicture,
                  onTap: () {},
                  size: 40,
                ),
              ),
              const SizedBox(height: 5),
              SearchBarWidget(onChanged: (_) {}),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildCategoryTabs(),
                      const SizedBox(height: 10),
                      _buildFeaturedDestination(context),
                      const SizedBox(height: 10),
                      _buildFeaturedGuides(context),
                      const SizedBox(height: 10),
                      _buildPopularDestinations(context),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SolidButtonWidget(
          label: "Popular",
          onPressed: () {},
          backgroundColor: AppColors.white,
          labelColor: AppColors.black,
          isCircle: true,
        ),
        SolidButtonWidget(
          label: "Most Viewed",
          onPressed: () {},
          isCircle: true,
        ),
        SolidButtonWidget(
          label: "Recommended",
          onPressed: () {},
          backgroundColor: AppColors.white,
          labelColor: AppColors.black,
          isCircle: true,
        ),
      ],
    );
  }

  Widget _buildFeaturedDestination(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/destination_details"),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Stack(
          clipBehavior: Clip.none, // Allows elements to overflow if needed
          children: [
            // Background Image with Curved Border
            ClipPath(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  AppImages.silong,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Favorite Icon Positioned on Top Right
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.3),
                ),
                child: SvgPicture.asset(
                  AppIcons.heart3,
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            // Location Name and Arrow Button
            Positioned(
              bottom: 20,
              left: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 6,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () => context.push("/destination_details"),
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Victoria',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.location,
                                height: 12,
                                width: 12,
                                colorFilter: const ColorFilter.mode(
                                  Colors.grey,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 2),
                              const SizedBox(width: 2),
                              const Text(
                                'Seychelles',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.black,
                        child: SvgPicture.asset(
                          AppIcons.arrowRight,
                          height: 12,
                          width: 12,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeaturedGuides(BuildContext context) {
    const List<Map<String, String>> featureGuide = [
      {'name': 'Sydney', 'image': AppImages.silong},
      {'name': 'Paris', 'image': AppImages.destination1},
      {'name': 'Dubai', 'image': AppImages.destination2},
      {'name': ' New York', 'image': AppImages.destination3},
      {'name': 'Rome', 'image': AppImages.destination4},
      {'name': 'Rome', 'image': AppImages.destination5},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Featured Guide Users',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: featureGuide.map((guide) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FeaturedCard(
                  width: 250,
                  height: 300,
                  child: _buildGuideCard(guide["image"] ?? '', context),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildGuideCard(String imageUrl, BuildContext context) {
    return GestureDetector(
      onTap: () => context.push("/in_progress"),
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
                width: 180, // Adjust based on your design
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    const Text(
                      "Malaga, Spain",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    const SizedBox(height: 4),

                    // Description
                    const Text(
                      "Our visit to Malaga was part of a cruise of the Western Med...",
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),

                    // User info (Avatar + Name + Views)
                    Row(
                      children: [
                        ProfileAvatar(
                          imagePath: AppImages.profilePicture,
                          size: 24,
                          onTap: () {},
                          borderColor: Colors.black.withOpacity(0.2),
                        ),
                        const SizedBox(width: 6),

                        // Name & Views
                        const Expanded(
                          child: Text(
                            "Allan Watt",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                            overflow: TextOverflow.ellipsis,
                            // maxLines: 2,
                          ),
                        ),
                        const SizedBox(width: 4),

                        // Views
                        const Icon(Icons.visibility,
                            size: 14, color: Colors.grey),
                        const SizedBox(width: 2),
                        const Text(
                          "5.3K views",
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
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

  Widget _buildPopularDestinations(BuildContext context) {
    const List<Map<String, String>> popularDestinations = [
      {'name': 'Sydney', 'image': AppImages.location1},
      {'name': 'Paris', 'image': AppImages.location2},
      {'name': 'Dubai', 'image': AppImages.location3},
      {'name': ' New York', 'image': AppImages.location4},
      {'name': 'Rome', 'image': AppImages.location5},
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Popular Destinations',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () => context.push("/tourist_spot"),
              child: const Text(
                'Show all',
                style: TextStyle(
                  color: AppColors.black,
                ),
              ),
            ),
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: popularDestinations.map((destination) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: ProfileAvatar(
                  imagePath: destination['image']!,
                  onTap: () {
                    context.push("/destination_details");
                  },
                  borderColor: Colors.blue.shade100,
                  label: destination['name']!,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
