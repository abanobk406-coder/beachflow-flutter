import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/entities/request/resend_otp_request.dart';
import 'package:por2/domain/entities/request/reset_code_request.dart';
import 'package:por2/domain/use_case/resend_otp_use_case.dart';
import 'package:por2/domain/use_case/reset_code_use_case.dart';
import 'package:por2/features/auth/presentation/screens/reset_code/cubit/reset_code_states.dart';

@injectable
class ResetCodeViewModel extends Cubit<ResetCodeStates> {
  ResetCodeUseCase resetCodeUseCase;
  ResendOtpUseCase resendOtpUseCase;
  ResetCodeViewModel({
    required this.resetCodeUseCase,
    required this.resendOtpUseCase,
  }) : super(ResetCodeInitState());

  verifyResetCode({required String email, required String otp}) async {
    try {
      if (otp.length == 6) {
        emit(ResetCodeLoadingState());

        ResetCodeRequest resetCodeRequest = ResetCodeRequest(
          email: email,
          otp: otp,
        );

        var response = await resetCodeUseCase.invoke(
          resetCodeRequest: resetCodeRequest,
        );

        emit(ResetCodeSuccessState(response: response));
      }
    } on AppErrors catch (e) {
      emit(ResetCodeErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      String? message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : e.message;

      emit(
        ResetCodeErrorState(message: message ?? 'UnExpected Error Occurred'),
      );
    }
  }

  resentOtp({required String email}) async {
    try {
      ResendOtpRequest resendOtpRequest = ResendOtpRequest(email: email);

      var response = await resendOtpUseCase.invoke(
        resendOtpRequest: resendOtpRequest,
      );
      emit(ResendOtpSuccessState(response: response));
    } on AppErrors catch (e) {
      emit(ResendOtpErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      String? message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : e.message;

      emit(
        ResendOtpErrorState(message: message ?? 'UnExpected Error Occurred'),
      );
    }
  }
}
