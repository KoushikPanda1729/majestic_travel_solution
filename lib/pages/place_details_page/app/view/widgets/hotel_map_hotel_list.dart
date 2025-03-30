import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
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

  // Initial camera position
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(24.899, 91.872), // Approximate coordinates for Sylhet
    zoom: 14,
  );

  // Hotel markers
  final Set<Marker> _markers = {};

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
  void initState() {
    super.initState();

    // Initialize hotel markers
    _addHotelMarkers();
  }

  void _addHotelMarkers() {
    // Add hotel markers (blue)
    _markers.add(
      Marker(
        markerId: const MarkerId('hotel1'),
        position: const LatLng(24.903, 91.875),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('hotel2'),
        position: const LatLng(24.9, 91.878),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('hotel3'),
        position: const LatLng(24.894, 91.87),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    _markers.add(
      Marker(
        markerId: const MarkerId('hotel4'),
        position: const LatLng(24.886, 91.874),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    // Add current location marker (red)
    _markers.add(
      const Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(24.905, 91.882),
        icon: BitmapDescriptor.defaultMarker, // Default red marker
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Stack(
        children: [
          // Google Map or Hotel List based on state
          _showHotelList
              ? _buildHotelListView(() => context.push("/hotel_details"))
              : _buildMapView(),

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
                    const SizedBox(
                      height: 5,
                    ),
                    SearchBarWidget(onChanged: (value) {})
                  ],
                ),
              ),
            ),
          ),

          // Bottom hotel preview card (only shown in map view)
          if (!_showHotelList)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  // Hotel card
                  Container(
                    margin: const EdgeInsets.all(16),
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
                        // Hotel image
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
                        // Hotel details
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: const Text(
                                        'BDT 8,542',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  'Star Pacific Sylhet',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Row(
                                  children: [
                                    const Text(
                                      '4.0',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                    const SizedBox(width: 4),
                                    Row(
                                      children: List.generate(
                                        5,
                                        (index) => Icon(
                                          index < 4
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

                  // Bottom navigation bar
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    child: Row(
                      children: [
                        Expanded(
                          child: SolidButtonWidget(
                            backgroundColor: AppColors.white,
                            labelColor: AppColors.black,
                            label: "View Hotel",
                            onPressed: () {
                              setState(() {
                                _showHotelList = true;
                              });
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: SolidButtonWidget(
                            label: "View Map",
                            onPressed: () {},
                            backgroundColor: AppColors.black,
                            labelColor: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

          // Bottom navigation bar for hotel list view
          if (_showHotelList)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: SolidButtonWidget(
                        backgroundColor: AppColors.black,
                        labelColor: AppColors.white,
                        label: "View Hotel",
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: SolidButtonWidget(
                        backgroundColor: AppColors.white,
                        labelColor: AppColors.black,
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
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildMapView() {
    return GoogleMap(
      initialCameraPosition: _initialCameraPosition,
      markers: _markers,
      myLocationEnabled: false,
      zoomControlsEnabled: false,
      onMapCreated: (controller) {},
    );
  }

  Widget _buildHotelListView(VoidCallback onTap) {
    return SafeArea(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            const SizedBox(height: 100), // Space for the app bar
            Expanded(
              child: ListView.builder(
                padding:
                    const EdgeInsets.only(bottom: 80), // Space for bottom bar
                itemCount: _hotelList.length,
                itemBuilder: (context, index) {
                  final hotel = _hotelList[index];
                  return Container(
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
