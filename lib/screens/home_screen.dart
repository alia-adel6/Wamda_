import 'package:flutter/material.dart';
import 'qr_scanner_screen.dart';
import 'account_screen.dart';
import 'payment_selection_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 2;

  Future<void> openQR() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const QrScannerScreen()),
    );

    if (result != null && mounted) {
      await Future.delayed(const Duration(milliseconds: 300));

      if (!mounted) return;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const PaymentSelectionScreen()),
      );
    }
  }

  static Widget _buildTransactionItem(
    String title,
    String amount,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            amount,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(width: 15),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF003D40),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 24),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ الحل الأساسي للـ overflow
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // 🔵 الهيدر
              Container(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
                decoration: const BoxDecoration(
                  color: Color(0xFFE3F2F6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.menu,
                            color: Color(0xFF003D40),
                            size: 30,
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const AccountScreen(),
                              ),
                            );
                          },
                        ),
                        const Text(
                          "أهلاً، محمد",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003D40),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // 💳 البطاقة
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF002E30),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("النقاط", style: TextStyle(color: Colors.white)),
                          SizedBox(height: 5),
                          Text(
                            "5000 ريال",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // 🟡 زر QR
              Transform.translate(
                offset: const Offset(0, -40),
                child: GestureDetector(
                  onTap: openQR,
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFDB813),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_2,
                          size: 60,
                          color: Color(0xFF003D40),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "ادفع بومضة",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF003D40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // 📊 العمليات (بدون Expanded ❌)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "آخر العمليات",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 15),

                    _buildTransactionItem("الجندول", "5,000 ريال", Icons.store),
                    const Divider(),

                    _buildTransactionItem(
                      "الشيباني",
                      "2,000 ريال",
                      Icons.restaurant,
                    ),
                    const Divider(),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // 🔻 Bottom Navigation
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF2B8E9B),
        unselectedItemColor: Colors.black54,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });

          if (index == 1) openQR();

          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AccountScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "الحساب",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "QR",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
        ],
      ),
    );
  }
}
