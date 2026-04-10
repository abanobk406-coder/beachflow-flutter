// import 'package:flutter/material.dart';
// import 'package:por2/app_routes.dart';
// import '../widgets/auth_app_bar.dart';
// import '../widgets/custom_button.dart';


// class PasswordResetScreen extends StatelessWidget {
//   const PasswordResetScreen({super.key});

//   @override
//   Widget build(BuildContext context) {

//    String email= ModalRoute.of(context)!.settings.arguments as String;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: const AuthAppBar(),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               const Text(
//                 'Password reset',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 12),
//               const Text(
//                 'Your password has been successfully reset. Enter the OTP to continue.',
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.black54,
//                   height: 1.5,
//                 ),
//               ),
//               const SizedBox(height: 32),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: List.generate(
//                   6,
//                   (index) => Container(
//                     width: 45,
//                     height: 50,
//                     decoration: BoxDecoration(
//                       color: const Color(0xFFF5F5F7),
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: const Center(
//                       child: TextField(
//                         textAlign: TextAlign.center,
//                         keyboardType: TextInputType.number,
//                         maxLength: 1,
//                         decoration: InputDecoration(
//                           counterText: '',
//                           border: InputBorder.none,
//                         ),
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 32),
//               CustomButton(
//                 text: 'Continue',
//                 isLoading: false,
//                 onPressed: () {
//                   Navigator.pushNamed(context, AppRoutes.setNewPasswordScreen,arguments: email);
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
