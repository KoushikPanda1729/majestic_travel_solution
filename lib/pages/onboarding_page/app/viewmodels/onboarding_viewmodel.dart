import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/viewmodels/onboarding_state.dart';

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  OnboardingViewModel()
      : super(OnboardingState(
          currentPage: 0,
          onboardingImages: [
            AppImages.onboarding1,
            AppImages.onboarding2,
            AppImages.onboarding3,
            AppImages.onboarding4,
          ],
          pageController: PageController(initialPage: 0),
        ));

  void updatePage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void nextPage() {
    if (state.currentPage == state.onboardingImages.length - 1) {
      return; // Already on the last page
    }
    state.pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    if (state.currentPage > 0) {
      state.pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  bool isLastPage() {
    return state.currentPage == state.onboardingImages.length - 1;
  }
}
