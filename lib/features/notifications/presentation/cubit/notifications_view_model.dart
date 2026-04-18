import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/use_case/get_notifications_use_case.dart';
import 'package:por2/features/notifications/presentation/cubit/notifications_states.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';

@injectable
class NotificationsViewModel extends Cubit<NotificationsStates> {
  final GetNotificationsUseCase getNotificationsUseCase;

  NotificationsViewModel({
    required this.getNotificationsUseCase,
  }) : super(NotificationsInitialState());

  Future<void> getNotifications() async {
    emit(NotificationsLoadingState());
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) {
        emit(NotificationsErrorState(message: 'يرجى تسجيل الدخول أولاً'));
        return;
      }

      final notifications = await getNotificationsUseCase.invoke('Bearer $token');
      emit(NotificationsSuccessState(notifications: notifications));
    } on AppErrors catch (e) {
      emit(NotificationsErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : (e.message ?? 'حدث خطأ في الاتصال');
      emit(NotificationsErrorState(message: message));
    } catch (e) {
      emit(NotificationsErrorState(message: 'حدث خطأ غير متوقع'));
    }
  }
}
