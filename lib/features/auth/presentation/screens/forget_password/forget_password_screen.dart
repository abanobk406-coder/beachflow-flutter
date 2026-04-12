import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por2/app_routes.dart';
import 'package:por2/config/di.dart';
import 'package:por2/features/auth/presentation/screens/forget_password/cubit/forget_password_states.dart';
import 'package:por2/features/auth/presentation/screens/forget_password/cubit/forget_password_view_model.dart';
import '../../widgets/auth_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  ForgetPasswordViewModel viewModel = getIt<ForgetPasswordViewModel>();

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const AuthAppBar(),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'نسيت كلمة المرور؟',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'يرجى إدخال بريدك الإلكتروني لإعادة تعيين كلمة المرور',
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'البريد الإلكتروني',
                    hintText: 'أدخل بريدك الإلكتروني',
                    controller: viewModel.emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'لا يمكن أن يكون البريد الإلكتروني فارغاً';
                      }
                      if (!_isEmailValid(value)) {
                        return 'أدخل بريد إلكتروني صالح';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 32),
                  BlocConsumer<ForgetPasswordViewModel, ForgetPasswordStates>(
                    bloc: viewModel,
                    listener: (context, state) {
                      if (state is ForgetPasswordErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.message,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            backgroundColor: Colors.blueGrey,
                          ),
                        );
                      } else if (state is ForgetPasswordSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              state.response.message ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            backgroundColor: Colors.blueGrey,
                          ),
                        );
                        Navigator.pushNamed(
                          context,
                          AppRoutes.resetCode,
                          arguments: viewModel.emailController.text,
                        );
                      }
                    },
                    builder: (context, state) {
                      return CustomButton(
                        text: 'إعادة تعيين كلمة المرور',
                        isLoading: state is ForgetPasswordLoadingState,
                        onPressed: viewModel.forgetPassword,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
