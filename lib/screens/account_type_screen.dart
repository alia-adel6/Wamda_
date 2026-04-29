import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'Merchant_screen.dart';

class AccountTypeScreen extends StatelessWidget {
  const AccountTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F9FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'نوع الحساب',
          style: TextStyle(
            color: Color(0xFF003D40),
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: Color(0xFF003D40)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // خيار حساب المشتري
            _buildAccountTypeCard(
              context, // تمرير الـ context
              icon: Icons.shopping_cart_outlined,
              title: 'حساب مشتري',
              subtitle: 'استخدم التطبيق لإجراء المدفوعات والشراء بسهولة',
              color: const Color(0xFF003D40),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
            ),
            const SizedBox(height: 20),
            // خيار حساب التاجر
            _buildAccountTypeCard(
              context, // تمرير الـ context
              icon: Icons.storefront_outlined,
              title: 'حساب تاجر',
              subtitle: 'استقبل المدفوعات وأدر عمليات البيع بكل سهولة',
              color: const Color(0xFFFFC107),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MerchantHomeScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountTypeCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white, // لون الخلفية الأساسي للكرت
      borderRadius: BorderRadius.circular(20),
      elevation: 2, // إضافة ظل بسيط
      shadowColor: Colors.black.withOpacity(0.2),
      child: InkWell(
        onTap: onTap, // تنفيذ النقر مع التأثير المرئي
        borderRadius: BorderRadius.circular(20),
        splashColor: color.withOpacity(0.1), // لون تأثير الضغطة
        highlightColor: color.withOpacity(0.05), // لون التوهج عند الضغط المستمر
        child: Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // أزلنا الظل من هنا ووضعناه في Material لضمان ظهور الـ InkWell فوقه
          ),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF003D40),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
