import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/constants/app_images.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future.delayed(const Duration(seconds: 3), () {
      if (context.mounted) {
        context.go('/onboarding');
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
              child: Image.asset(
                AppImages.logo,
                width: 120,
                height: 120,
              ),
            ),
            const SizedBox(height: 20),
            RichText(
              text: const TextSpan(
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                    text: 'Majestic Travel ',
                    style: TextStyle(color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Solution',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
