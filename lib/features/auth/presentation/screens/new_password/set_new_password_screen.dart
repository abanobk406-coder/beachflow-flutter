import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por2/app_routes.dart';
import 'package:por2/config/di.dart';
import 'package:por2/features/auth/presentation/screens/new_password/cubit/new_password_states.dart';
import 'package:por2/features/auth/presentation/screens/new_password/cubit/new_password_view_model.dart';
import '../../widgets/auth_app_bar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../success_screen.dart';

class SetNewPasswordScreen extends StatefulWidget {
  const SetNewPasswordScreen({super.key});

  @override
  State<SetNewPasswordScreen> createState() => _SetNewPasswordScreenState();
}

class _SetNewPasswordScreenState extends State<SetNewPasswordScreen> {



 String? validateConfirmPassword(String password, String confirmPassword) {
  if (confirmPassword.isEmpty) {
    return 'Please confirm your password';
  }

  if (password != confirmPassword) {
    return 'Passwords do not match';
  }

  return null;
}

bool _isPasswordValid(String password) {
    return password.length >= 6;
  }



  NewPasswordViewModel viewModel=getIt<NewPasswordViewModel>();

  @override
  Widget build(BuildContext context) {
    String email=ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: BlocProvider(
           create: (_) => viewModel,
            child: Form(
              key: viewModel.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  const Text(
                    'Set a new password',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Create a new password. Ensure it differs from previous ones for security',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 32),
                   CustomTextField(
                    label: 'Password',
                    hintText: 'Enter your new password',
                    isPassword: true,
                    controller: viewModel.passwordController,
                    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.black45),
                    validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password required';
                            }
                            if (!_isPasswordValid(value)) {
                              return 'Min 6 chars';
                            }
                            return null;
                          },
                  ),
                  const SizedBox(height: 24),
                   CustomTextField(
                    label: 'Confirm password',
                    hintText: 'Re-enter password',
                    isPassword: true,
                    validator: (value){
                     return validateConfirmPassword(viewModel.passwordController.text,value!);
                    },
                    suffixIcon: Icon(Icons.visibility_off_outlined, color: Colors.black45),
                  ),
                  const SizedBox(height: 32),
                  BlocConsumer<NewPasswordViewModel,NewPasswordStates>(
                    listener: (context, state) {
                      if(state is NewPasswordErrorState){
                        ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(state.message),
                        ),
                      );
                      }else if(state is NewPasswordSuccessState){
                          Navigator.pushReplacementNamed(context, AppRoutes.successScreen);
                      }
                    },
                    builder:(context, state) => CustomButton(
                      text: 'Submit',
                      isLoading: state is NewPasswordLoadingState,
                      onPressed: () {
                        viewModel.resetPassword(email: email);
                      },
                    ),
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
