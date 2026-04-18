import 'package:injectable/injectable.dart';
import 'package:por2/domain/entities/response/notification_entity.dart';
import 'package:por2/domain/repositories/notifications_repository.dart';

@injectable
class GetNotificationsUseCase {
  final NotificationsRepository repository;

  GetNotificationsUseCase({required this.repository});

  Future<List<NotificationEntity>> invoke(String token) {
    return repository.getMyNotifications(token);
  }
}
