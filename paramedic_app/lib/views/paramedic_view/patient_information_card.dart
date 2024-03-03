import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/models/PersonalInfo_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class PatientInformation extends StatelessWidget {
  const PatientInformation(
      {super.key, required this.patient, required this.personalInfo});
  final Patient patient;
  final PersonalInfo personalInfo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(divide: 1.6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          height20,
          TextWidget(
            text: 'patient_information.patient_name'.tr(),
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          TextWidget(
            text: patient.fullName!,
            fontSize: 15,
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.national_id'.tr(),
            patientData: personalInfo.nationalId ?? '',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_date'.tr(),
            patientData: ' ${personalInfo.birthday ?? ''}',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_blood_type'.tr(),
            patientData: ' ${personalInfo.bloodType ?? ''}',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_height'.tr(),
            patientData: ' ${personalInfo.height ?? ''}',
          ),
          height6,
          RowTwoTextWidget(
            title: 'patient_information.patient_weight'.tr(),
            patientData: ' ${personalInfo.weight ?? ''}',
          ),
          height20,
        ],
      ),
    );
  }
}
