import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../../../routes/app_routes.dart';

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
    final topPadding= MediaQuery.of(context).padding.top;
    final menuItems = [
      _DrawerMenuItem(
        icon: Icons.home_outlined,
        label: 'Home',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        icon: Icons.chat_bubble_outline,
        label: 'Messages',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        icon: Icons.list_alt_outlined,
        label: 'Tutor Bookings',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        icon: Icons.menu_book_outlined,
        label: 'My Courses',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        icon: Icons.star_outline,
        label: 'Rating & Reviews',
        onTap: () {
          context.pop();
          context.push(AppRoutes.reviews);
        },
      ),
      _DrawerMenuItem(
        icon: Icons.person_outline,
        label: 'Profile',
        onTap: () {
          context.pop();
          context.push(AppRoutes.profile);
        },
      ),
      _DrawerMenuItem(
        icon: Icons.logout,
        label: 'Log Out',
        onTap: () => context.go(AppRoutes.loginPhone),
      ),
    ];

    return Drawer(
      width: 275,
      backgroundColor: AppColors.white,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(24,16+topPadding, 24, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: AppNetworkImages.currentUserAvatar,
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
                    const RatingStars(rating: 4.5, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      '4.5',
                      style: AppTypography.bodySmallMedium.copyWith(
                        color: AppColors.neutral900,
                        fontSize: 14,
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
