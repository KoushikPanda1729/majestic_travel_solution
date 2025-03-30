import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/search_bar/app/view/search_bar_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class HotelMapHotelList extends StatefulWidget {
  const HotelMapHotelList({super.key});

  @override
  State<HotelMapHotelList> createState() => _HotelMapHotelListState();
}

class _HotelMapHotelListState extends State<HotelMapHotelList> {
  bool _showHotelList = false;

  // Demo hotel list data
  final List<Map<String, dynamic>> _hotelList = [
    {
      'name': 'Star Pacific Sylhet',
      'price': 'BDT 8,542',
      'rating': 4.0,
      'image': AppImages.destination1,
    },
    {
      'name': 'Rose View Hotel',
      'price': 'BDT 12,350',
      'rating': 4.5,
      'image': AppImages.destination2,
    },
    {
      'name': 'Hotel Supreme',
      'price': 'BDT 7,800',
      'rating': 3.8,
      'image': AppImages.destination3,
    },
    {
      'name': 'Grand Palace Hotel',
      'price': 'BDT 9,250',
      'rating': 4.2,
      'image': AppImages.destination4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Map or Hotel List View
          _showHotelList
              ? _buildHotelListView(() => context.push("/hotel_details"))
              : _buildDummyMapView(),

          // App Bar with back button and search
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FloatingButton(
                      onPressed: () {
                        context.pop();
                      },
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: AppColors.white,
                      iconColor: AppColors.black,
                      isDisabled: false,
                      buttonSize: 42,
                      iconSize: 20,
                      isRotated: true,
                    ),
                    const SizedBox(height: 5),
                    SearchBarWidget(onChanged: (value) {}),
                  ],
                ),
              ),
            ),
          ),

          // Bottom hotel preview (only shown in map view)
          if (!_showHotelList) _buildHotelPreview(),

          // Fixed bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomNavBar(),
          ),
        ],
      ),
    );
  }

  // Dummy Map View (Replacing Google Map)
  Widget _buildDummyMapView() {
    return Positioned.fill(
      child: Image.asset(
        AppImages.map, // Replace this with your dummy map image
        fit: BoxFit.cover,
      ),
    );
  }

  // Hotel Preview Card (Shown when Map is displayed)
  Widget _buildHotelPreview() {
    return Positioned(
      bottom: 100, // Adjust to avoid overlap with the bottom navbar
      left: 16,
      right: 16,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(AppImages.destination4),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Star Pacific Sylhet',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          index < 4 ? Icons.star : Icons.star_border,
                          color: Colors.amber,
                          size: 14,
                        ),
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

  // Fixed Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: SolidButtonWidget(
              backgroundColor:
                  _showHotelList ? AppColors.black : AppColors.white,
              labelColor: _showHotelList ? AppColors.white : AppColors.black,
              label: "View Hotel",
              onPressed: () {
                setState(() {
                  _showHotelList = true;
                });
              },
            ),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: SolidButtonWidget(
              backgroundColor:
                  _showHotelList ? AppColors.white : AppColors.black,
              labelColor: _showHotelList ? AppColors.black : AppColors.white,
              label: "View Map",
              onPressed: () {
                setState(() {
                  _showHotelList = false;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  // Hotel List View
  Widget _buildHotelListView(VoidCallback onTap) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 100), // Space for the app bar
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                  bottom: 100), // Extra space for bottom navbar
              itemCount: _hotelList.length,
              itemBuilder: (context, index) {
                final hotel = _hotelList[index];
                return GestureDetector(
                  onTap: onTap,
                  child: Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomLeft: Radius.circular(12),
                            ),
                            image: DecorationImage(
                              image: AssetImage(hotel['image']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6, vertical: 2),
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade700,
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        hotel['price'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  hotel['name'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      hotel['rating'].toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(width: 4),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index < hotel['rating']
                                              ? Icons.star
                                              : Icons.star_border,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
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
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
