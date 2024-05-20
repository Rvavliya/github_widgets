import 'dart:developer';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gallery/src/view/slidebar/action_slider/action.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SliderButtonExample extends StatefulWidget {
  const SliderButtonExample({super.key});

  @override
  State<SliderButtonExample> createState() => _SliderButtonExampleState();
}

class _SliderButtonExampleState extends State<SliderButtonExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Slider Button"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(
            //   height: 60.h,
            //   width: 250.w,
            //   decoration: BoxDecoration(
            //     color: Colors.grey.shade300,
            //     borderRadius: BorderRadius.circular(40),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(horizontal: 20).r,
            //     child: Row(children: [
            //       CircleAvatar(
            //         backgroundColor: Colors.black,
            //         radius: 28.r,
            //         child: Text(
            //           "X",
            //           style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 35.sp,
            //           ),
            //         ),
            //       ),
            //       SizedBox(width: 20.w),
            //       const Text("Swipe to Cancel"),
            //     ]),
            //   ),
            // ),
            SliderButton(
              vibrationFlag: true,
              buttonSize: 65,
              buttonWidth: 50,
              buttonColor: Colors.black,
              icon: Text(
                "X",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30.sp,
                ),
              ),
              label: const Text("Swip To Delete"),
              shimmer: true,
              action: () {
                log("Actino");
                Clipboard.setData(const ClipboardData(text: "Data"));
                HapticFeedback.heavyImpact();
              },
            ),
          ],
        ),
      ),
    );
  }
}
