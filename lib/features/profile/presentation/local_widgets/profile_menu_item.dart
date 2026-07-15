import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class ProfileMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool showChevron;

  const ProfileMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
    this.showChevron = true,
  });
}

class ProfileMenuRow extends StatelessWidget {
  final ProfileMenuItem item;

  const ProfileMenuRow({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: item.onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(item.icon, size: 20, color: AppColors.neutral700),
              const SizedBox(width: 8),
              Text(
                item.label,
                style: AppTypography.bodyLargeRegular.copyWith(
                  color: AppColors.neutral700,
                ),
              ),
            ],
          ),
          if (item.showChevron)
            const Icon(
              Icons.chevron_right,
              size: 20,
              color: AppColors.neutral700,
            ),
        ],
      ),
    );
  }
}
