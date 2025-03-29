import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/all_restaurants_page/app/view/widget/restaurants_card.dart';

class RestaurantsDetailsPage extends StatelessWidget {
  const RestaurantsDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenHeight = mediaQuery.size.height;
    final screenWidth = mediaQuery.size.width;
    final padding = mediaQuery.padding;

    final safeHeight = screenHeight - padding.top - padding.bottom;
    final isTablet = screenWidth > 600;

    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return IntrinsicHeight(
            child: Column(
              children: [
                Container(
                  height: safeHeight * 0.35,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: Image.asset(
                          AppImages.silong,
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      Positioned.fill(
                        child: Container(
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Transform.translate(
                    offset: const Offset(0, -35),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isTablet ? 32.0 : 16.0,
                          vertical: 24.0,
                        ),
                        child: const RestaurantDetailsContainer(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// Restaurant Details Container with Tabs
class RestaurantDetailsContainer extends StatefulWidget {
  const RestaurantDetailsContainer({super.key});

  @override
  State<RestaurantDetailsContainer> createState() =>
      _RestaurantDetailsContainerState();
}

class _RestaurantDetailsContainerState
    extends State<RestaurantDetailsContainer> {
  String _activeTab = "Overview"; // Default tab is Overview

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Restaurant Name
          const Text(
            "City Hut Family Dhaba",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          // Location
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                "Shillong, India",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),

          // Tabs
          Row(
            children: [
              _buildTab("Overview"),
              _buildTab("Details"),
              _buildTab("Review"),
              _buildTab("Location"),
            ],
          ),

          const Divider(height: 1),

          // Display content based on active tab
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: _buildTabContent(),
          ),
        ],
      ),
    );
  }

  // Function to display tab content
  Widget _buildTabContent() {
    if (_activeTab == "Overview") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overview Content
          const Text(
            "Casual dhaba with a palm frond-covered roof & a traditional North Indian menu.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Opening Hours
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child:
                    Icon(Icons.access_time, size: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Closed",
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        " · Opens 10 AM",
                        style: TextStyle(
                          color: Colors.grey[800],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Open by business 5 days ago",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Place an order
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.delivery_dining,
                    size: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 12),
              Text(
                "Place an order",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // Menu
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.restaurant_menu,
                    size: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 12),
              Text(
                "Menu",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          // Website
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.language, size: 16, color: Colors.grey[700]),
              ),
              const SizedBox(width: 12),
              Text(
                "pizzaonfireqta.business.site",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Popular Food
          const Text(
            "Popular Food",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),

          RestaurantCard(
            onTap: () => context.push("/"),
            imageUrl: AppImages.cake,
            name: "Cake with Pistachio",
            location: "Silong",
            description: "Casual dhaba with palm frond covered roof",
            rating: 4.5,
            isFavorite: true,
            onFavoritePressed: () {},
          ),
          const SizedBox(height: 16),

          // View the Menu
          const Text(
            "View The Menu",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // Menu Images
          SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildMenuCard(),
                const SizedBox(width: 12),
                _buildMenuCard(),
                const SizedBox(width: 12),
                _buildMenuCard(),
              ],
            ),
          ),
        ],
      );
    } else if ((_activeTab == "Review")) {
      return const ReviewSection();
    } else {
      return const Text(
        "This is Work in progress",
      );
    }
  }

  // Function to create a tab button
  Widget _buildTab(String title) {
    bool isActive = _activeTab == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _activeTab = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: isActive ? Colors.deepOrange : Colors.transparent,
                width: 2,
              ),
            ),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isActive ? Colors.deepOrange : Colors.grey[600],
              fontWeight: isActive ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  // Function to create a menu card
  Widget _buildMenuCard() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: const AssetImage(
                AppImages.menuCard), // Replace with actual image
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.darken,
            ),
          ),
        ),
      ),
    );
  }
}

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "4.5 (154 Reviews)",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _buildReviewCard(
            "Jhone Black",
            "2 Month ago",
            "Welcome to Dynasty's Logan floorplan! This spacious",
            "assets/user1.png"),
        const SizedBox(height: 20),
        const Text(
          "Write review",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        _buildRatingStars(),
        const SizedBox(height: 10),
        _buildReviewInput(),
        const SizedBox(height: 10),
        SolidButtonWidget(label: "Submit", onPressed: () {})
      ],
    );
  }

  Widget _buildReviewCard(
      String name, String time, String review, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.black.withOpacity(0.4),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ProfileAvatar(
                  imagePath: AppImages.profilePicture,
                  onTap: () {},
                  size: 50,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_vert, color: Colors.grey),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              review,
              style: TextStyle(color: Colors.grey[700]),
            ),
            TextButton(
              onPressed: () {},
              child:
                  const Text("Read more", style: TextStyle(color: Colors.blue)),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRatingStars() {
    return Row(
      children: List.generate(
        5,
        (index) => const Icon(Icons.star, color: Colors.amber, size: 30),
      ),
    );
  }

  Widget _buildReviewInput() {
    return TextField(
      maxLines: 5,
      decoration: InputDecoration(
        hintText: "Type here",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
