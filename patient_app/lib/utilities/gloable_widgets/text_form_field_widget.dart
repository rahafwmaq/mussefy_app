import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget(
      {super.key,
      this.validator,
      required this.keyboardType,
      required this.controller,
      this.labelText,
      this.labelTextColor,
      this.cursorColor,
      this.controllerTextColor,
      this.suffixIcon,
      required this.obscureText,
      this.hintText});

  final String? Function(String?)? validator;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? labelText;
  final Color? labelTextColor;
  final Color? cursorColor;
  final Color? controllerTextColor;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      style: TextStyle(color: controllerTextColor),
      cursorColor: cursorColor,
      obscureText: obscureText,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: lightGrey),
          floatingLabelAlignment: FloatingLabelAlignment.start,
          contentPadding: const EdgeInsets.all(10),
          label: TextWidget(
            text: labelText ?? '',
            textColor: labelTextColor,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: red),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: red),
              borderRadius: BorderRadius.circular(10)),
          suffixIcon: suffixIcon),
    );
  }
}
