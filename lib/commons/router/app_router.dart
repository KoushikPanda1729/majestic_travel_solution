import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/add_member_and_edit_profile/app/view/add_member_and_edit_profile.dart';
import 'package:majestic_travel_solution/pages/account_page/app/view/account_screen.dart';
import 'package:majestic_travel_solution/pages/book_test_page/app/views/book_radiology.dart';
import 'package:majestic_travel_solution/pages/book_test_page/app/views/book_test.dart';
import 'package:majestic_travel_solution/pages/booking_details_page/app/view/booking_details_screen.dart';
import 'package:majestic_travel_solution/pages/call_page/app/view/call_screen.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/checkout_page.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/payments_success_screen.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/add_update_address.dart';
import 'package:majestic_travel_solution/pages/login_page/app/views/login_screen.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/view/main_navigation.dart';
import 'package:majestic_travel_solution/pages/need_help_page/app/view/need_help_screen.dart';
import 'package:majestic_travel_solution/pages/need_help_page/app/view/widgets/health_score_form.dart';
import 'package:majestic_travel_solution/pages/need_help_page/app/view/widgets/score_list.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/onboarding_screen.dart';
import 'package:majestic_travel_solution/pages/signup_page/app/views/signup_screen.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/splash_screen.dart';
import 'package:majestic_travel_solution/pages/test_health_condition_page/app/views/popular_health_package.dart';
import 'package:majestic_travel_solution/pages/test_health_condition_page/app/views/test_body_part.dart';
import 'package:majestic_travel_solution/pages/test_health_condition_page/app/views/test_health_condition.dart';
import 'package:majestic_travel_solution/pages/track_page/app/view/track_order_widget.dart';
import 'package:majestic_travel_solution/pages/view_reports/app/view/view_report.dart';

final GoRouter router = GoRouter(
  initialLocation: '/splash',
  routes: [
    // Main navigation routes
    GoRoute(
      path: '/',
      name: "home",
      builder: (context, state) => const MainNavigationScreen(),
    ),

    GoRoute(
      path: '/help',
      name: "help",
      builder: (context, state) => const NeedHelpScreen(),
    ),
    GoRoute(
      path: '/booking_details',
      name: "booking_details",
      builder: (context, state) => const BookingDetailsScreen(),
    ),
    GoRoute(
      path: '/call',
      name: "call",
      builder: (context, state) => const CallScreen(),
    ),
    GoRoute(
      path: '/track',
      name: "track",
      builder: (context, state) => const TrackOrderWidget(),
    ),
    GoRoute(
      path: '/account',
      name: "account",
      builder: (context, state) => const AccountScreen(),
    ),

    // Other routes
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => SignupScreen(),
    ),
    // Unified checkout route - single entry point for the entire checkout flow
    GoRoute(
      path: '/checkout',
      builder: (context, state) => const CheckoutPage(),
    ),
    // Existing routes that remain the same
    GoRoute(
      path: '/payment_success',
      builder: (context, state) => const PaymentSuccessfulScreen(),
    ),
    GoRoute(
      path: '/book_test',
      builder: (context, state) => const BookTest(),
    ),

    GoRoute(
      path: '/test-health-condition',
      builder: (context, state) => const TestHealthCondition(),
    ),
    GoRoute(
      path: '/test-body-part',
      builder: (context, state) => const TestBodyPart(),
    ),
    GoRoute(
      path: '/popular-health-package',
      builder: (context, state) => const PopularHealthPackage(),
    ),
    GoRoute(
      path: '/book-radiology',
      builder: (context, state) => const BookRadiology(),
    ),
    GoRoute(
      path: '/view-reports',
      builder: (context, state) => const ViewReport(),
    ),
    GoRoute(
      path: '/health_score_form',
      builder: (context, state) => const HealthScoreForm(),
    ),
    GoRoute(
      path: '/score_list',
      builder: (context, state) => const ScoreListPage(),
    ),
    GoRoute(
      path: '/add_update_address',
      builder: (context, state) {
        final isEditMode = state.extra as bool? ?? false;
        return AddUpdateAddress(
          isEditMode: isEditMode,
        );
      },
    ),
    GoRoute(
      path: '/add_family_member_and_edit_profile',
      builder: (context, state) {
        final isEditMode = state.extra as bool? ?? false;
        return AddMemberAndEditProfile(isEditMode: isEditMode);
      },
    ),
  ],
);
