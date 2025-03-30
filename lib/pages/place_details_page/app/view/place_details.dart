import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/profile_avatar/app/view/profile_avatar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class PlaceDetails extends StatelessWidget {
  const PlaceDetails({super.key});

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
            "Cox's Bazar Beach",
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
      return OverviewTab();
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

class OverviewTab extends StatefulWidget {
  @override
  _OverviewTabState createState() => _OverviewTabState();
}

class _OverviewTabState extends State<OverviewTab> {
  String _activeTab = "Overview";

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabContent(),
      ],
    );
  }

  Widget _buildTabContent() {
    if (_activeTab == "Overview") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description
          const Text(
            "Museum focusing on local indigenous people & culture, with all tools, clothing & artifacts on display. Don bosco to museum.",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Trip Options
          const Text(
            "Let's Start Your Trip",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildTripOption(
                Icons.hotel,
                "Hotel",
                Colors.orange,
                () => context.push('/hotel_map_hotel_list'),
              ),
              _buildTripOption(
                Icons.restaurant,
                "Restaurants",
                Colors.red,
                () => context.push('/restaurants'),
              ),
              _buildTripOption(
                Icons.park,
                "Tourist Spot",
                Colors.green,
                () => (),
              ),
              _buildTripOption(
                Icons.more_horiz,
                "More",
                Colors.blue,
                () => (),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Weather
          const Row(
            children: [
              Icon(Icons.cloud, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "2°C Mostly cloudy",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Local Time
          const Row(
            children: [
              Icon(Icons.access_time, size: 20, color: Colors.grey),
              SizedBox(width: 8),
              Text(
                "Local time Sunday 1:06 pm (GMT-5:00)",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Gallery
          const Text(
            "Gallery Photo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          _buildGallerySection(),
        ],
      );
    } else if (_activeTab == "Review") {
      return const Text("Reviews Section (Work in Progress)");
    } else {
      return const Text("This is Work in Progress");
    }
  }

  Widget _buildTripOption(
      IconData icon, String label, Color bgColor, VoidCallback onTap) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(icon, size: 24, color: Colors.white),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Widget _buildGallerySection() {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildGalleryImage(AppImages.destination1),
          _buildGalleryImage(AppImages.destination2),
          _buildGalleryImage(AppImages.destination3),
          _buildGalleryImage(AppImages.destination4),
        ],
      ),
    );
  }

  Widget _buildGalleryImage(String imagePath) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
