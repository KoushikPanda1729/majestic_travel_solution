import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/bottom_navigation_bar.dart';
import 'package:majestic_travel_solution/pages/account_page/app/view/account_screen.dart';
import 'package:majestic_travel_solution/pages/notification_page/app/view/notification_screen.dart';
import 'package:majestic_travel_solution/pages/home_page/app/view/home_screen.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/provider/main_navigation_provider.dart';
import 'package:majestic_travel_solution/pages/saved_page/app/view/saved_restaurants.dart';

class MainNavigationScreen extends ConsumerWidget {
  const MainNavigationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationState = ref.watch(navigationProvider);
    final navigationViewModel = ref.read(navigationProvider.notifier);

    return PopScope(
      canPop: navigationViewModel.canPopPage(),
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop) {
          navigationViewModel.handleBackPress();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            // Main content area
            Positioned.fill(
              bottom: 0,
              child: PageView(
                controller: navigationState.pageController,
                onPageChanged: (index) {
                  navigationViewModel.onPageChanged(index);
                },
                children: const [
                  HomeScreen(),
                  SavedRestaurants(),
                  NotificationScreen(),
                  AccountScreen(),
                ],
              ),
            ),

            // Positioned Bottom Navigation Bar
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: BottomNavigationBarWidget(
                  activeIndex: navigationState.currentIndex,
                  onItemTapped: (index) {
                    navigationViewModel.changePage(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
