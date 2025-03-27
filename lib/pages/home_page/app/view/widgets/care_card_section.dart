import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/components/care_card/app/view/care_card.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class CareCardSection extends StatelessWidget {
  const CareCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> careServices = [
      {"text": "Kids Care", "icon": AppIcons.childHead},
      {"text": "Parents Care", "icon": AppIcons.oldPeople},
      {"text": "Partner Care", "icon": AppIcons.heart3},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Wrap(
          spacing: 9,
          children: careServices.map((service) {
            return CareCard(
              text: service["text"],
              icon: service["icon"],
              onPress: () {},
            );
          }).toList(),
        ),
      ),
    );
  }
}
