// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../api/api_services.dart' as _i124;
import '../api/data_sources/remote/bookings_remote_data_source.dart' as _i499;
import '../api/data_sources/remote/bookings_remote_data_source_impl.dart'
    as _i154;
import '../api/data_sources/remote/favorites_remote_data_source.dart' as _i99;
import '../api/data_sources/remote/favorites_remote_data_source_impl.dart'
    as _i8;
import '../api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i273;
import '../api/data_sources/remote/login_remote_data_source_impl.dart' as _i524;
import '../api/data_sources/remote/notifications_remote_data_source.dart'
    as _i854;
import '../api/data_sources/remote/notifications_remote_data_source_impl.dart'
    as _i395;
import '../api/data_sources/remote/profile_remote_data_source.dart' as _i748;
import '../api/data_sources/remote/profile_remote_data_source_impl.dart'
    as _i447;
import '../api/data_sources/remote/resend_otp_remote_data_source_impl.dart'
    as _i642;
import '../api/data_sources/remote/reset_code_remote_data_source_impl.dart'
    as _i524;
import '../api/data_sources/remote/reset_password_remote_data_source_impl.dart'
    as _i49;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i144;
import '../data/data_sources/remote/login_remote_data_source.dart' as _i166;
import '../data/data_sources/remote/resend_otp_remote_data_source.dart' as _i51;
import '../data/data_sources/remote/reset_code_resmot_data_source.dart'
    as _i753;
import '../data/data_sources/remote/reset_password_remote_data_source.dart'
    as _i825;
import '../data/repositories/bookings_repository_impl.dart' as _i197;
import '../data/repositories/favorites_repository_impl.dart' as _i243;
import '../data/repositories/forget_password_repository_impl.dart' as _i924;
import '../data/repositories/login_repository_impl.dart' as _i741;
import '../data/repositories/notifications_repository_impl.dart' as _i935;
import '../data/repositories/profile_repository_impl.dart' as _i953;
import '../data/repositories/resend_otp_repository_impl.dart' as _i963;
import '../data/repositories/reset_code_repository_impl.dart' as _i95;
import '../data/repositories/reset_password_repository_impl.dart' as _i452;
import '../domain/repositories/bookings_repository.dart' as _i663;
import '../domain/repositories/favorites_repository.dart' as _i187;
import '../domain/repositories/forget_password_repository.dart' as _i1053;
import '../domain/repositories/login_repository.dart' as _i907;
import '../domain/repositories/notifications_repository.dart' as _i246;
import '../domain/repositories/profile_repository.dart' as _i217;
import '../domain/repositories/resent_otp_repository.dart' as _i875;
import '../domain/repositories/reset_code_repository.dart' as _i714;
import '../domain/repositories/reset_password_repository.dart' as _i482;
import '../domain/use_case/forget_password_use_case.dart' as _i349;
import '../domain/use_case/get_favorites_use_case.dart' as _i157;
import '../domain/use_case/get_my_bookings_use_case.dart' as _i284;
import '../domain/use_case/get_notifications_use_case.dart' as _i745;
import '../domain/use_case/get_profile_use_case.dart' as _i673;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/resend_otp_use_case.dart' as _i1005;
import '../domain/use_case/reset_code_use_case.dart' as _i876;
import '../domain/use_case/reset_password_use_case.dart' as _i276;
import '../domain/use_case/toggle_favorite_use_case.dart' as _i580;
import '../domain/use_case/update_profile_use_case.dart' as _i858;
import '../features/admin_request/data/datasources/admin_request_remote_data_source.dart'
    as _i548;
import '../features/admin_request/data/repositories/admin_request_repository_impl.dart'
    as _i458;
import '../features/admin_request/domain/repositories/admin_request_repository.dart'
    as _i739;
import '../features/admin_request/domain/usecases/submit_admin_request_use_case.dart'
    as _i321;
import '../features/admin_request/presentation/view_models/admin_request_cubit.dart'
    as _i138;
import '../features/auth/presentation/screens/forget_password/cubit/forget_password_view_model.dart'
    as _i368;
import '../features/auth/presentation/screens/new_password/cubit/new_password_view_model.dart'
    as _i252;
import '../features/auth/presentation/screens/reset_code/cubit/reset_code_view_model.dart'
    as _i902;
