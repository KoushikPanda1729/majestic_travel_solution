import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/coupon_and_payment_summary.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/test_summary_card.dart';

class CartSummaryStep extends ConsumerWidget {
  const CartSummaryStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Test Item Container
          TestSummaryCard(
            testName: 'Complete Blood Count (CBC)',
            price: '₹1399',
            onRemove: () {
              // Handle remove test
            },
          ),

          const SizedBox(height: 13),
          SizedBox(
            width: 137,
            height: 28,
            child: OutlineButtonWidget(
              label: "Add More Test",
              onPressed: () {},
              isLeadingIcon: true,
              iconPath: AppIcons.plusSmall,
              borderColor: AppColors.teal,
              labelColor: AppColors.teal,
              isCircle: true,
            ),
          ),
          const SizedBox(height: 55),

          // Payment Details and Coupon Container
          CouponAndPaymentSummary(
            onViewCoupons: () {},
            subTotal: '₹1399',
            discount: '-₹500',
            totalPayable: '₹899',
          ),

          const SizedBox(height: 30),
          // Next Button
          SolidButtonWidget(
            label: "Next",
            onPressed: () {
              // Move to next step
              ref.read(checkoutProvider).updateStep(1);
            },
            isCircle: true,
          )
        ],
      ),
    );
  }
}
