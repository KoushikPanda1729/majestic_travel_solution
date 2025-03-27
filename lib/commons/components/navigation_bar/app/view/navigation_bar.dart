import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class NavBar extends StatelessWidget {
  final Widget? leadingIcon;
  final Widget? trailingIcon;

  const NavBar({super.key, this.leadingIcon, this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Show leading icon if provided, otherwise show default text
            leadingIcon ??
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hello, Asha",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "Agra, Delhi",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

            /// Show trailing icon if provided, otherwise show default buttons
            trailingIcon ??
                SizedBox(
                  width: 195,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FloatingButton(
                        onPressed: () {},
                        iconPath: AppIcons.add,
                        backgroundColor: AppColors.white,
                        iconColor: AppColors.teal,
                        isDisabled: false,
                        buttonSize: 42,
                        iconSize: 18,
                      ),
                      FloatingButton(
                        onPressed: () {
                          context.push("/book_test");
                        },
                        iconPath: AppIcons.search,
                        backgroundColor: AppColors.white,
                        iconColor: AppColors.teal,
                        isDisabled: false,
                        buttonSize: 42,
                        iconSize: 18,
                      ),
                      FloatingButton(
                        onPressed: () {},
                        iconPath: AppIcons.bell,
                        backgroundColor: AppColors.white,
                        iconColor: AppColors.teal,
                        isDisabled: false,
                        buttonSize: 42,
                        iconSize: 18,
                      ),
                      FloatingButton(
                        onPressed: () {
                          context.push("/checkout");
                        },
                        iconPath: AppIcons.shoppingCart,
                        backgroundColor: AppColors.white,
                        iconColor: AppColors.teal,
                        isDisabled: false,
                        buttonSize: 42,
                        iconSize: 18,
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
