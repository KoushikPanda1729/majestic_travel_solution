import 'package:flutter/material.dart';

class NavigationState {
  final int currentIndex;
  final PageController pageController;

  NavigationState({
    this.currentIndex = 0,
    PageController? pageController,
  }) : pageController = pageController ?? PageController();

  NavigationState copyWith({
    int? currentIndex,
    PageController? pageController,
  }) {
    return NavigationState(
      currentIndex: currentIndex ?? this.currentIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}
