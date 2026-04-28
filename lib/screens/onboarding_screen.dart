import 'package:flutter/material.dart';
import 'home_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController controller = PageController();
  int current = 0;

  final pages = [
    {
      "text": " .. ادفع بومضة \n لأن وقتك أغلى ",
      "image": "assets/images/welcome1.png",
    },
    {
      "text": ".. من التاكسي \n للسوبر ماركت",
      "image": "assets/images/welcome2.png",
    },
    {"text": ".. أمان تام  ", "image": "assets/images/welcome3.png"},
  ];

  void next() {
    if (current < pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: controller,
              onPageChanged: (i) => setState(() => current = i),
              itemCount: pages.length,
              itemBuilder: (context, i) {
                final item = pages[i];

                return Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(child: Image.asset(item["image"]!)),
                      const SizedBox(height: 10),

                      Text(
                        item["text"] ?? "",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(pages.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: current == index ? 8 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color:
                      current == index
                          ? const Color(0xFF003238)
                          : Colors.grey.shade400,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                onPressed: next,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF003238),
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                child: Text(
                  current == pages.length - 1 ? "ابدأ الآن" : "التالي",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Cairo',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
