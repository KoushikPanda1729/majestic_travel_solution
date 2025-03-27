import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/pages/home_page/app/viewmodel/sliding_banner_state.dart';

class SlidingBannerViewModel extends StateNotifier<SlidingBannerState> {
  SlidingBannerViewModel()
      : super(
          SlidingBannerState(
            pageController: PageController(),
            banners: [
              AppImages.mainBanner,
              AppImages.mainBanner,
              AppImages.mainBanner,
              AppImages.mainBanner,
            ],
          ),
        );

  void goToPage(int page) {
    state.pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
