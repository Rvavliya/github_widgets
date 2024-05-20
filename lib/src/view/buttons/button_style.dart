// import 'package:flutter/material.dart';

// class Button extends StatefulWidget {
//   final String title;
//   final bool isEnable;
//   final void Function()? onTap;

//   const Button({
//     super.key,
//     required this.title,
//     this.isEnable = true,
//     this.onTap,
//   });

//   @override
//   _ToolbarState createState() => _ToolbarState();
// }

// class _ToolbarState extends State<Button> with SingleTickerProviderStateMixin {
//   static const clickAnimationDurationMillis = 200;

//   double _scaleTransformValue = 1;
//   // needed for the "click" tap effect
//   late final AnimationController animationController;
//   @override
//   void initState() {
//     super.initState();
//     animationController = AnimationController(
//       vsync: this,
//       duration: const Duration(milliseconds: clickAnimationDurationMillis),
//       lowerBound: 0.0,
//       upperBound: 0.05,
//     )..addListener(
//         () {
//           setState(() => _scaleTransformValue = 1 - animationController.value);
//         },
//       );
//   }

//   @override
//   void dispose() {
//     animationController.dispose();
//     super.dispose();
//   }

//   Future<void> _shrinkButtonSize() async {
//     animationController.forward();
//     await Future.delayed(
//       const Duration(milliseconds: clickAnimationDurationMillis),
//       () => animationController.reverse(),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           GestureDetector(
//             onTap: widget.onTap,
//             onTapDown: (_) => _shrinkButtonSize(),
//             onTapCancel: _shrinkButtonSize,
//             child: Transform.scale(
//                 scale: _scaleTransformValue,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     // color: const Color(0xFF37003C),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.2),
//                           blurRadius: 20,
//                           spreadRadius: 3,
//                           //                offset: Offset(getSize(0.50), getSize(30))
//                         ),
//                       ],
//                     ),
//                     width: 375,
//                     height: 57,
//                     child: Stack(
//                       children: <Widget>[
//                         Image.asset(
//                           (widget.isEnable)
//                               ? "assets/Path.png"
//                               : "assets/DisablePath.png",
//                           fit: BoxFit.fitWidth,
//                           width: 375,
//                           //            height: getSize(57),
//                         ),
//                         Center(
//                           child: Text(
//                             widget.title,
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleMedium
//                                 ?.copyWith(
//                                   fontSize: 24,
//                                   color: Colors.white,
//                                 ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 )),
//           ),
//         ],
//       ),
//     );
//   }
// }