import '../features/bookings/presentation/cubit/bookings_view_model.dart'
    as _i127;
import '../features/favorites/presentation/cubit/favorites_view_model.dart'
    as _i925;
import '../features/notifications/presentation/cubit/notifications_view_model.dart'
    as _i849;
import '../features/profile/presentation/cubit/profile_view_model.dart'
    as _i883;
import '../login/cubit/login_view_model.dart' as _i1050;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final getItModule = _$GetItModule();
    gh.singleton<_i361.BaseOptions>(() => getItModule.provideBaseOptions());
    gh.singleton<_i528.PrettyDioLogger>(
      () => getItModule.providePrettyDioLogger(),
    );
    gh.singleton<_i361.Dio>(
      () => getItModule.provideDio(
        gh<_i361.BaseOptions>(),
        gh<_i528.PrettyDioLogger>(),
      ),
    );
    gh.singleton<_i124.ApiServices>(
      () => getItModule.provideApiServices(gh<_i361.Dio>()),
    );
    gh.factory<_i499.BookingsRemoteDataSource>(
      () => _i154.BookingsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i748.ProfileRemoteDataSource>(
      () => _i447.ProfileRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i166.LoginRemoteDataSource>(
      () =>
          _i524.LoginRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i825.ResetPasswordRemoteDataSource>(
      () => _i49.ResetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.lazySingleton<_i548.AdminRequestRemoteDataSource>(
      () => _i548.AdminRequestRemoteDataSourceImpl(gh<_i124.ApiServices>()),
    );
    gh.factory<_i753.ResetCodeResmotDataSource>(
      () => _i524.ResetCodeRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.lazySingleton<_i739.AdminRequestRepository>(
      () => _i458.AdminRequestRepositoryImpl(
        gh<_i548.AdminRequestRemoteDataSource>(),
      ),
    );
    gh.factory<_i99.FavoritesRemoteDataSource>(
      () => _i8.FavoritesRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i854.NotificationsRemoteDataSource>(
      () => _i395.NotificationsRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i144.ForgetPasswordRemoteDataSource>(
      () => _i273.ForgetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i51.ResendOtpRemoteDataSource>(
      () => _i642.ResendOtpRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i714.ResetCodeRepository>(
      () => _i95.ResetCodeRepositoryImpl(
        resetCodeResmotDataSource: gh<_i753.ResetCodeResmotDataSource>(),
      ),
    );
    gh.factory<_i246.NotificationsRepository>(
      () => _i935.NotificationsRepositoryImpl(
        notificationsRemoteDataSource:
            gh<_i854.NotificationsRemoteDataSource>(),
      ),
    );
    gh.factory<_i875.ResentOtpRepository>(
      () => _i963.ResendOtpRepositoryImpl(
        resendOtpRemoteDataSource: gh<_i51.ResendOtpRemoteDataSource>(),
      ),
    );
    gh.factory<_i876.ResetCodeUseCase>(
      () => _i876.ResetCodeUseCase(
        resetCodeRepository: gh<_i714.ResetCodeRepository>(),
      ),
    );
    gh.lazySingleton<_i321.SubmitAdminRequestUseCase>(
      () => _i321.SubmitAdminRequestUseCase(gh<_i739.AdminRequestRepository>()),
    );
    gh.factory<_i217.ProfileRepository>(
      () => _i953.ProfileRepositoryImpl(
        profileRemoteDataSource: gh<_i748.ProfileRemoteDataSource>(),
      ),
    );
    gh.factory<_i1053.ForgetPasswordRepository>(
      () => _i924.ForgetPasswordRepositoryImpl(
        forgetPasswordRemoteDataSource:
            gh<_i144.ForgetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i907.LoginRepository>(
      () => _i741.LoginRepositoryImpl(
        loginRemoteDataSource: gh<_i166.LoginRemoteDataSource>(),
      ),
    );
    gh.factory<_i482.ResetPasswordRepository>(
      () => _i452.ResetPasswordRepositoryImpl(
        resetPasswordRemoteDataSource:
            gh<_i825.ResetPasswordRemoteDataSource>(),
      ),
    );
    gh.factory<_i187.FavoritesRepository>(
      () => _i243.FavoritesRepositoryImpl(
        favoritesRemoteDataSource: gh<_i99.FavoritesRemoteDataSource>(),
      ),
    );
    gh.factory<_i663.BookingsRepository>(
      () => _i197.BookingsRepositoryImpl(
        bookingsRemoteDataSource: gh<_i499.BookingsRemoteDataSource>(),
      ),
    );
    gh.factory<_i1005.ResendOtpUseCase>(
      () => _i1005.ResendOtpUseCase(
        resentOtpRepository: gh<_i875.ResentOtpRepository>(),
      ),
    );
    gh.factory<_i157.GetFavoritesUseCase>(
      () => _i157.GetFavoritesUseCase(
        repository: gh<_i187.FavoritesRepository>(),
      ),
    );
    gh.factory<_i580.ToggleFavoriteUseCase>(
      () => _i580.ToggleFavoriteUseCase(
        repository: gh<_i187.FavoritesRepository>(),
      ),
    );
    gh.factory<_i349.ForgetPasswordUseCase>(
      () => _i349.ForgetPasswordUseCase(
        forgetPasswordRepository: gh<_i1053.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(loginRepository: gh<_i907.LoginRepository>()),
    );
    gh.factory<_i745.GetNotificationsUseCase>(
      () => _i745.GetNotificationsUseCase(
        repository: gh<_i246.NotificationsRepository>(),
      ),
    );
    gh.factory<_i138.AdminRequestCubit>(
      () => _i138.AdminRequestCubit(gh<_i321.SubmitAdminRequestUseCase>()),
    );
    gh.factory<_i925.FavoritesViewModel>(
      () => _i925.FavoritesViewModel(
        getFavoritesUseCase: gh<_i157.GetFavoritesUseCase>(),
        toggleFavoriteUseCase: gh<_i580.ToggleFavoriteUseCase>(),
      ),
    );
    gh.factory<_i902.ResetCodeViewModel>(
      () => _i902.ResetCodeViewModel(
        resetCodeUseCase: gh<_i876.ResetCodeUseCase>(),
        resendOtpUseCase: gh<_i1005.ResendOtpUseCase>(),
      ),
    );
    gh.factory<_i276.ResetPasswordUseCase>(
      () => _i276.ResetPasswordUseCase(
        resetPasswordRepository: gh<_i482.ResetPasswordRepository>(),
      ),
    );
    gh.factory<_i284.GetMyBookingsUseCase>(
      () => _i284.GetMyBookingsUseCase(
        repository: gh<_i663.BookingsRepository>(),
      ),
    );
    gh.factory<_i673.GetProfileUseCase>(
      () => _i673.GetProfileUseCase(
        profileRepository: gh<_i217.ProfileRepository>(),
      ),
    );
    gh.factory<_i858.UpdateProfileUseCase>(
      () => _i858.UpdateProfileUseCase(
        profileRepository: gh<_i217.ProfileRepository>(),
      ),
    );
    gh.factory<_i368.ForgetPasswordViewModel>(
      () => _i368.ForgetPasswordViewModel(
        forgetPasswordUseCase: gh<_i349.ForgetPasswordUseCase>(),
      ),
    );
    gh.factory<_i1050.LoginViewModel>(
      () => _i1050.LoginViewModel(loginUseCase: gh<_i772.LoginUseCase>()),
    );
    gh.factory<_i252.NewPasswordViewModel>(
      () => _i252.NewPasswordViewModel(
        resetPasswordUseCase: gh<_i276.ResetPasswordUseCase>(),
      ),
    );
    gh.factory<_i849.NotificationsViewModel>(
      () => _i849.NotificationsViewModel(
        getNotificationsUseCase: gh<_i745.GetNotificationsUseCase>(),
      ),
    );
    gh.factory<_i127.BookingsViewModel>(
      () => _i127.BookingsViewModel(
        getMyBookingsUseCase: gh<_i284.GetMyBookingsUseCase>(),
      ),
    );
    gh.factory<_i883.ProfileViewModel>(
      () => _i883.ProfileViewModel(
        getProfileUseCase: gh<_i673.GetProfileUseCase>(),
        updateProfileUseCase: gh<_i858.UpdateProfileUseCase>(),
      ),
    );
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
