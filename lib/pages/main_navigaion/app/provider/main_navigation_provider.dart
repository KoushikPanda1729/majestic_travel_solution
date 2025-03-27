import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/viewmodel/navigation_state.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/viewmodel/navigation_view_model.dart';

final navigationProvider =
    StateNotifierProvider<NavigationViewModel, NavigationState>((ref) {
  return NavigationViewModel();
});
