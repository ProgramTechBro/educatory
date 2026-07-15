import 'package:equatable/equatable.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationsState extends Equatable {
  final List<NotificationEntity> notifications;
  final bool showUnreadOnly;

  const NotificationsState({
    this.notifications = const [],
    this.showUnreadOnly = false,
  });

  List<NotificationEntity> get visibleNotifications => showUnreadOnly
      ? notifications.where((n) => !n.isRead).toList()
      : notifications;

  NotificationsState copyWith({
    List<NotificationEntity>? notifications,
    bool? showUnreadOnly,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      showUnreadOnly: showUnreadOnly ?? this.showUnreadOnly,
    );
  }

  @override
  List<Object?> get props => [notifications, showUnreadOnly];
}
