import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/MedicalInformation_model.dart';
import 'package:paramedic_app/models/PersonalInfo_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';

class PatientInfoContainer extends StatelessWidget {
  const PatientInfoContainer(
      {super.key, this.personalInfo, this.patient, this.medicalInformation});
  final PersonalInfo? personalInfo;
  final Patient? patient;
  final MedicalInformation? medicalInformation;

  @override
  Widget build(BuildContext context) {
    PersonalInfo personalInfo = PersonalInfo();
    MedicalInformation medicalInformation = MedicalInformation();
    return SizedBox(
      width: context.getWidth(),
      child: BlocBuilder<PatientBloc, PatientBlocSatet>(
        builder: (context, state) {
          if (state is SucssessPatientDataState) {
            personalInfo = state.personalInfo;
            medicalInformation = state.medicalInformation;
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowTwoTextWidget(
                title: 'patient_information.national_id'.tr(),
                patientData: personalInfo.nationalId ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.patient_name'.tr(),
                patientData: patient!.fullName ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.patient_date'.tr(),
                patientData: personalInfo.birthday ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.patient_blood_type'.tr(),
                patientData: personalInfo.bloodType ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.patient_height'.tr(),
                patientData: ' ${personalInfo.height ?? ''}',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.patient_weight'.tr(),
                patientData: '${personalInfo.weight ?? ''}',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'patient_information.smooker'.tr(),
                patientData: medicalInformation.isSmoker ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'medical_inforamtion.communication_challenge'.tr(),
                patientData: medicalInformation.communication ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
              height8,
              RowTwoTextWidget(
                title: 'medical_inforamtion.medical_device'.tr(),
                patientData: medicalInformation.medicalCondition ?? '',
                titleFontSize: 16,
                titleFontWeight: FontWeight.w500,
                patientDataFontSize: 15,
              ),
            ],
          );
        },
      ),
    );
  }
}
