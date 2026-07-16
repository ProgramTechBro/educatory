import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/app_assets.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../../../core/shared_widgets/rating_stars.dart';
import '../../../../routes/app_routes.dart';

class _DrawerMenuItem {
  final String iconAsset;
  final String label;
  final VoidCallback onTap;

  const _DrawerMenuItem({
    required this.iconAsset,
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
        iconAsset: AppIcons.drawerHome,
        label: 'Home',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerMessages,
        label: 'Messages',
        onTap: () {
          context.pop();
          context.push(AppRoutes.contactList);
        },
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerTutorBooking,
        label: 'Tutor Bookings',
        onTap: () => context.pop(),
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerCourses,
        label: 'My Courses',
        onTap: () {
          context.pop();
          context.push(AppRoutes.myCourses);
        },
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerRating,
        label: 'Rating & Reviews',
        onTap: () {
          context.pop();
          context.push(AppRoutes.reviews);
        },
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerProfile,
        label: 'Profile',
        onTap: () {
          context.pop();
          context.push(AppRoutes.profile);
        },
      ),
      _DrawerMenuItem(
        iconAsset: AppIcons.drawerLogout,
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
                NetworkAvatar(
                  imageUrl: AppNetworkImages.currentUserAvatar,
                  size: 72,
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
                          SvgPicture.asset(
                            item.iconAsset,
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              AppColors.white,
                              BlendMode.srcIn,
                            ),
                          ),
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
