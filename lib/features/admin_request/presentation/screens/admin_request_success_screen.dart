import 'package:flutter/material.dart';
import 'package:por2/features/notifications/presentation/screens/notifications_screen.dart';

class AdminRequestSuccessScreen extends StatelessWidget {
  const AdminRequestSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 2),
                // Success Icon
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.blue.shade100,
                      width: 2,
                    ),
                    color: Colors.blue.shade50.withOpacity(0.5),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check,
                      size: 80,
                      color: Colors.blue.shade400,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                // Success Title
                const Text(
                  'تم ارسال الطلب بنجاح',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 15),
                // Success Description
                Text(
                  'جاري مراجعه طلبك\nسيتم الرد خلال 24 ساعه',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
                const Spacer(flex: 3),
                // Follow Notifications Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                 // margin: const EdgeInsets.only(bottom: 30),
                  child: OutlinedButton(
                    onPressed: () {
                      // Navigate to notifications screen and clear history
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const NotificationsScreen()),
                        (route) => route.isFirst,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.blue.shade200, width: 1.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Colors.blue.shade50.withOpacity(0.3),
                    ),
                    child: const Text(
                      'تابع الاشعارات لمتابعه الطلب',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
