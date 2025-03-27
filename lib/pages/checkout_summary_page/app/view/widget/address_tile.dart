import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.teal, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Address 1",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    fontFamily: "Mulish",
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  "Q11M4+R89, Talaswar, Jharkhand 825311",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Mulish",
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.check,
                colorFilter: const ColorFilter.mode(
                  AppColors.teal,
                  BlendMode.srcIn,
                ),
                width: 18,
                height: 18,
              ),
              const SizedBox(height: 13),
              GestureDetector(
                onTap: () {
                  context.push("/add_update_address", extra: true);
                },
                child: SvgPicture.asset(
                  AppIcons.pencil,
                  colorFilter: const ColorFilter.mode(
                    AppColors.teal,
                    BlendMode.srcIn,
                  ),
                  width: 18,
                  height: 18,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
