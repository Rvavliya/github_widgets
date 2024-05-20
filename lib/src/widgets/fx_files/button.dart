import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/constant/color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConstButton extends StatefulWidget {
  final String buttonName;
  final void Function() onTap;
  final double? width;
  final Color? color;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  const ConstButton(
      {super.key,
      required this.buttonName,
      required this.onTap,
      this.width,
      this.color,
      this.textColor,
      this.fontSize,
      this.fontWeight});

  @override
  State<ConstButton> createState() => _ConstButtonState();
}

class _ConstButtonState extends State<ConstButton> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onTap,
      animationDuration: const Duration(seconds: 1),
      color: widget.color ?? ConstColor.black,
      elevation: 2,
      height: 55,
      minWidth: widget.width ?? MediaQuery.sizeOf(context).width,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      textColor: widget.textColor ?? ConstColor.white,
      disabledElevation: 12,
      child: Text(
        widget.buttonName,
        style: TextStyle(
          fontSize: widget.fontSize ?? 14.sp,
          fontWeight: widget.fontWeight ?? FontWeight.w600,
        ),
      ),
    );
  }
}
