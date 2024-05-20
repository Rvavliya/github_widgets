import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {
  final Widget? label, prefixIcon, suffixIcon;
  final String? counterText, hintText, initialValue;
  final int? maxLines;
  final int? maxLength;
  final void Function(String)? onChanged;
  final void Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool? obscureText, readOnly;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final void Function(String)? onFieldSubmitted;
  final Color? fillcolor;
  final bool? filed;

  const CommonTextFormField({
    super.key,
    this.obscureText = false,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.counterText,
    this.maxLength,
    this.onChanged,
    this.onSave,
    this.validator,
    required this.controller,
    this.keyboardType,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.inputFormatters,
    this.initialValue,
    this.maxLines,
    this.textAlign,
    this.textInputAction,
    this.focusNode,
    this.onFieldSubmitted,
    this.fillcolor,
    this.filed,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      textAlign: textAlign ?? TextAlign.start,
      autocorrect: true,
      initialValue: initialValue,
      inputFormatters: inputFormatters,
      readOnly: readOnly ?? false,
      onTap: onTap,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText ?? false,
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      maxLength: maxLength,
      onSaved: onSave,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: textInputAction,
      decoration: InputDecoration(
        fillColor: fillcolor,
        filled: filed,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        label: label,
        counterText: counterText,
      ),
    );
  }
}
