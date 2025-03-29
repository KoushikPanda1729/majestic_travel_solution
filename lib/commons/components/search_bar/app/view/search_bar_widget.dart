import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class SearchBarWidget extends StatelessWidget {
  final String hintText;
  final ValueChanged<String> onChanged;

  const SearchBarWidget({
    super.key,
    this.hintText = 'Search your destination',
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 1,
            spreadRadius: 1,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.only(left: 10),
        child: TextField(
          style: const TextStyle(fontSize: 15),
          textAlignVertical: TextAlignVertical.center,
          onChanged: onChanged, // Calls the function when text changes
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey.withOpacity(0.9),
              fontSize: 12,
              fontWeight: FontWeight.w600,
              fontFamily: "Mulish",
            ),
            border: InputBorder.none,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SvgPicture.asset(
                AppIcons.search, // Change to the desired prefix icon
                colorFilter: const ColorFilter.mode(
                  AppColors.black,
                  BlendMode.srcIn,
                ),
                width: 16,
                height: 16,
              ),
            ),
            suffixIcon: SizedBox(
              width: 10,
              height: 10,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: SvgPicture.asset(
                  AppIcons.filter, // Keep or change as needed
                  colorFilter: const ColorFilter.mode(
                    AppColors.black,
                    BlendMode.srcIn,
                  ),
                  width: 10,
                  height: 10,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
