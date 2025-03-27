import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/medical_services_card/app/view/medical_services_card.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class MedicalServicesFlex extends StatelessWidget {
  const MedicalServicesFlex({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> services = [
      {
        'title': 'Book Home Collection',
        'iconPath': AppIcons.heartBeat,
        'route': '/home-collection', // Define routes
      },
      {
        'title': 'View My Reports',
        'iconPath': AppIcons.heartBeat,
        'route': '/view-reports',
      },
      {
        'title': 'Popular Test Packages',
        'iconPath': AppIcons.heartBeat,
        'route': '/popular-health-package',
      },
      {
        'title': 'Book Your Radiology Scans',
        'iconPath': AppIcons.heartBeat,
        'route': '/book-radiology',
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        alignment: WrapAlignment.start,
        children: List.generate(services.length, (index) {
          return SizedBox(
            width: (MediaQuery.of(context).size.width / 2) - 20,
            child: MedicalServicesCard(
              title: services[index]['title']!,
              iconPath: services[index]['iconPath']!,
              onTap: () {
                context
                    .push(services[index]['route']); // Navigate using GoRouter
              },
            ),
          );
        }),
      ),
    );
  }
}
