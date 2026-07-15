import 'package:flutter/material.dart';
import '../../config/app_colors.dart';

class RatingStars extends StatelessWidget {
  final double rating;
  final double size;
  final double gap;
  final Color color;

  const RatingStars({
    super.key,
    required this.rating,
    this.size = 12,
    this.gap = 4,
    this.color = AppColors.orange500,
  });

  @override
  Widget build(BuildContext context) {
    final double rounded = (rating * 2).round() / 2;
    final int fullStars = rounded.floor();
    final bool hasHalfStar = rounded - fullStars == 0.5;
    final int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    final icons = [
      ...List.filled(fullStars, Icons.star),
      if (hasHalfStar) Icons.star_half,
      ...List.filled(emptyStars, Icons.star_border),
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < icons.length; i++) ...[
          if (i > 0) SizedBox(width: gap),
          Icon(icons[i], size: size, color: color),
        ],
      ],
    );
  }
}
