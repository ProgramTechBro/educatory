enum NotificationType {
  tutorArriving,
  sessionReminder,
  sessionCancelled,
  purchaseSuccess,
  specialOffer,
}

class NotificationTextSegment {
  final String text;
  final bool isBold;

  const NotificationTextSegment(this.text, {this.isBold = false});
}

class NotificationEntity {
  final String id;
  final NotificationType type;
  final String? avatarUrl;
  final List<NotificationTextSegment> message;
  final String timeAgo;
  final bool isRead;

  const NotificationEntity({
    required this.id,
    required this.type,
    this.avatarUrl,
    required this.message,
    required this.timeAgo,
    required this.isRead,
  });

  NotificationEntity copyWith({bool? isRead}) {
    return NotificationEntity(
      id: id,
      type: type,
      avatarUrl: avatarUrl,
      message: message,
      timeAgo: timeAgo,
      isRead: isRead ?? this.isRead,
    );
  }
}
