import 'package:flutter/material.dart';

class OnboardingState {
  final int currentPage;
  final List<Widget> onboardingPages;
  final PageController pageController;

  OnboardingState({
    required this.currentPage,
    required this.onboardingPages,
    required this.pageController,
  });

  OnboardingState copyWith({int? currentPage}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      onboardingPages: onboardingPages,
      pageController: pageController,
    );
  }
}
