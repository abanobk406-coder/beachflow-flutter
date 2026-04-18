import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:por2/Home_Screen.dart';
import 'package:por2/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:por2/login/cubit/login_states.dart';
import 'package:por2/login/cubit/login_view_model.dart';
import 'package:por2/shared_preferences/shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordObscured = true;

  @override
  void dispose() {
    viewModel.emailController.dispose();
    viewModel.passwordController.dispose();
    super.dispose();
  }

  bool _isEmailValid(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.length >= 6;
  }

  LoginViewModel viewModel = GetIt.instance<LoginViewModel>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => viewModel,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xFFFAFAFA),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Form(
                key: viewModel.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: BlocConsumer<LoginViewModel, LoginStates>(
                  listener: (context, state) {
                    if (state is LoginSuccessState) {
                      SharedPreferencesUtils.setToken(
                        key: 'token',
                        value: state.loginResponse.token ?? '',
                      );
                      SharedPreferences.getInstance().then((prefs) {
                        prefs.setBool('isLoggedIn', true);
                        prefs.setString('userName', state.loginResponse.user?.name ?? '');
                        prefs.setString('userEmail', state.loginResponse.user?.email ?? '');
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const HomeScreen()),
                      );
                    } else if (state is LoginErrorState) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          backgroundColor: Colors.blueGrey,
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    final isLoading = state is LoginLoadingState;

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),

                          const Text(
                            'البريد الإلكتروني',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 8),

                          TextFormField(
                            controller: viewModel.emailController,
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'أدخل بريدك الإلكتروني',
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                            ),
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

                          const SizedBox(height: 24),

                          const Text(
                            'كلمة المرور',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 8),

                          TextFormField(
                            controller: viewModel.passwordController,
                            obscureText: _isPasswordObscured,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                              hintText: 'أدخل كلمة المرور',
                              filled: true,
                              fillColor: const Color(0xFFEEEEEE),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordObscured
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordObscured = !_isPasswordObscured;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'كلمة المرور مطلوبة';
                              }
                              if (!_isPasswordValid(value)) {
                                return 'بطول 6 أحرف على الأقل';
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 12),

                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        const ForgetPasswordScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                'هل نسيت كلمة المرور؟',
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ),

                          const SizedBox(height: 32),

                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: isLoading ? null : viewModel.login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9ED8C6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.blueGrey,
                                    )
                                  : const Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
