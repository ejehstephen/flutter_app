import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;

  const Category({
    required this.id,
    required this.title,
  });
}

class CategoriesSection extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onCategorySelected;
  final String? selectedCategoryId;

  const CategoriesSection({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    this.selectedCategoryId,
  });

  IconData _getCategoryIcon(String title) {
    final lowercaseTitle = title.toLowerCase();
    if (lowercaseTitle.contains('electronics')) return Icons.devices;
    if (lowercaseTitle.contains('jewelry')) return Icons.diamond;
    if (lowercaseTitle.contains('men')) return Icons.man;
    if (lowercaseTitle.contains('women')) return Icons.woman;
    return Icons.category;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Text(
            'CATEGORIES',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category.id == selectedCategoryId;
              
              return GestureDetector(
                onTap: () => onCategorySelected(category),
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blue[700] : Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(
                          _getCategoryIcon(category.title),
                          color: isSelected ? Colors.white : Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        category.title.split(' ')[0], // Just the first word
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.blue[700] : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
