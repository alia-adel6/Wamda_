import 'package:flutter/material.dart';
import 'transactions_screen.dart';
import 'Merchant_screen.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletAndWithdrawPageState();
}

class _WalletAndWithdrawPageState extends State<WalletScreen> {
  // متغير لتخزين الحساب المختار (0 للكريمي، 1 لكاش، 2 لجيب)
  int selectedAccountIndex = 0;
  int currentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'المحفظة والسحب',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // بطاقة الرصيد القابل للسحب
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 25),
                decoration: BoxDecoration(
                  color: const Color(0xFF002E30),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: const [
                    Text(
                      "الرصيد القابل للسحب",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "50,000 ريال",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              // عنوان حسابات بنكية مرتبطة
              const Text(
                "حساب بنكية مرتبطة",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 15),
              // قائمة الحسابات داخل حاوية سماوية
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2F6),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black12),
                ),
                child: Column(
                  children: [
                    _buildAccountItem(
                      0,
                      "الكريمي",
                      "********",
                      const Color(0xFF8E44AD),
                      Icons.ac_unit,
                    ),
                    const Divider(height: 1),
                    _buildAccountItem(
                      1,
                      "كاش",
                      "********",
                      const Color(0xFF16A085),
                      Icons.wallet,
                    ),
                    const Divider(height: 1),
                    _buildAccountItem(
                      2,
                      "جيب",
                      "********",
                      const Color(0xFFE74C3C),
                      Icons.adjust,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              // زر سحب الأرباح الآن
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF002E30),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "سحب الأرباح الآن",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // شريط التنقل السفلي كما في التصميم
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: const Color(0xFF003D40),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          if (index == currentIndex) return;

          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const MerchantHomeScreen()),
            );
          }

          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const TransactionScreen()),
            );
          }

          if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const WalletScreen()),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: "العمليات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "المحفظة",
          ),
        ],
      ),
    );
  }

  // ودجت لبناء سطر الحساب البنكي مع Radio Button
  Widget _buildAccountItem(
    int index,
    String title,
    String sub,
    Color color,
    IconData icon,
  ) {
    return InkWell(
      onTap: () => setState(() => selectedAccountIndex = index),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        child: Row(
          children: [
            // دائرة الاختيار (Radio)
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color:
                      selectedAccountIndex == index ? Colors.blue : Colors.grey,
                  width: 2,
                ),
              ),
              child:
                  selectedAccountIndex == index
                      ? Center(
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Colors.blue,
                            shape: BoxShape.circle,
                          ),
                        ),
                      )
                      : null,
            ),
            const Spacer(),
            // نصوص الحساب
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  sub,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(width: 15),
            // شعار الحساب
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: Colors.white, size: 24),
            ),
          ],
        ),
      ),
    );
  }
}
