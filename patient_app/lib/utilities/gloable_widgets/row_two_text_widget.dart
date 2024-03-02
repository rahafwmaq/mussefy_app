import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class RowTwoTextWidget extends StatelessWidget {
  const RowTwoTextWidget(
      {super.key,
      required this.title,
      required this.patientData,
      this.titleFontSize,
      this.titleFontWeight,
      this.patientDataFontSize});
  final String title;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final String patientData;
  final double? patientDataFontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: title,
          fontWeight: titleFontWeight ?? FontWeight.bold,
          fontSize: titleFontSize ?? 14,
        ),
        width8,
        TextWidget(
          text: patientData,
          fontSize: patientDataFontSize ?? 14,
        )
      ],
    );
  }
}
