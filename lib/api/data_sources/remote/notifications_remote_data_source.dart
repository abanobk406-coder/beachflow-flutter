import 'package:por2/api/models/response/notification_dto.dart';

abstract class NotificationsRemoteDataSource {
  Future<List<NotificationDto>> getMyNotifications(String token);
}
