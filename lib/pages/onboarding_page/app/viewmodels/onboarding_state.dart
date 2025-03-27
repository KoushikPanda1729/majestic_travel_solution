import 'package:flutter/material.dart';

class OnboardingState {
  final int currentPage;
  final List<String> onboardingImages;
  final PageController pageController;

  OnboardingState({
    required this.currentPage,
    required this.onboardingImages,
    required this.pageController,
  });

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      onboardingImages: onboardingImages,
      pageController: pageController,
    );
  }
}
