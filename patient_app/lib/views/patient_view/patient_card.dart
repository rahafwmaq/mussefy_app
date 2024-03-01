import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/patient_barcode_card.dart';
import 'package:mussefy_app/views/patient_view/patient_information_card.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(divide: 1.1),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: blueTransit, width: 2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
      ),
      child: const Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [PatientInformationCard(), width10, PatientbarcodeCard()],
        ),
      ),
    );
  }
}
