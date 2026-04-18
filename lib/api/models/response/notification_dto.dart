import 'package:json_annotation/json_annotation.dart';
import 'package:por2/domain/entities/response/notification_entity.dart';

part 'notification_dto.g.dart';

@JsonSerializable()
class NotificationDto {
  final int? id;
  final String? title;
  final String? body;
  final String? createdAt;
  final bool? isRead;

  NotificationDto({
    this.id,
    this.title,
    this.body,
    this.createdAt,
    this.isRead,
  });

  factory NotificationDto.fromJson(Map<String, dynamic> json) =>
      _$NotificationDtoFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationDtoToJson(this);

  NotificationEntity toEntity() {
    return NotificationEntity(
      id: id?.toString() ?? '',
      title: title ?? '',
      body: body ?? '',
      createdAt: createdAt ?? '',
      isRead: isRead ?? false,
    );
  }
}
