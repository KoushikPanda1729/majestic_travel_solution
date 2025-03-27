import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/components/navigation_bar/app/view/navigation_bar.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alpha_neumeric_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/alphabetic_text_field_widget.dart';
import 'package:majestic_travel_solution/commons/components/text_fields/app/views/dropdown_text_field.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class AddUpdateAddress extends StatelessWidget {
  final bool isEditMode;

  const AddUpdateAddress({super.key, this.isEditMode = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavBar(
            leadingIcon: FloatingButton(
              onPressed: () {
                context.pop();
              },
              iconPath: AppIcons.angleSmallRight,
              backgroundColor: AppColors.white,
              iconColor: AppColors.black,
              isDisabled: false,
              buttonSize: 42,
              iconSize: 20,
              isRotated: true,
            ),
            trailingIcon: const SizedBox(),
          ),
          Center(
            child: Text(
              isEditMode ? "Edit Address" : "Add New Address",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 22),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                AlphaNumericTextfieldWidget(
                  onTextChanged: (value) {},
                  labelText: "House No./ Flat/ Building",
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: AlphaNumericTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "Street Name",
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AlphaNumericTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "Colony/ Area/ Secto",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: AlphabeticTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "Post Office",
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: AlphabeticTextfieldWidget(
                        onTextChanged: (value) {},
                        labelText: "Pincode",
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(
                      child: TextfieldDropdown(
                        label: "",
                        title: "Select City",
                        hintText: "City",
                        selectedItem: "",
                        items: const [
                          "Kolkata",
                          "Delhi",
                          "Mumbai",
                          "Bangalore",
                          "Chennai",
                        ],
                        onItemSelected: (value) {},
                        getDisplayText: (value) => value,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextfieldDropdown(
                        label: "",
                        title: "Select State",
                        hintText: "State",
                        selectedItem: "",
                        items: const [
                          "West Bengal",
                          "Delhi",
                          "Maharashtra",
                          "Karnataka",
                          "Tamil Nadu",
                        ],
                        onItemSelected: (value) {},
                        getDisplayText: (value) => value,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                AlphaNumericTextfieldWidget(
                  onTextChanged: (value) {},
                  labelText: "Landmark (optional)",
                ),
                const SizedBox(height: 34),

                // Change button text dynamically
                SolidButtonWidget(
                  label: isEditMode ? "Update" : "Add",
                  onPressed: () {},
                  isCircle: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 22),
        ],
      ),
    );
  }
}
