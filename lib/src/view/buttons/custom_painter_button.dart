// // ignore_for_file: library_private_types_in_public_api

// import 'package:flutter/material.dart';

// class CustomCurvedButton extends StatefulWidget {
//   final VoidCallback onPressed;

//   const CustomCurvedButton({super.key, required this.onPressed});

//   @override
//   _CustomCurvedButtonState createState() => _CustomCurvedButtonState();
// }

// class _CustomCurvedButtonState extends State<CustomCurvedButton>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   late Animation<double> _scaleAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _animationController = AnimationController(
//         vsync: this, duration: const Duration(milliseconds: 100));
//     _scaleAnimation = Tween<double>(begin: 1.0, end: 0.9).animate(
//       CurvedAnimation(
//         parent: _animationController,
//         curve: Curves.easeInOut,
//       ),
//     );

//     _animationController.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   void dispose() {
//     _animationController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           GestureDetector(
//             onTapDown: (_) {
//               _animationController.forward();
//             },
//             onTapUp: (_) {
//               _animationController.reverse();
//               widget.onPressed();
//             },
//             onTapCancel: () {
//               _animationController.reverse();
//             },
//             child: Transform.scale(
//               scale: _scaleAnimation.value,
//               child: CustomPaint(
//                 painter: CurvedButtonPainter(),
//                 child: SizedBox(
//                   width: MediaQuery.sizeOf(context).width,
//                   height: 80,
//                   child: const Center(
//                     child: Text(
//                       'Press me',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CurvedButtonPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = Colors.blue
//       ..style = PaintingStyle.fill;

//     double radius = 120.0;
//     double height = size.height;

//     Path path = Path()
//       ..moveTo(-200, height)
//       ..quadraticBezierTo(0, 0, radius, 0)
//       ..lineTo(size.width - radius, 0)
//       ..quadraticBezierTo(size.width, 0, size.width, radius)
//       ..lineTo(size.width, height)
//       ..close();

//     canvas.drawPath(path, paint);
//   }

//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return false;
//   }
// }
