import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({super.key, required this.value, this.onTap});

  final bool value;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: value ? ConstColor.primary : const Color(0xffE2E2DA),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 100),
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(2.5),
            child: Container(
              height: 17.0,
              width: 17.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: value ? ConstColor.white : ConstColor.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
