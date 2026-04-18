import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/use_case/get_profile_use_case.dart';
import 'package:por2/domain/use_case/update_profile_use_case.dart';
import 'package:por2/features/profile/presentation/cubit/profile_states.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ProfileViewModel extends Cubit<ProfileStates> {
  final GetProfileUseCase getProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;

  ProfileViewModel({
    required this.getProfileUseCase,
    required this.updateProfileUseCase,
  }) : super(ProfileInitialState());

  Future<void> getProfile() async {
    emit(ProfileLoadingState());
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) {
        emit(ProfileErrorState(message: 'يرجى تسجيل الدخول أولاً'));
        return;
      }

      final user = await getProfileUseCase.invoke('Bearer $token');
      emit(ProfileSuccessState(user: user));
    } on AppErrors catch (e) {
      emit(ProfileErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : (e.message ?? 'حدث خطأ في الاتصال بالخادم');
      emit(ProfileErrorState(message: message));
    } catch (e) {
      emit(ProfileErrorState(message: 'حدث خطأ غير متوقع'));
    }
  }

  Future<void> updateProfile(String newName) async {
    emit(ProfileUpdateLoadingState());
    try {
      final token = await SharedPreferencesUtils.getToken(key: 'token');
      if (token == null) {
        emit(ProfileUpdateErrorState(message: 'يرجى تسجيل الدخول أولاً'));
        return;
      }

      final user = await updateProfileUseCase.invoke('Bearer $token', newName);
      emit(ProfileUpdateSuccessState(user: user));
      
      // Update local cache if needed or trigger a re-fetch
      // For now, SuccessState carries the updated user
    } on AppErrors catch (e) {
      emit(ProfileUpdateErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      final message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : (e.message ?? 'حدث خطأ في الاتصال بالخادم');
      emit(ProfileUpdateErrorState(message: message));
    } catch (e) {
      emit(ProfileUpdateErrorState(message: 'حدث خطأ غير متوقع'));
    }
  }

  Future<void> logout() async {
    await SharedPreferencesUtils.deleteToken(key: 'token');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    await prefs.remove('userName');
    await prefs.remove('userEmail');
    await prefs.remove('imageBase64');
    emit(ProfileInitialState());
  }
}
