import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';

class PaymentStep extends ConsumerWidget {
  const PaymentStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        const Expanded(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Here you would add your payment options
                Text(
                  "Select Payment Method",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text("Payment gateway integration will be added here"),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 21),
          child: SolidButtonWidget(
            label: "Pay now",
            onPressed: () {
              // Navigate to payment success page
              ref.invalidate(checkoutProvider);
              context.push("/payment_success");
            },
            isCircle: true,
          ),
        ),
      ],
    );
  }
}
