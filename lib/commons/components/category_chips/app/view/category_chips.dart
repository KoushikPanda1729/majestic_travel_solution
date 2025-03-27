import 'package:flutter/material.dart';
import 'package:majestic_travel_solution/commons/constants/app_colors.dart';

class CategoryChips extends StatelessWidget {
  final List<String> categories;
  final ValueNotifier<String?> selectedCategoryNotifier;
  final ValueChanged<String>? onSelected;

  CategoryChips({
    super.key,
    required this.categories,
    this.onSelected,
    String? initialCategory,
  }) : selectedCategoryNotifier = ValueNotifier<String?>(initialCategory);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: selectedCategoryNotifier,
      builder: (context, selectedCategory, child) {
        return Wrap(
          spacing: 6.0,
          runSpacing: 6.0,
          children: categories.map((category) {
            final bool isSelected = selectedCategory == category;

            return GestureDetector(
              onTap: () {
                selectedCategoryNotifier.value = isSelected ? null : category;
                onSelected?.call(category);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? const Color(0xFFD1EDEB) : AppColors.white,
                  border: Border.all(color: AppColors.teal),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  category,
                  style: TextStyle(
                      color: isSelected ? AppColors.black : AppColors.teal,
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                ),
              ),
            );
          }).toList(),
        );
      },
    );
  }
}
