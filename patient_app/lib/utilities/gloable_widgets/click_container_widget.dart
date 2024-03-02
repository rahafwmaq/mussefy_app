import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/color.dart';

class ClickContainerWidget extends StatelessWidget {
  const ClickContainerWidget(
      {super.key,
      required this.onTap,
      required this.color,
      required this.text,
      required this.textColor,
      required this.fontSize,
      this.height,
      this.width});
  final Function() onTap;
  final Color color;
  final String text;
  final Color textColor;
  final double fontSize;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 46,
        width: width ?? 200,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: lightGrey, blurRadius: 20),
            ]),
        child: Center(
            child: TextWidget(
          text: text,
          textColor: textColor,
          fontSize: fontSize,
        )),
      ),
    );
  }
}
