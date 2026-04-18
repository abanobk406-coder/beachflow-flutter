import 'package:injectable/injectable.dart';
import 'package:por2/api/data_sources/remote/notifications_remote_data_source.dart';
import 'package:por2/domain/entities/response/notification_entity.dart';
import 'package:por2/domain/repositories/notifications_repository.dart';

@Injectable(as: NotificationsRepository)
class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource notificationsRemoteDataSource;

  NotificationsRepositoryImpl({required this.notificationsRemoteDataSource});

  @override
  Future<List<NotificationEntity>> getMyNotifications(String token) async {
    final dtos = await notificationsRemoteDataSource.getMyNotifications(token);
    return dtos.map((dto) => dto.toEntity()).toList();
  }
}
