import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../config/app_colors.dart';
import '../../../config/app_typography.dart';
import '../data/datasources/notifications_local_datasource.dart';
import 'bloc/notifications_bloc.dart';
import 'bloc/notifications_event.dart';
import 'bloc/notifications_state.dart';
import 'local_widgets/notification_segment_toggle.dart';
import 'local_widgets/notification_tile.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(
        dataSource: NotificationsLocalDataSource(),
      )..add(const NotificationsStarted()),
      child: const _NotificationsScreenBody(),
    );
  }
}

class _NotificationsScreenBody extends StatelessWidget {
  const _NotificationsScreenBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(
            Icons.chevron_left,
            size: 24,
            color: AppColors.neutral900,
          ),
        ),
        title: Text(
          'Notifications',
          style: AppTypography.h4Medium.copyWith(fontWeight: FontWeight.w400),
        ),
      ),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Notifications', style: AppTypography.h3SemiBold),
                    InkWell(
                      onTap: () => context
                          .read<NotificationsBloc>()
                          .add(const NotificationsAllMarkedRead()),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.done_all,
                            size: 20,
                            color: AppColors.neutral600,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Mark all as read',
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
              NotificationSegmentToggle(
                showUnreadOnly: state.showUnreadOnly,
                onChanged: (value) => context
                    .read<NotificationsBloc>()
                    .add(NotificationsTabChanged(value)),
              ),
              Expanded(
                child: Container(
                  color: AppColors.white,
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemCount: state.visibleNotifications.length,
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 12,
                      ),
                      child: Divider(height: 1, color: AppColors.neutral200),
                    ),
                    itemBuilder: (context, index) {
                      final notification = state.visibleNotifications[index];
                      return NotificationTile(
                        notification: notification,
                        onTap: () => context
                            .read<NotificationsBloc>()
                            .add(NotificationMarkedRead(notification.id)),
                      );
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
