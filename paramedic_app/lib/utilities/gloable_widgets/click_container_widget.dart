import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

class ClickContainerWidget extends StatelessWidget {
  const ClickContainerWidget(
      {super.key,
      required this.onTap,
      required this.color,
      required this.text,
      required this.textColor,
      required this.fontSize});
  final Function() onTap;
  final Color color;
  final String text;
  final Color textColor;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: context.getHeight(divide: 18),
        width: context.getWidth(divide: 2),
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: lightGrey, blurRadius: 10),
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
