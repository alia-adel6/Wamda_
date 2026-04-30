import 'package:flutter/material.dart';
import 'package:wamda/screens/home_screen.dart';
import 'package:flutter/services.dart';
import 'OTP_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 120),
            // الاسم
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "الأسم",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: "الأسم الرباعي",
                filled: true,
                fillColor: const Color(0xFFE0F2F1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 30),
            // رقم الهاتف
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                "رقم الهاتف",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Directionality(
              textDirection: TextDirection.ltr,
              child: TextField(
                keyboardType: TextInputType.phone, // 📱 يفتح لوحة أرقام
                inputFormatters: [
                  FilteringTextInputFormatter
                      .digitsOnly, // 🔢 يسمح بالأرقام فقط
                ],
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "رقم الهاتف",
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "+967",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFE0F2F1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            // زر تسجيل الدخول
            // داخل كلاس LoginScreen في زر "تسجيل الدخول"
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: () {
                  // 🚀 هذا هو الكود المسؤول عن الانتقال
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const OTPScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "تسجيل الدخول",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 80),
            // اللوجو (استبدله بصورتك)
            Image.asset("assets/images/logo.jpg", height: 150),
          ],
        ),
      ),
    );
  }
}
