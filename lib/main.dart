import 'package:flutter/material.dart';
import 'package:por2/Home_Screen.dart';
import 'package:por2/app_routes.dart';
import 'package:por2/config/di.dart';
import 'package:por2/features/auth/presentation/screens/forget_password/forget_password_screen.dart';
import 'package:por2/features/auth/presentation/screens/password_reset_screen.dart';
import 'package:por2/features/auth/presentation/screens/reset_code/check_your_email_screen.dart';
import 'package:por2/features/auth/presentation/screens/new_password/set_new_password_screen.dart';
import 'package:por2/features/auth/presentation/screens/success_screen.dart';
import 'package:por2/login/login_page.dart';
import 'package:por2/auth_provider.dart';
import 'package:por2/onboarding.dart';
import 'package:por2/api_server.dart';
import 'package:por2/providerfov.dart';
import 'package:por2/providertoerated.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  configureDependencies();

  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => BeachProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_)=> TopRatedBeachProvider()),
      ],
      child: MyApp(showHome: showHome),
    ),
  );
}
class MyApp extends StatefulWidget {
  final bool showHome;
  const MyApp({super.key, required this.showHome});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _showHome = false;

  @override
  void initState() {
    super.initState();
    _showHome = widget.showHome;
  }

  void _completeOnboarding() {
    setState(() {
      _showHome = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: const Locale('ar'),
      debugShowCheckedModeBanner: false,

     routes: {
      AppRoutes.forgetPassword:(context)=>ForgetPasswordScreen(),
      AppRoutes.resetCode:(context)=>CheckYourEmailScreen(),
     // AppRoutes.passwordResetScreen:(context)=>PasswordResetScreen(),
      AppRoutes.setNewPasswordScreen:(context)=>SetNewPasswordScreen(),
      AppRoutes.successScreen:(context)=>SuccessScreen(),
      AppRoutes.loginScreen:(context)=>LoginPage(),
     },

      home: _showHome
          ? const HomeScreen()
          : OnboardingWrapper(onComplete: _completeOnboarding),
    );
  }
}

