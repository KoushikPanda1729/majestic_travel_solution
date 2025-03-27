import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/pages/home_page/app/provider/sliding_banner_provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SlidingBanner extends ConsumerWidget {
  const SlidingBanner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerState = ref.watch(slidingBannerProvider);

    return Column(
      children: [
        SizedBox(
          height: 256,
          width: double.infinity,
          child: PageView.builder(
            controller: bannerState.pageController,
            itemCount: bannerState.banners.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  GoRouter.of(context).push('/booking_details');
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      bannerState.banners[index],
                      fit: BoxFit.fill,
                      width: double.infinity,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        SmoothPageIndicator(
          controller: bannerState.pageController,
          count: bannerState.banners.length,
          effect: ExpandingDotsEffect(
            dotWidth: 8,
            dotHeight: 8,
            activeDotColor: AppColors.teal,
            dotColor: Colors.grey.shade400,
          ),
        ),
      ],
    );
  }
}
