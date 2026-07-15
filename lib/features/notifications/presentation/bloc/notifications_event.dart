import 'package:equatable/equatable.dart';

abstract class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

class NotificationsStarted extends NotificationsEvent {
  const NotificationsStarted();
}

class NotificationsTabChanged extends NotificationsEvent {
  final bool showUnreadOnly;
  const NotificationsTabChanged(this.showUnreadOnly);

  @override
  List<Object?> get props => [showUnreadOnly];
}

class NotificationMarkedRead extends NotificationsEvent {
  final String id;
  const NotificationMarkedRead(this.id);

  @override
  List<Object?> get props => [id];
}

class NotificationsAllMarkedRead extends NotificationsEvent {
  const NotificationsAllMarkedRead();
}
