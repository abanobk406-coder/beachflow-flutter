import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:por2/domain/entities/response/notification_entity.dart';
import 'package:por2/features/notifications/presentation/cubit/notifications_states.dart';
import 'package:por2/features/notifications/presentation/cubit/notifications_view_model.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<NotificationsViewModel>()..getNotifications(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF2F2F7),
        appBar: AppBar(
          backgroundColor: const Color(0xFFF2F2F7),
          elevation: 0,
          title: const Text(
            'التنبيهات',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: BlocBuilder<NotificationsViewModel, NotificationsStates>(
            builder: (context, state) {
              if (state is NotificationsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NotificationsErrorState) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message, style: const TextStyle(color: Colors.red)),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () => context.read<NotificationsViewModel>().getNotifications(),
                        child: const Text('إعادة المحاولة'),
                      ),
                    ],
                  ),
                );
              } else if (state is NotificationsSuccessState) {
                if (state.notifications.isEmpty) {
                  return const Center(
                    child: Text(
                      'لا توجد تنبيهات حالياً',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: state.notifications.length,
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final notification = state.notifications[index];
                    return _NotificationCard(notification: notification);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

class _NotificationCard extends StatelessWidget {
  final NotificationEntity notification;

  const _NotificationCard({required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: notification.isRead ? Colors.white : const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  notification.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              if (!notification.isRead)
                const CircleAvatar(radius: 4, backgroundColor: Colors.blue),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            notification.body,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              notification.createdAt,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
