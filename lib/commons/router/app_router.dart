import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/add_member_and_edit_profile/app/view/add_member_and_edit_profile.dart';
import 'package:majestic_travel_solution/pages/account_page/app/view/account_screen.dart';
import 'package:majestic_travel_solution/pages/all_restaurants_page/app/view/all_restaurants_page.dart';
import 'package:majestic_travel_solution/pages/all_restaurants_page/app/view/restaurants_details_page.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/checkout_page.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/payments_success_screen.dart';
import 'package:majestic_travel_solution/pages/checkout_summary_page/app/view/widget/add_update_address.dart';
import 'package:majestic_travel_solution/pages/destination_details/app/view/destination_details.dart';
import 'package:majestic_travel_solution/pages/login_page/app/views/login_screen.dart';
import 'package:majestic_travel_solution/pages/main_navigaion/app/view/main_navigation.dart';
import 'package:majestic_travel_solution/pages/notification_page/app/view/notification_screen.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/onboarding_screen.dart';
import 'package:majestic_travel_solution/pages/place_details_page/app/view/place_details.dart';
import 'package:majestic_travel_solution/pages/place_details_page/app/view/widgets/booking_request.dart';
import 'package:majestic_travel_solution/pages/place_details_page/app/view/widgets/hotel_details.dart';
import 'package:majestic_travel_solution/pages/place_details_page/app/view/widgets/hotel_map_hotel_list.dart';
import 'package:majestic_travel_solution/pages/saved_page/app/view/saved_restaurants.dart';
import 'package:majestic_travel_solution/pages/signup_page/app/views/signup_screen.dart';
import 'package:majestic_travel_solution/pages/onboarding_page/app/views/splash_screen.dart';

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
      path: '/saved_restaurants',
      name: "saved_restaurants",
      builder: (context, state) => const SavedRestaurants(),
    ),
    GoRoute(
      path: '/notification',
      name: "notification",
      builder: (context, state) => const NotificationScreen(),
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
      path: '/restaurants_details',
      builder: (context, state) => const RestaurantsDetailsPage(),
    ),
    GoRoute(
      path: '/booking_request',
      builder: (context, state) => const BookingRequestScreen(),
    ),
    GoRoute(
      path: '/hotel_details',
      builder: (context, state) => const HotelDetails(),
    ),
    GoRoute(
      path: '/place_details',
      builder: (context, state) => const PlaceDetails(),
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
      path: '/destination_details',
      builder: (context, state) => const DestinationDetailsScreen(),
    ),
    GoRoute(
      path: '/restaurants',
      builder: (context, state) => const RestaurantsPage(),
    ),
    GoRoute(
      path: '/hotel_map_hotel_list',
      builder: (context, state) => const HotelMapHotelList(),
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
