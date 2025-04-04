import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/providers/onboarding_provider.dart';

class OnboardingScreen extends ConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardingState = ref.watch(onboardingProvider);
    final onboardingViewModel = ref.read(onboardingProvider.notifier);

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double buttonSize = constraints.maxWidth * 0.12;
          double iconSize = constraints.maxWidth * 0.05;
          double indicatorSize = constraints.maxWidth * 0.02;
          double horizontalMargin = constraints.maxWidth * 0.0636;
          double bottomMargin = constraints.maxHeight * 0.02;

          return Stack(
            children: [
              PageView(
                controller: onboardingState.pageController,
                onPageChanged: (index) => onboardingViewModel.updatePage(index),
                children: onboardingState.onboardingPages,
              ),
              Positioned(
                bottom: bottomMargin,
                left: horizontalMargin,
                right: horizontalMargin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingButton(
                      onPressed: onboardingViewModel.previousPage,
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: onboardingState.currentPage == 0
                          ? Colors.grey
                          : AppColors.black,
                      iconColor: AppColors.white,
                      isRotated: true,
                      isDisabled: onboardingState.currentPage == 0,
                      buttonSize: buttonSize,
                      iconSize: iconSize,
                    ),
                    SmoothPageIndicator(
                      controller: onboardingState.pageController,
                      count: onboardingState.onboardingPages.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: indicatorSize,
                        dotWidth: indicatorSize,
                        activeDotColor: AppColors.black,
                        dotColor: Colors.grey,
                        spacing: indicatorSize,
                      ),
                    ),
                    FloatingButton(
                      onPressed: () {
                        if (onboardingViewModel.isLastPage()) {
                          context.push('/login');
                        } else {
                          onboardingViewModel.nextPage();
                        }
                      },
                      iconPath: AppIcons.angleSmallRight,
                      backgroundColor: AppColors.black,
                      iconColor: AppColors.white,
                      isDisabled: false,
                      buttonSize: buttonSize,
                      iconSize: iconSize,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
