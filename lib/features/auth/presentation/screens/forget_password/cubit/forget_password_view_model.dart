import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:por2/core/app_errors.dart';
import 'package:por2/domain/entities/request/forget_password_request.dart';
import 'package:por2/domain/use_case/forget_password_use_case.dart';
import 'package:por2/features/auth/presentation/screens/forget_password/cubit/forget_password_states.dart';

@injectable
class ForgetPasswordViewModel extends Cubit<ForgetPasswordStates> {
  ForgetPasswordUseCase forgetPasswordUseCase;

  ForgetPasswordViewModel({required this.forgetPasswordUseCase})
    : super(ForgetPasswordInitState());

  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> forgetPassword() async {
    try {
      if (formKey.currentState!.validate()) {
        emit(ForgetPasswordLoadingState());
        ForgetPasswordRequest forgetPasswordRequest = ForgetPasswordRequest(
          email: emailController.text,
        );

        var response = await forgetPasswordUseCase.invoke(
          forgetPasswordRequest: forgetPasswordRequest,
        );

        emit(ForgetPasswordSuccessState(response: response));
      }
    } on AppErrors catch (e) {
      emit(ForgetPasswordErrorState(message: e.errorMessage));
    } on DioException catch (e) {
      String? message = (e.error is AppErrors)
          ? (e.error as AppErrors).errorMessage
          : e.message;

      emit(
        ForgetPasswordErrorState(
          message: message ?? 'UnExpected Error Occurred',
        ),
      );
    }
  }
}
