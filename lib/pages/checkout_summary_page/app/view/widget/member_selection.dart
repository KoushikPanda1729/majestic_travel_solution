import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/outline_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/provider/checkout_summary_provider.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/member_tile.dart';

class MemberSelectionStep extends ConsumerWidget {
  final List<Map<String, String>> members = [
    {"name": "Asha Yadav", "gender": "Female", "age": "35", "selected": "true"},
    {"name": "Kunal Yadav", "gender": "Male", "age": "40", "selected": "false"},
    {"name": "Ayush Yadav", "gender": "Male", "age": "8", "selected": "false"},
    {
      "name": "Sunita Yadav",
      "gender": "Female",
      "age": "60",
      "selected": "false"
    },
    {
      "name": "Mohanlal Yadav",
      "gender": "Male",
      "age": "69",
      "selected": "false"
    },
  ];

  MemberSelectionStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: members
                    .map(
                      (member) => MemberTile(
                        name: member["name"]!,
                        gender: member["gender"]!,
                        age: member["age"]!,
                        isSelected: member["selected"] == "true",
                        onTap: () {
                          // Handle member selection
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          margin: const EdgeInsets.only(bottom: 21),
          child: Column(
            children: [
              OutlineButtonWidget(
                label: "Add New Member(s)",
                onPressed: () {
                  context.push("/add_family_member_and_edit_profile",
                      extra: false);
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
                  ref.read(checkoutProvider).updateStep(2);
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
