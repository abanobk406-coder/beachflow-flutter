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
import '../api/data_sources/remote/forget_password_remote_data_source_impl.dart'
    as _i273;
import '../api/data_sources/remote/login_remote_data_source_impl.dart' as _i524;
import '../api/data_sources/remote/reset_code_remote_data_source_impl.dart'
    as _i524;
import '../api/data_sources/remote/reset_password_remote_data_source_impl.dart'
    as _i49;
import '../api/dio/dio_module.dart' as _i223;
import '../data/data_sources/remote/forget_password_remote_data_source.dart'
    as _i144;
import '../data/data_sources/remote/login_remote_data_source.dart' as _i166;
import '../data/data_sources/remote/reset_code_resmot_data_source.dart'
    as _i753;
import '../data/data_sources/remote/reset_password_remote_data_source.dart'
    as _i825;
import '../data/repositories/forget_password_repository_impl.dart' as _i924;
import '../data/repositories/login_repository_impl.dart' as _i741;
import '../data/repositories/reset_code_repository_impl.dart' as _i95;
import '../data/repositories/reset_password_repository_impl.dart' as _i452;
import '../domain/repositories/forget_password_repository.dart' as _i1053;
import '../domain/repositories/login_repository.dart' as _i907;
import '../domain/repositories/reset_code_repository.dart' as _i714;
import '../domain/repositories/reset_password_repository.dart' as _i482;
import '../domain/use_case/forget_password_use_case.dart' as _i349;
import '../domain/use_case/login_use_case.dart' as _i772;
import '../domain/use_case/reset_code_use_case.dart' as _i876;
import '../domain/use_case/reset_password_use_case.dart' as _i276;
import '../features/auth/presentation/screens/forget_password/cubit/forget_password_view_model.dart'
    as _i368;
import '../features/auth/presentation/screens/new_password/cubit/new_password_view_model.dart'
    as _i252;
import '../features/auth/presentation/screens/reset_code/cubit/reset_code_view_model.dart'
    as _i902;
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
    gh.factory<_i166.LoginRemoteDataSource>(
      () =>
          _i524.LoginRemoteDataSourceImpl(apiServices: gh<_i124.ApiServices>()),
    );
    gh.factory<_i825.ResetPasswordRemoteDataSource>(
      () => _i49.ResetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i753.ResetCodeResmotDataSource>(
      () => _i524.ResetCodeRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i144.ForgetPasswordRemoteDataSource>(
      () => _i273.ForgetPasswordRemoteDataSourceImpl(
        apiServices: gh<_i124.ApiServices>(),
      ),
    );
    gh.factory<_i714.ResetCodeRepository>(
      () => _i95.ResetCodeRepositoryImpl(
        resetCodeResmotDataSource: gh<_i753.ResetCodeResmotDataSource>(),
      ),
    );
    gh.factory<_i876.ResetCodeUseCase>(
      () => _i876.ResetCodeUseCase(
        resetCodeRepository: gh<_i714.ResetCodeRepository>(),
      ),
    );
    gh.factory<_i902.ResetCodeViewModel>(
      () => _i902.ResetCodeViewModel(
        resetCodeUseCase: gh<_i876.ResetCodeUseCase>(),
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
    gh.factory<_i349.ForgetPasswordUseCase>(
      () => _i349.ForgetPasswordUseCase(
        forgetPasswordRepository: gh<_i1053.ForgetPasswordRepository>(),
      ),
    );
    gh.factory<_i772.LoginUseCase>(
      () => _i772.LoginUseCase(loginRepository: gh<_i907.LoginRepository>()),
    );
    gh.factory<_i276.ResetPasswordUseCase>(
      () => _i276.ResetPasswordUseCase(
        resetPasswordRepository: gh<_i482.ResetPasswordRepository>(),
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
    return this;
  }
}

class _$GetItModule extends _i223.GetItModule {}
