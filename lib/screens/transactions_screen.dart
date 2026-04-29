import 'package:flutter/material.dart';
import 'Merchant_screen.dart';
import 'wallet_screen.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  @override
  int currentIndex = 1;

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
          'سجل العمليات',
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
              const SizedBox(height: 10),
              // أزرار الفلترة الزمنية
              Row(
                children: [
                  _buildFilterButton("اليوم", true),
                  const SizedBox(width: 10),
                  _buildFilterButton("أمس", false),
                  const SizedBox(width: 10),
                  _buildFilterButton("هذا الشهر", false),
                ],
              ),
              const SizedBox(height: 25),
              // إجمالي العمليات
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "جميع العمليات",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "15,000 ر.ي",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              // قائمة العمليات
              Expanded(
                child: ListView(
                  children: [
                    _buildTransactionCard(
                      name: "الكريمي",
                      user: "خالد أحمد",
                      amount: "4,000",
                      time: "11:05",
                      icon: Icons.ac_unit, // استبدلها بشعار الكريمي
                      color: const Color(0xFF8E44AD),
                    ),
                    _buildTransactionCard(
                      name: "كاش",
                      user: "سارة جميل",
                      amount: "3,500",
                      time: "3:30",
                      icon: Icons.wallet, // استبدلها بشعار كاش
                      color: const Color(0xFF16A085),
                    ),
                    _buildTransactionCard(
                      name: "جيب",
                      user: "محمد صالح",
                      amount: "7,500",
                      time: "9:10",
                      icon: Icons.adjust, // استبدلها بشعار جيب
                      color: const Color(0xFFE74C3C),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // شريط التنقل السفلي كما في الصورة
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

  // ودجت أزرار الفلترة
  Widget _buildFilterButton(String title, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF9FB7B9) : const Color(0xFFD0E7ED),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF003D40), width: 1),
      ),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color(0xFF003D40),
        ),
      ),
    );
  }

  // ودجت بطاقة العملية
  Widget _buildTransactionCard({
    required String name,
    required String user,
    required String amount,
    required String time,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2F6), // خلفية البطاقة السماوية الفاتحة
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          // الجهة اليمنى: اسم وشعار العملية
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: Colors.white, size: 24),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                user,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const Spacer(),
          // الجهة اليسرى: المبلغ والوقت
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Text(
                    time,
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  const Icon(Icons.access_time, size: 14, color: Colors.grey),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
