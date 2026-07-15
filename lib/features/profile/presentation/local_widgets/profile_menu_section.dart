import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import 'profile_menu_item.dart';

class ProfileMenuSection extends StatelessWidget {
  final List<ProfileMenuItem> items;

  const ProfileMenuSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppColors.inputDropShadow,
      ),
      child: Column(
        children: [
          for (final item in items) ...[
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: item == items.last ? 0 : 12),
              decoration: item == items.last
                  ? null
                  : const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.neutral200),
                      ),
                    ),
              child: ProfileMenuRow(item: item),
            ),
            if (item != items.last) const SizedBox(height: 16),
          ],
        ],
      ),
    );
  }
}
