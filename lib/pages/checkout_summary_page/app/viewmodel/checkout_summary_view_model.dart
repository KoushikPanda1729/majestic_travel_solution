import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/viewmodel/checkout_summary_state.dart';

class CheckoutViewModel extends ChangeNotifier {
  CheckoutState _state = CheckoutState();
  CheckoutState get state => _state;

  // Update the current step
  void updateStep(int step) {
    if (step >= 0 && step <= 3) {
      _state = _state.copyWith(currentStep: step);
      notifyListeners();
    }
  }

  // Update checkout data
  void updateCheckoutData(Map<String, dynamic> data) {
    final updatedData = Map<String, dynamic>.from(_state.checkoutData)
      ..addAll(data);
    _state = _state.copyWith(checkoutData: updatedData);
    notifyListeners();
  }

  // Helper methods for specific data updates
  void setSelectedMember(Map<String, String> member) {
    final updatedData = Map<String, dynamic>.from(_state.checkoutData);
    updatedData['selectedMember'] = member;
    _state = _state.copyWith(checkoutData: updatedData);
    notifyListeners();
  }

  void setSchedule(DateTime date, TimeOfDay time) {
    final updatedData = Map<String, dynamic>.from(_state.checkoutData);
    updatedData['schedule'] = {'date': date, 'time': time};
    _state = _state.copyWith(checkoutData: updatedData);
    notifyListeners();
  }

  void setAddress(Map<String, String> address) {
    final updatedData = Map<String, dynamic>.from(_state.checkoutData);
    updatedData['address'] = address;
    _state = _state.copyWith(checkoutData: updatedData);
    notifyListeners();
  }

  void setPaymentMethod(String method) {
    final updatedData = Map<String, dynamic>.from(_state.checkoutData);
    updatedData['paymentMethod'] = method;
    _state = _state.copyWith(checkoutData: updatedData);
    notifyListeners();
  }

  void setLoading(bool isLoading) {
    _state = _state.copyWith(isLoading: isLoading);
    notifyListeners();
  }
}
