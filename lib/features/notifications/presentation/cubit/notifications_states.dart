import 'package:por2/domain/entities/response/notification_entity.dart';

abstract class NotificationsStates {}

class NotificationsInitialState extends NotificationsStates {}

class NotificationsLoadingState extends NotificationsStates {}

class NotificationsSuccessState extends NotificationsStates {
  final List<NotificationEntity> notifications;
  NotificationsSuccessState({required this.notifications});
}

class NotificationsErrorState extends NotificationsStates {
  final String message;
  NotificationsErrorState({required this.message});
}
