import 'package:flutter/material.dart';

class Promotion {
  final String id;
  final String title;
  final String image;

  const Promotion({
    required this.id,
    required this.title,
    required this.image,
  });
}

class PromotionsSection extends StatelessWidget {
  final List<Promotion> promotions;

  const PromotionsSection({super.key, required this.promotions});

  Color _getPromotionColor(String id) {
    final colors = [
      Colors.blue[700]!,
      Colors.purple[700]!,
      Colors.orange[700]!,
      Colors.green[700]!,
    ];
    return colors[id.hashCode % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 16.0),
          child: Text(
            'PROMOTIONS',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ...promotions.map((promotion) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: _getPromotionColor(promotion.id),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      promotion.title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  if (promotion.image.isNotEmpty)
                    ClipRRect(
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(12),
                      ),
                      child: Image.network(
                        promotion.image,
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                ],
              ),
            ),
          );
        }).toList(),
      ],
    );
  }
}
