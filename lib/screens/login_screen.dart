import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'OTP_screen.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  bool isLoading = false;

  Future<void> sendOTP() async {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();

    if (name.isEmpty || phone.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('يرجى إدخال الاسم ورقم الهاتف')),
      );
      return;
    }

    if (!RegExp(r'^7[0-9]{8}$').hasMatch(phone)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('رقم الهاتف يجب أن يتكون من 9 أرقام')),
      );
      return;
    }

    setState(() => isLoading = true);

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() => isLoading = false);

    Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen()));
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(height: 120),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'الاسم',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: nameController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                hintText: 'الاسم الرباعي',
                filled: true,
                fillColor: const Color(0xFFE0F2F1),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'رقم الهاتف',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),

            Directionality(
              textDirection: TextDirection.ltr,
              child: TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(9),
                ],
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: '7XXXXXXXX',
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      '+967',
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

            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                onPressed: isLoading ? null : sendOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003D40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child:
                    isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text(
                          'تسجيل الدخول',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
              ),
            ),

            const SizedBox(height: 80),

            Image.asset('assets/images/logo.jpg', height: 150),
          ],
        ),
      ),
    );
  }
}
