import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class ShowModelBottemSheetExample extends StatefulWidget {
  const ShowModelBottemSheetExample({super.key});

  @override
  State<ShowModelBottemSheetExample> createState() =>
      _ShowModelBottemSheetExampleState();
}

class _ShowModelBottemSheetExampleState
    extends State<ShowModelBottemSheetExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("ShowModalBottomSheet"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                showModelBottemSheetWidget(context: context);
              },
              child: const Text("showModalBottomSheet"),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showModelBottemSheetWidget({required BuildContext context}) {
    return showModalBottomSheet(
      useSafeArea: true,
      backgroundColor: ConstColor.white,
      isScrollControlled: true,
      showDragHandle: true,
      context: context,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.sizeOf(context).height / 2,
          padding: const EdgeInsets.symmetric(horizontal: 15).r,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Text(
                    "showModelBottemSheet",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
                SafeArea(child: SizedBox(height: 10.h)),
              ],
            ),
          ),
        );
      },
    );
  }
}
