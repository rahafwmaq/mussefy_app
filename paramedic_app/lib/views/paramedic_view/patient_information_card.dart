import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class PatientInformationCard extends StatelessWidget {
  const PatientInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(divide: 2),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          TextWidget(
            text: 'Patient Name :',
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          TextWidget(
            text: 'Khalid Hassan Al-Gamdi',
            fontSize: 15,
          ),
          height6,
          RowTwoTextWidget(
            title: 'National ID : ',
            patientData: '1023322123',
          ),
          height6,
          RowTwoTextWidget(
            title: 'Date of Birth : ',
            patientData: '1957-05-09',
          ),
          height6,
          RowTwoTextWidget(
            title: 'Blood Type : ',
            patientData: 'AB-',
          ),
          height6,
          RowTwoTextWidget(
            title: 'Height : ',
            patientData: '170.0',
          ),
          height6,
          RowTwoTextWidget(
            title: 'Height : ',
            patientData: '85.0',
          ),
          height20,
        ],
      ),
    );
  }
}
