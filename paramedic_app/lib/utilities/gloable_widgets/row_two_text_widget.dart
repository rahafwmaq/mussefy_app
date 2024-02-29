import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';

class RowTwoTextWidget extends StatelessWidget {
  const RowTwoTextWidget(
      {super.key, required this.title, required this.patientData});
  final String title;
  final String patientData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(
          text: title,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        TextWidget(
          text: patientData,
          fontSize: 15,
        )
      ],
    );
  }
}
