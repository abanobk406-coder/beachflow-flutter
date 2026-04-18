import 'package:por2/domain/entities/response/notification_entity.dart';

abstract class NotificationsRepository {
  Future<List<NotificationEntity>> getMyNotifications(String token);
}
