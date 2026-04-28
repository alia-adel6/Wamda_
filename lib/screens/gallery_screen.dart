import 'package:flutter/material.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // (محاكاة فقط - لاحقًا نربطه بـ image_picker)
    return Scaffold(
      appBar: AppBar(
        title: const Text("المعرض"),
        backgroundColor: const Color(0xFF003238),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // هنا نرجع قيمة تجريبية
            Navigator.pop(context, "QR_FROM_GALLERY");
          },
          child: const Text("اختيار صورة (تجريبي)"),
        ),
      ),
    );
  }
}
