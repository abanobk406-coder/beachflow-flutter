import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/use_case/get_my_bookings_use_case.dart';
import 'package:por2/features/bookings/presentation/cubit/bookings_states.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';

@injectable
class BookingsViewModel extends Cubit<BookingsStates> {
  final GetMyBookingsUseCase getMyBookingsUseCase;

  BookingsViewModel({
    required this.getMyBookingsUseCase,
  }) : super(BookingsInitialState());

  Future<void> getMyBookings() async {
    emit(BookingsLoadingState());
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) {
        emit(BookingsErrorState(message: 'يرجى تسجيل الدخول أولاً'));
        return;
      }

      final bookings = await getMyBookingsUseCase.invoke('Bearer $token');
      emit(BookingsSuccessState(bookings: bookings));
    } on AppErrors catch (e) {
      emit(BookingsErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : (e.message ?? 'حدث خطأ في الاتصال بالخادم');
      emit(BookingsErrorState(message: message));
    } catch (e) {
      emit(BookingsErrorState(message: 'Unknown error: $e'));
    }
  }
}
