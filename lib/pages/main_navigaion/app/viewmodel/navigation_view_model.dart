import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/viewmodel/navigation_state.dart';

class NavigationViewModel extends StateNotifier<NavigationState> {
  NavigationViewModel() : super(NavigationState());

  void changePage(int index) {
    state.pageController.jumpToPage(index);
    state = state.copyWith(currentIndex: index);
  }

  void onPageChanged(int index) {
    state = state.copyWith(currentIndex: index);
  }

  bool canPopPage() {
    return state.currentIndex == 0;
  }

  void handleBackPress() {
    if (state.currentIndex != 0) {
      changePage(0);
    }
  }

  @override
  void dispose() {
    state.pageController.dispose();
    super.dispose();
  }
}
