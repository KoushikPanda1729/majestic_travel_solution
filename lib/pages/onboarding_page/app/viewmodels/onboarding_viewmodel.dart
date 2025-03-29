import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/onboarding_screen_one.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/onboarding_screen_three.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/onboarding_screen_two.dart';

import 'onboarding_state.dart';

class OnboardingViewModel extends StateNotifier<OnboardingState> {
  OnboardingViewModel()
      : super(OnboardingState(
          currentPage: 0,
          onboardingPages: [
            const OnboardingScreenOne(),
            const OnboardingScreenTwo(),
            const OnboardingScreenThree(),
          ],
          pageController: PageController(initialPage: 0),
        ));

  void updatePage(int page) {
    state = state.copyWith(currentPage: page);
  }

  void nextPage() {
    if (state.currentPage == state.onboardingPages.length - 1) {
      return;
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
    return state.currentPage == state.onboardingPages.length - 1;
  }
}
