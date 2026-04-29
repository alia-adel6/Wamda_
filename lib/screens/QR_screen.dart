import 'package:flutter/material.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // سهم الرجوع
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'الكود الخاص',
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // حاوية الـ QR الكبيرة
              Container(
                width: 280,
                height: 280,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(
                    0xFFE3F2F6,
                  ), // الخلفية الزرقاء الفاتحة جداً
                  borderRadius: BorderRadius.circular(40),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // رسم الزوايا الصفراء المنحنية
                    CustomPaint(
                      size: Size(double.infinity, double.infinity),
                      painter: QrBorderPainter(),
                    ),
                    // أيقونة الـ QR Code المركزية
                    Center(
                      child: Icon(
                        Icons.qr_code_2_rounded,
                        size: 210,
                        color: Colors.black.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),

              // اسم المتجر كما في Screenshot 2026-04-29 145038.png
              const Text(
                "الجندول للألكترونيات",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF002E30),
                ),
              ),
              const SizedBox(height: 8),

              // رقم المحفظة
              const Text(
                "رقم المحفظة : 8******76",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              const SizedBox(height: 60),

              // النص الإرشادي السفلي
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "اظهر هذا الكود للزبون ليدفع لك",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// كلاس الرسم الخاص بالزوايا الصفراء المحيطة بالـ QR
class QrBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFFDB813) // اللون الأصفر الذهبي
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    double length = 40; // طول الخط المستقيم في الزاوية
    double radius = 25; // درجة انحناء الزاوية

    // الزاوية العلوية اليمنى
    canvas.drawPath(
      Path()
        ..moveTo(size.width - length, 0)
        ..lineTo(size.width - radius, 0)
        ..arcToPoint(
          Offset(size.width, radius),
          radius: Radius.circular(radius),
        )
        ..lineTo(size.width, length),
      paint,
    );

    // الزاوية العلوية اليسرى
    canvas.drawPath(
      Path()
        ..moveTo(length, 0)
        ..lineTo(radius, 0)
        ..arcToPoint(
          Offset(0, radius),
          radius: Radius.circular(radius),
          clockwise: false,
        )
        ..lineTo(0, length),
      paint,
    );

    // الزاوية السفلية اليمنى
    canvas.drawPath(
      Path()
        ..moveTo(size.width, size.height - length)
        ..lineTo(size.width, size.height - radius)
        ..arcToPoint(
          Offset(size.width - radius, size.height),
          radius: Radius.circular(radius),
          clockwise: false,
        )
        ..lineTo(size.width - length, size.height),
      paint,
    );

    // الزاوية السفلية اليسرى
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - length)
        ..lineTo(0, size.height - radius)
        ..arcToPoint(
          Offset(radius, size.height),
          radius: Radius.circular(radius),
        )
        ..lineTo(length, size.height),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
