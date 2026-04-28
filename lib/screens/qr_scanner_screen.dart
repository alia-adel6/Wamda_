import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:image_picker/image_picker.dart';
import 'payment_selection_screen.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen>
    with SingleTickerProviderStateMixin {
  final ImagePicker picker = ImagePicker();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> pickFromGallery() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // هنا لاحقًا ممكن تحليل QR من الصورة
      Navigator.pop(context, image.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // 📷 الكاميرا
          MobileScanner(
            fit: BoxFit.cover,
            onDetect: (capture) {
              final barcode = capture.barcodes.first;
              final code = barcode.rawValue;

              if (code != null) {
                Navigator.pop(context, code);
              }
            },
          ),

          // 🌑 طبقة تغميق احترافية
          Container(color: Colors.black.withOpacity(0.5)),

          // 🟩 نافذة المسح
          Center(
            child: Stack(
              children: [
                Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.green, width: 3),
                  ),
                ),

                // 🔥 خط مسح متحرك
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Positioned(
                      top: 260 * _controller.value,
                      left: 0,
                      right: 0,
                      child: Container(height: 3, color: Colors.greenAccent),
                    );
                  },
                ),
              ],
            ),
          ),

          // 🟢 زر المعرض
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF003238),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.all(15),
              ),
              onPressed: pickFromGallery,
              icon: const Icon(Icons.image),
              label: const Text(
                "رفع من المعرض",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
