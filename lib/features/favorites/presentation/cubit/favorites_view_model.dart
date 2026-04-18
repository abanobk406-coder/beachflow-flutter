import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/use_case/get_favorites_use_case.dart';
import 'package:por2/domain/use_case/toggle_favorite_use_case.dart';
import 'package:por2/features/favorites/presentation/cubit/favorites_states.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';

@injectable
class FavoritesViewModel extends Cubit<FavoritesStates> {
  final GetFavoritesUseCase getFavoritesUseCase;
  final ToggleFavoriteUseCase toggleFavoriteUseCase;

  FavoritesViewModel({
    required this.getFavoritesUseCase,
    required this.toggleFavoriteUseCase,
  }) : super(FavoritesInitialState());

  Future<void> getFavorites() async {
    emit(FavoritesLoadingState());
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) {
        emit(FavoritesErrorState(message: 'يرجى تسجيل الدخول أولاً'));
        return;
      }

      final favorites = await getFavoritesUseCase.invoke('Bearer $token');
      emit(FavoritesSuccessState(favorites: favorites));
    } on AppErrors catch (e) {
      emit(FavoritesErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : (e.message ?? 'حدث خطأ في الاتصال');
      emit(FavoritesErrorState(message: message));
    } catch (e) {
      emit(FavoritesErrorState(message: 'حدث خطأ غير متوقع'));
    }
  }

  Future<void> toggleFavorite(String beachId) async {
    // Note: We might want a separate state for toggle to show loading on specific item
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) return;

      await toggleFavoriteUseCase.invoke('Bearer $token', beachId);
      // Refresh the list after toggle
      getFavorites();
    } catch (e) {
      // Handle error gracefully
    }
  }
}
