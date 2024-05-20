import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget>? actions;
  final Widget? title, leading;
  final Color? foregroundColor, shadowColor, backgroundColor;
  final PreferredSizeWidget? bottom;
  final SystemUiOverlayStyle? systemOverlayStyle;

  const CommonAppBar(
      {super.key,
      this.actions,
      this.title,
      this.leading,
      this.bottom,
      this.systemOverlayStyle,
      this.foregroundColor,
      this.shadowColor,
      this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.white,
      leading: leading,
      actions: actions,
      centerTitle: true,
      title: title,
      backgroundColor: backgroundColor,
      bottom: bottom,
      systemOverlayStyle: systemOverlayStyle,
      foregroundColor: foregroundColor,
      shadowColor: shadowColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
