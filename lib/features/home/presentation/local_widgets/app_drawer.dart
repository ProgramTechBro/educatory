import 'package:flutter/material.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';

class _DrawerMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.icon,
    required this.label,
    required this.onTap,
  });
}

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      _DrawerMenuItem(icon: Icons.home_outlined, label: 'Home', onTap: () {}),
      _DrawerMenuItem(
        icon: Icons.chat_bubble_outline,
        label: 'Messages',
        onTap: () {},
      ),
      _DrawerMenuItem(
        icon: Icons.list_alt_outlined,
        label: 'Tutor Bookings',
        onTap: () {},
      ),
      _DrawerMenuItem(
        icon: Icons.menu_book_outlined,
        label: 'My Courses',
        onTap: () {},
      ),
      _DrawerMenuItem(
        icon: Icons.star_outline,
        label: 'Rating & Reviews',
        onTap: () {},
      ),
      _DrawerMenuItem(
        icon: Icons.person_outline,
        label: 'Profile',
        onTap: () {},
      ),
      _DrawerMenuItem(icon: Icons.logout, label: 'Log Out', onTap: () {}),
    ];

    return Drawer(
      width: 275,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    AppImages.tutorMuhammad,
                    width: 72,
                    height: 72,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12),
                Text('Muhammad Shahin', style: AppTypography.h3SemiBold),
                Text(
                  '880 1777395216',
                  style: AppTypography.bodyLargeRegular.copyWith(
                    color: AppColors.neutral500,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Row(
                      children: List.generate(4, (index) {
                        return const Padding(
                          padding: EdgeInsets.only(right: 4),
                          child: Icon(
                            Icons.star,
                            size: 12,
                            color: AppColors.orange500,
                          ),
                        );
                      }),
                    ),
                    const Icon(
                      Icons.star_half,
                      size: 12,
                      color: AppColors.orange500,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '4.5',
                      style: AppTypography.bodySmallMedium.copyWith(
                        color: AppColors.neutral900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              color: AppColors.neutral900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (final item in menuItems) ...[
                    InkWell(
                      onTap: item.onTap,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(item.icon, size: 20, color: AppColors.white),
                          const SizedBox(width: 12),
                          Text(
                            item.label,
                            style: AppTypography.bodyLargeMedium.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (item != menuItems.last) const SizedBox(height: 24),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
