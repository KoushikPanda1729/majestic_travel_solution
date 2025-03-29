import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/home_screen.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/widgets/featured_card.dart';

class DestinationDetailsScreen extends StatelessWidget {
  const DestinationDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F6F0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header image with back button, like button, and planning container
          Stack(
            children: [
              // Hero Image
              Container(
                height: 300,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.silong),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Nav bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NavBar(
                  leadingIcon: FloatingButton(
                    onPressed: () {
                      context.pop();
                    },
                    iconPath: AppIcons.angleRight,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    iconColor: AppColors.white,
                    isDisabled: false,
                    buttonSize: 42,
                    iconSize: 18,
                    isRotated: true,
                    boxShadow: false,
                  ),
                  trailingIcon: FloatingButton(
                    onPressed: () {},
                    iconPath: AppIcons.heart3,
                    backgroundColor: Colors.white.withOpacity(0.3),
                    iconColor: AppColors.white,
                    isDisabled: false,
                    buttonSize: 42,
                    iconSize: 18,
                    boxShadow: false,
                  ),
                ),
              ),

              // Start Planning Container positioned at the bottom of the image
              Positioned(
                bottom: 30,
                left: 16,
                child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SolidButtonWidget(
                          label: "Start Planning", onPressed: () {}),
                      const SizedBox(height: 4),
                      const Text(
                        'Shillong On Your Mind?',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Soak, unplug, and map out your short here.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Show all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    // Category Icons
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildCategoryItem(
                              AppIcons.restaurants, 'Restaurants', () {
                            context.push("/restaurants");
                          }),
                          _buildCategoryItem(AppIcons.plate, 'Cheap Eats', () {
                            context.push("/");
                          }),
                          _buildCategoryItem(AppIcons.cafe, 'Cafes', () {
                            context.push("/");
                          }),
                          _buildCategoryItem(AppIcons.fair, 'Attractions', () {
                            context.push("/");
                          }),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Top Places Shillong',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Show all',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          6,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FeaturedCard(
                              width: 200,
                              height: 250,
                              child: buildTopPlaceCard(),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Travel Guides',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    FeaturedCard(
                      width: double.infinity,
                      height: 300,
                      child: _buildGuideCard(),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Travel Information',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 1,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildBottomNavItem(AppIcons.train, 'Train'),
                          _buildBottomNavItem(AppIcons.intro, 'Get around'),
                          _buildBottomNavItem(AppIcons.brain, 'Understand'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(String icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: SvgPicture.asset(
              icon,
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  Widget _buildGuideCard() {
    return Container(
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
              image: const DecorationImage(
                image: AssetImage(AppImages.silong), // Replace with your image
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
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
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
    );
  }

  Widget buildTopPlaceCard() {
    return Container(
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
              image: const DecorationImage(
                image: AssetImage(AppImages.silong), // Replace with your image
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
                  const Text(
                    "Cox's Bazar Beach",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 4),
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
                      const SizedBox(width: 4),
                      const Text(
                        "Bangladesh",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.amber,
                      ),
                      const SizedBox(width: 2),
                      const Text(
                        "4.9",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(String icon, String label) {
    return Column(
      children: [
        SvgPicture.asset(
          icon,
          width: 30,
          height: 30,
          colorFilter: ColorFilter.mode(
            Colors.grey.shade700,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.grey.shade800,
          ),
        ),
      ],
    );
  }
}
