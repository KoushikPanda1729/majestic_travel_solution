import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/viewmodels/onboarding_state.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/viewmodels/onboarding_viewmodel.dart';

final onboardingProvider =
    StateNotifierProvider<OnboardingViewModel, OnboardingState>(
  (ref) => OnboardingViewModel(),
);
