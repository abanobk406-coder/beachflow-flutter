import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:por2/app_routes.dart';
import 'package:por2/config/di.dart';
import 'package:por2/features/auth/presentation/screens/reset_code/cubit/reset_code_states.dart';
import 'package:por2/features/auth/presentation/screens/reset_code/cubit/reset_code_view_model.dart';
import '../../widgets/auth_app_bar.dart';
import '../../widgets/custom_button.dart';


class CheckYourEmailScreen extends StatefulWidget {
  const CheckYourEmailScreen({super.key});

  @override
  State<CheckYourEmailScreen> createState() =>
      _CheckYourEmailScreenState();
}

class _CheckYourEmailScreenState extends State<CheckYourEmailScreen> {
  final List<TextEditingController> controllers =
      List.generate(6, (_) => TextEditingController());

  final List<FocusNode> focusNodes =
      List.generate(6, (_) => FocusNode());

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  String getCode() {
    return controllers.map((c) => c.text).join();
  }


  ResetCodeViewModel viewModel=getIt<ResetCodeViewModel>();

  @override
  Widget build(BuildContext context) {
    String email =
        ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AuthAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Check your email',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'We sent a reset link to $email enter 6 digit code that mentioned in the email',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),

              /// OTP
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  6,
                  (index) => Container(
                    width: 45,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F5F7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: TextField(
                        controller: controllers[index],
                        focusNode: focusNodes[index],
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          counterText: '',
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),

                        /// 🔥 الحركة الذكية
                        onChanged: (value) {
                          // forward
                          if (value.isNotEmpty && index < 5) {
                            focusNodes[index + 1].requestFocus();
                          }

                          // backward
                          if (value.isEmpty && index > 0) {
                            focusNodes[index - 1].requestFocus();
                          }
                        },
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              /// زرار
              BlocConsumer<ResetCodeViewModel,ResetCodeStates>(
                bloc: viewModel,
                listener: (context, state) {
                  if(state is ResetCodeErrorState){
                    ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(state.message),
                        ),
                      );
                  }else if(state is ResetCodeSuccessState){
                    ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text(state.response.message??''),
                        ),
                      );
                    

                    Navigator.pushNamed(context,AppRoutes.passwordResetScreen,arguments: email);

                      
                  }
                },
                builder:(context, state) {
                  return CustomButton(
                  text: 'Verify code',
                  isLoading: state is ResetCodeLoadingState,
                  onPressed: (){
                    viewModel.verifyResetCode(email: email,otp: getCode());
                  }
                );
                }  
              ),

              const SizedBox(height: 24),

              Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Haven\'t got the email yet ? ',
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend email',
                        style: const TextStyle(
                          color: Color(0xFF78D6F5),
                          fontWeight: FontWeight.w600,
                        ),
                        recognizer:
                            TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}