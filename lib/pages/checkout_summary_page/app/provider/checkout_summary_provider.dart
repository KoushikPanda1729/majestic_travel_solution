import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/viewmodel/checkout_summary_view_model.dart';

// Main provider for checkout page
final checkoutProvider = ChangeNotifierProvider((ref) => CheckoutViewModel());

// This will help us to access the current step value across the app
final currentStepProvider = Provider<int>((ref) {
  return ref.watch(checkoutProvider).state.currentStep;
});

// This will help us to access checkout data across the app
final checkoutDataProvider = Provider<Map<String, dynamic>>((ref) {
  return ref.watch(checkoutProvider).state.checkoutData;
});
