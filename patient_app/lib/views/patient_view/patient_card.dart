import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/PersonalInfo_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_data/globals.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/view_layout/sizebox.dart';
import 'package:mussefy_app/views/patient_view/patient_barcode_card.dart';
import 'package:mussefy_app/views/patient_view/patient_information_card.dart';

class PatientCard extends StatelessWidget {
  const PatientCard({super.key, required this.patient});
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    PersonalInfo personalInfo = PersonalInfo();

    return Container(
      width: context.getWidth(divide: 1.1),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: blueTransit, width: 2),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [BoxShadow(color: lightGrey, blurRadius: 20)],
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<PatientBloc, PatientBlocSatet>(
          builder: (context, state) {
            if (state is SucssessPatientInfoCardState) {
              personalInfo = state.personalInfo;
              profileImage = personalInfo.image!;
            }
            return Row(
              children: [
                PatientInformationCard(
                  patient: patient,
                  personalInfo: personalInfo,
                ),
                width10,
                PatientbarcodeCard(
                  patient: patient
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
