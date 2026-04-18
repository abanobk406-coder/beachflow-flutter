class NotificationEntity {
  final String id;
  final String title;
  final String body;
  final String createdAt;
  final bool isRead;

  NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.isRead,
  });
}
