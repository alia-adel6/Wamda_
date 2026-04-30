import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatefulWidget {
  const QrScreen({super.key});

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  final String id = "USER_1001";

  bool showQr = false;

  @override
  void initState() {
    super.initState();

    // ⏳ تأخير بسيط لمحاكاة "توليد الكود"
    Future.delayed(const Duration(milliseconds: 600), () {
      setState(() {
        showQr = true;
      });
    });
  }

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
          'الكود الخاص',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 🟡 QR BOX
            Container(
              width: 280,
              height: 280,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFE3F2F6),
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
                  CustomPaint(size: Size.infinite, painter: QrBorderPainter()),

                  // 🔥 LOADING + ANIMATION
                  Center(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 700),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: animation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, 0.2),
                                end: Offset.zero,
                              ).animate(animation),
                              child: child,
                            ),
                          ),
                        );
                      },
                      child:
                          showQr
                              ? QrImageView(
                                key: const ValueKey("qr"),
                                data: id,
                                size: 200,
                                backgroundColor: Colors.white,
                              )
                              : const CircularProgressIndicator(
                                key: ValueKey("loading"),
                                color: Color(0xFF003D40),
                              ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "الجندول للألكترونيات",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF002E30),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "رقم المحفظة : 8******76",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 60),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Text(
                "اظهر هذا الكود للزبون ليدفع لك",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QrBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = const Color(0xFFFDB813)
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke
          ..strokeCap = StrokeCap.round;

    double length = 40;
    double radius = 25;

    // أعلى يمين
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

    // أعلى يسار
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

    // أسفل يمين
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

    // أسفل يسار
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
