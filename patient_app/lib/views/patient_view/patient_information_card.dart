import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mussefy_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';

class PatientInformationCard extends StatelessWidget {
  const PatientInformationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(divide: 2.15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          TextWidget(
            text: 'patient_information.patient_name'.tr(),
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
          TextWidget(
            text: 'Khalid Hassan Al-Gamdi',
            fontSize: 14,
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.national_id'.tr(),
            patientData: '1023322123',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_date'.tr(),
            patientData: '1957-05-09',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_blood_type'.tr(),
            patientData: 'AB-',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_height'.tr(),
            patientData: '170.0',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_weight'.tr(),
            patientData: '85.0',
          ),
          height20,
        ],
      ),
    );
  }
}
