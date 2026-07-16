import 'package:flutter/material.dart';
import '../../../../config/app_colors.dart';
import '../../../../config/app_typography.dart';
import '../../../../core/shared_widgets/network_avatar.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationTile extends StatelessWidget {
  final NotificationEntity notification;
  final VoidCallback onTap;

  const NotificationTile({
    super.key,
    required this.notification,
    required this.onTap,
  });

  ({IconData icon, Color background, Color foreground}) get _iconStyle {
    switch (notification.type) {
      case NotificationType.tutorArriving:
        return (
          icon: Icons.person,
          background: AppColors.neutral200,
          foreground: AppColors.neutral500,
        );
      case NotificationType.sessionReminder:
        return (
          icon: Icons.access_time_filled,
          background: AppColors.blue100,
          foreground: AppColors.primary,
        );
      case NotificationType.sessionCancelled:
        return (
          icon: Icons.close,
          background: AppColors.red100,
          foreground: AppColors.red500,
        );
      case NotificationType.purchaseSuccess:
        return (
          icon: Icons.check,
          background: AppColors.green100,
          foreground: AppColors.green500,
        );
      case NotificationType.specialOffer:
        return (
          icon: Icons.local_offer,
          background: AppColors.purple100,
          foreground: AppColors.accent,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final iconStyle = _iconStyle;

    return InkWell(
      onTap: onTap,
      child: Container(
        color: notification.isRead ? null : AppColors.purple100.withOpacity(0.15),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            notification.avatarUrl != null
                ? NetworkAvatar(imageUrl: notification.avatarUrl, size: 32)
                : Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      color: iconStyle.background,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      iconStyle.icon,
                      size: 18,
                      color: iconStyle.foreground,
                    ),
                  ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: AppTypography.bodyLargeRegular.copyWith(
                        color: AppColors.neutral700,
                      ),
                      children: [
                        for (final segment in notification.message)
                          TextSpan(
                            text: segment.text,
                            style: segment.isBold
                                ? AppTypography.bodyLargeMedium.copyWith(
                                    color: AppColors.neutral900,
                                  )
                                : null,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    notification.timeAgo,
                    style: AppTypography.bodySmallRegular.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
