import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/checkout_summary_page.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/payment.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/member_selection.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/schedule_test.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/steper_item.dart';

class CheckoutPage extends ConsumerWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentStep = ref.watch(currentStepProvider);
    final viewModel = ref.watch(checkoutProvider);

    return PopScope(
      canPop: currentStep == 0,
      onPopInvokedWithResult: (bool didPop, Object? result) {
        if (!didPop && currentStep > 0) {
          viewModel.updateStep(currentStep - 1);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Column(
          children: [
            // Fixed NavBar - This will always stay at the top
            NavBar(
              leadingIcon: FloatingButton(
                onPressed: () {
                  if (currentStep > 0) {
                    // Go back to previous step
                    viewModel.updateStep(currentStep - 1);
                  } else {
                    // Exit checkout flow
                    context.pop();
                  }
                },
                iconPath: AppIcons.angleSmallRight,
                backgroundColor: AppColors.white,
                iconColor: AppColors.black,
                isDisabled: false,
                buttonSize: 42,
                iconSize: 20,
                isRotated: true,
              ),
              trailingIcon: const SizedBox(),
            ),
            const SizedBox(height: 13),

            // Fixed Stepper - This will always stay below NavBar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StepperItem(
                    step: 0,
                    currentStep: currentStep,
                    label: 'Add to Cart',
                    icon: AppIcons.shoppingCart,
                  ),
                  _buildStepperLine(0, currentStep),
                  StepperItem(
                    step: 1,
                    currentStep: currentStep,
                    label: 'Select Member',
                    icon: AppIcons.users,
                  ),
                  _buildStepperLine(1, currentStep),
                  StepperItem(
                    step: 2,
                    currentStep: currentStep,
                    label: 'Schedule Test',
                    icon: AppIcons.calendarDay,
                  ),
                  _buildStepperLine(2, currentStep),
                  StepperItem(
                    step: 3,
                    currentStep: currentStep,
                    label: 'Payment',
                    icon: AppIcons.creditCard,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),

            // Dynamic Content Area - This will change based on current step
            Expanded(
              child: _getStepContent(currentStep),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getStepContent(int currentStep) {
    switch (currentStep) {
      case 0:
        return const CartSummaryStep();
      case 1:
        return MemberSelectionStep();
      case 2:
        return const ScheduleTestStep();
      case 3:
        return const PaymentStep();
      default:
        return const CartSummaryStep();
    }
  }

  Widget _buildStepperLine(int step, int currentStep) {
    final isActive = step < currentStep;
    return Expanded(
      child: DottedBorder(
        color: isActive ? AppColors.teal : AppColors.black,
        dashPattern: const [6, 4],
        strokeWidth: 1.5,
        padding: EdgeInsets.zero,
        customPath: (size) {
          return Path()
            ..moveTo(0, size.height)
            ..lineTo(size.width, size.height);
        },
        child: const SizedBox(width: double.infinity),
      ),
    );
  }
}
