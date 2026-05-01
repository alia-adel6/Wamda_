// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'home_screen.dart';

// class OTPScreen extends StatefulWidget {
//   final String name;
//   final String phone;

//   const OTPScreen({super.key, required this.name, required this.phone});

//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   bool isLoading = false;

//   Future<void> confirmLogin() async {
//     setState(() => isLoading = true);

//     try {
//       // 🔥 توليد ID عشوائي للمستخدم
//       final docRef = FirebaseFirestore.instance.collection('users').doc();

//       await docRef.set({
//         'uid': docRef.id,
//         'name': widget.name,
//         'phone': '+967${widget.phone}',
//         'createdAt': FieldValue.serverTimestamp(),
//       });

//       Navigator.pushAndRemoveUntil(
//         context,
//         MaterialPageRoute(builder: (_) => const HomeScreen()),
//         (route) => false,
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(
//         context,
//       ).showSnackBar(SnackBar(content: Text('حدث خطأ: $e')));
//     } finally {
//       if (mounted) setState(() => isLoading = false);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'تأكيد الدخول',
//                 style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
//               ),

//               const SizedBox(height: 20),

//               Text(
//                 'مرحباً ${widget.name}',
//                 style: const TextStyle(fontSize: 18),
//                 textAlign: TextAlign.center,
//               ),

//               const SizedBox(height: 60),

//               SizedBox(
//                 width: double.infinity,
//                 height: 60,
//                 child: ElevatedButton(
//                   onPressed: isLoading ? null : confirmLogin,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF003D40),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                   ),
//                   child:
//                       isLoading
//                           ? const CircularProgressIndicator(color: Colors.white)
//                           : const Text(
//                             'دخول',
//                             style: TextStyle(
//                               fontSize: 20,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                 ),
//               ),

//               const SizedBox(height: 80),
//               Image.asset('assets/images/logo.jpg', height: 150),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
