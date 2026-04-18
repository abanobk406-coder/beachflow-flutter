import 'package:flutter/material.dart';
import 'package:por2/features/admin_request/presentation/screens/contract_confirmation_screen.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  final String imageUrl;
  const TermsAndConditionsScreen({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FB),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'شروط وأحكام',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.02),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'عقد اتفاق بين المستخدم وتطبيق بيتش فلو (Beach Flow)',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2196F3),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    _buildSectionTitle('البند الأول: أطراف العقد'),
                    _buildSectionBody(
                      'هذا العقد هو اتفاق رسمي وملزم بين تطبيق بيتش فلو (Beach Flow) والمستخدم المتقدم لطلب إدارة الشاطئ كطرف ثاني.\n'
                      'بموجب هذا العقد يلتزم الطرفان بجميع البنود المذكورة أدناه.',
                    ),
                    const SizedBox(height: 25),
                    _buildSectionTitle('البند الثاني: التزامات مدير الشاطئ'),
                    _buildBulletPoint('الالتزام الكامل بسياسات وقوانين تطبيق بيتش فلو.'),
                    _buildBulletPoint('الالتزام بتسعيرة الدخول المحددة والمعتمدة من بيتش فلو.'),
                    _buildBulletPoint('الحفاظ على نظافة الشاطئ والمرافق العامة بشكل مستمر.'),
                    _buildBulletPoint('توفير وسائل الأمان والإنقاذ اللازمة لسلامة المصطافين.'),
                    _buildBulletPoint('التعامل اللائق والمهني مع جميع الزوار وحل الشكاوى بسرعة.'),
                    _buildBulletPoint('تقديم بيانات صحيحة ودقيقة عند التسجيل.'),
                    _buildBulletPoint('الحفاظ على سرية بيانات المستخدمين والحجوزات.'),
                    _buildBulletPoint('عدم التلاعب بالمعلومات أو تقديم بيانات مضللة.'),
                    const SizedBox(height: 25),
                    _buildSectionTitle('البند الثالث: التزامات بيتش فلو'),
                    _buildBulletPoint('توفير منصة إلكترونية آمنة وسهلة لإدارة الحجوزات.'),
                    _buildBulletPoint('توفير الدعم الفني اللازم لمدير الشاطئ.'),
                    _buildBulletPoint('الترويج للشاطئ عبر قنوات التطبيق التسويقية.'),
                    const SizedBox(height: 25),
                    _buildSectionTitle('البند الرابع: الشروط المالية'),
                    _buildSectionBody(
                      'يتم تحصيل نسبة متفق عليها من الحجوزات التي تتم عبر تطبيق بيتش فلو، ويتم تسوية الحسابات بشكل دوري حسب الملحق المالي المرفق بهذا العقد.',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // Accept Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ContractConfirmationScreen(imageUrl: imageUrl),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2196F3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'أوافق على الشروط والأحكام',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildSectionBody(String body) {
    return Text(
      body,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey.shade700,
        height: 1.6,
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, left: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Icon(Icons.check_circle, color: Colors.green, size: 60),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'تم إرسال طلبك بنجاح',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'سيقوم الفريق المختص بمراجعة بياناتك والرد عليك في أقرب وقت ممكن.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // dialog
              Navigator.of(context).pop(); // terms
              Navigator.of(context).pop(); // admin request
            },
            child: const Text('حسناً', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}
