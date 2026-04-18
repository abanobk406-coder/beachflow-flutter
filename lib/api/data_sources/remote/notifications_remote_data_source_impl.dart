import 'package:injectable/injectable.dart';
import 'package:por2/api/api_services.dart';
import 'package:por2/api/data_sources/remote/notifications_remote_data_source.dart';
import 'package:por2/api/models/response/notification_dto.dart';

@Injectable(as: NotificationsRemoteDataSource)
class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final ApiServices apiServices;

  NotificationsRemoteDataSourceImpl({required this.apiServices});

  @override
  Future<List<NotificationDto>> getMyNotifications(String token) {
    return apiServices.getMyNotifications(token);
  }
}
