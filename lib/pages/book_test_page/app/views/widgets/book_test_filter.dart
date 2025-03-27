import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/floating_button__widget.dart';
import 'package:majestic_travel_solution/commons/components/buttons/app/solid_button_widget.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';
import 'package:majestic_travel_solution/commons/constants/app_icons.dart';

class BookTestFilter extends StatelessWidget {
  final List<String> categories;
  final Function(List<String>) onApply;

  BookTestFilter({
    super.key,
    required this.categories,
    required this.onApply,
  });

  final ValueNotifier<List<String>> selectedCategoriesNotifier =
      ValueNotifier([]);

  void _toggleSelection(String category) {
    final updatedCategories =
        List<String>.from(selectedCategoriesNotifier.value);
    if (updatedCategories.contains(category)) {
      updatedCategories.remove(category);
    } else {
      updatedCategories.add(category);
    }
    selectedCategoriesNotifier.value = updatedCategories;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FloatingButton(
                onPressed: () => context.pop(),
                iconPath: AppIcons.angleSmallRight,
                backgroundColor: AppColors.white,
                iconColor: AppColors.black,
                isDisabled: false,
                buttonSize: 42,
                iconSize: 20,
                isRotated: true,
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'Filter Category',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SizedBox(width: 42),
            ],
          ),
          const SizedBox(height: 29),
          ValueListenableBuilder<List<String>>(
            valueListenable: selectedCategoriesNotifier,
            builder: (context, selectedCategories, child) {
              return Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  final isSelected = selectedCategories.contains(category);
                  return GestureDetector(
                    onTap: () => _toggleSelection(category),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.teal : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.teal),
                      ),
                      child: Text(
                        category,
                        style: TextStyle(
                            color: isSelected ? Colors.white : Colors.teal,
                            fontWeight: FontWeight.w500,
                            fontSize: 12),
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 55),
          SolidButtonWidget(
            label: "Apply",
            onPressed: () {
              onApply(selectedCategoriesNotifier.value);
              context.pop();
            },
            isCircle: true,
          ),
        ],
      ),
    );
  }
}
