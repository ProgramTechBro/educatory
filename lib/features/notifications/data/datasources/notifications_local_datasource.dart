import '../../../../config/app_assets.dart';
import '../../domain/entities/notification_entity.dart';

class NotificationsLocalDataSource {
  List<NotificationEntity> getNotifications() {
    return [
      NotificationEntity(
        id: '1',
        type: NotificationType.tutorArriving,
        avatarUrl: AppNetworkImages.tutorAlbert,
        message: const [
          NotificationTextSegment('Robert Fox', isBold: true),
          NotificationTextSegment(
            ' is coming to your selected place for the session',
          ),
        ],
        timeAgo: '6h ago',
        isRead: false,
      ),
      NotificationEntity(
        id: '2',
        type: NotificationType.sessionReminder,
        message: const [
          NotificationTextSegment('Your live session with '),
          NotificationTextSegment('Robert Fox', isBold: true),
          NotificationTextSegment(' starts in 30 minutes. Get ready!'),
        ],
        timeAgo: 'Monday 12:18am',
        isRead: false,
      ),
      NotificationEntity(
        id: '3',
        type: NotificationType.sessionCancelled,
        message: const [
          NotificationTextSegment('Your session with '),
          NotificationTextSegment('Robert Fox', isBold: true),
          NotificationTextSegment(
            ' on 01 Jul, 12:00-1:00 has been cancelled',
          ),
        ],
        timeAgo: '1w ago',
        isRead: true,
      ),
      NotificationEntity(
        id: '4',
        type: NotificationType.purchaseSuccess,
        message: const [
          NotificationTextSegment(
            'You have successfully purchased the course ',
          ),
          NotificationTextSegment('Problem solving strategies', isBold: true),
          NotificationTextSegment(' Start learning now'),
        ],
        timeAgo: '19d ago',
        isRead: true,
      ),
      NotificationEntity(
        id: '5',
        type: NotificationType.specialOffer,
        message: const [
          NotificationTextSegment('Special Offer! Get 20% off on '),
          NotificationTextSegment('Problem solving strategies', isBold: true),
          NotificationTextSegment(' Limited time only!'),
        ],
        timeAgo: '1m ago',
        isRead: true,
      ),
    ];
  }
}
