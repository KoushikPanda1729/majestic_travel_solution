import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/address_tile.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/date_picker.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/time_picker.dart';

class ScheduleTestStep extends ConsumerWidget {
  const ScheduleTestStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: DatePickerWidget()),
                  SizedBox(width: 10),
                  Expanded(child: TimePickerWidget()),
                ],
              ),
              SizedBox(height: 42),
              Text(
                "Choose Address",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Mulish",
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 10),
              AddressTile(),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 21),
          child: Column(
            children: [
              OutlineButtonWidget(
                label: "Add New Address",
                onPressed: () {
                  context.push("/add_update_address");
                },
                isLeadingIcon: true,
                iconPath: AppIcons.plusSmall,
                borderColor: AppColors.teal,
                labelColor: AppColors.teal,
                isCircle: true,
              ),
              const SizedBox(height: 10),
              SolidButtonWidget(
                label: "Next",
                onPressed: () {
                  // Move to next step
                  ref.read(checkoutProvider).updateStep(3);
                },
                isCircle: true,
              )
            ],
          ),
        ),
      ],
    );
  }
}
