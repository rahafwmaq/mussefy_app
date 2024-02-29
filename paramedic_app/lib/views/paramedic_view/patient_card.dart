import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/patient_information_card.dart';
import 'package:paramedic_app/views/paramedic_view/patient_picture.dart';

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
      child: const Row(
        children: [PatientPicture(), width10, PatientInformationCard()],
      ),
    );
  }
}
