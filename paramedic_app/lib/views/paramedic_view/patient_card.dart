import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/PersonalInfo_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/patient_information_card.dart';
import 'package:paramedic_app/views/paramedic_view/patient_picture.dart';

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
        child: BlocBuilder<PatientBloc, PatientBlocSatet>(
          builder: (context, state) {
            if (state is SucssessPatientInfoCardState) {
              personalInfo = state.personalInfo;
            }
            return Row(
              children: [
                const PatientPicture(),
                width10,
                PatientInformation(
                  patient: patient,
                  personalInfo: personalInfo,
                )
              ],
            );
          },
        ));
  }
}
