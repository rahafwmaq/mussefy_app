import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';

class RowTwoTextWidget extends StatelessWidget {
  const RowTwoTextWidget(
      {super.key,
      required this.title,
      required this.patientData,
      this.titleFontSize,
      this.patientDataFontSize,
     this.titleFontWeight});
  final String title;
  final String patientData;
  final double? titleFontSize;
  final double? patientDataFontSize;
  final FontWeight? titleFontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: title,
          fontWeight: titleFontWeight ?? FontWeight.bold,
          fontSize: titleFontSize ?? 15,
        ),
        TextWidget(
          text: patientData,
          fontSize: patientDataFontSize ?? 15,
        )
      ],
    );
  }
}
