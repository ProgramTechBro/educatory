import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/datasources/notifications_local_datasource.dart';
import 'notifications_event.dart';
import 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final NotificationsLocalDataSource dataSource;

  NotificationsBloc({required this.dataSource})
      : super(const NotificationsState()) {
    on<NotificationsStarted>(
      (event, emit) =>
          emit(state.copyWith(notifications: dataSource.getNotifications())),
    );
    on<NotificationsTabChanged>(
      (event, emit) =>
          emit(state.copyWith(showUnreadOnly: event.showUnreadOnly)),
    );
    on<NotificationMarkedRead>((event, emit) {
      emit(
        state.copyWith(
          notifications: [
            for (final notification in state.notifications)
              if (notification.id == event.id)
                notification.copyWith(isRead: true)
              else
                notification,
          ],
        ),
      );
    });
    on<NotificationsAllMarkedRead>((event, emit) {
      emit(
        state.copyWith(
          notifications: [
            for (final notification in state.notifications)
              notification.copyWith(isRead: true),
          ],
        ),
      );
    });
  }
}
