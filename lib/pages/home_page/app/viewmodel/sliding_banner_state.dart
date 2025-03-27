import 'package:flutter/material.dart';

class SlidingBannerState {
  final PageController pageController;
  final List<String> banners;

  SlidingBannerState({
    required this.pageController,
    required this.banners,
  });

  // Copy with method to update state immutably
  SlidingBannerState copyWith({
    PageController? pageController,
    List<String>? banners,
  }) {
    return SlidingBannerState(
      pageController: pageController ?? this.pageController,
      banners: banners ?? this.banners,
    );
  }
}
