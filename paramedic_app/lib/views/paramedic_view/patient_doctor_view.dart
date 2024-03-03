

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/doctor_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/doctor_pictuer_and_name.dart';

class PatientDoctorView extends StatelessWidget {
  const PatientDoctorView({super.key, required this.patient});
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    Doctor doctor = Doctor();

    return Scaffold(
      appBar: customAppBar(
        title: 'my_doctor_view.title_screen'.tr(),
        context: context,

      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<PatientBloc, PatientBlocSatet>(
            builder: (context, state) {
              if (state is SucssessPatientDoctorState) {
                if (state.doctor != null) {
                  doctor = state.doctor!;
                }
              } else {
                return const Center(
                  child: CircularProgressIndicator(color: red),
                );
              }
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DoctorPictureAndName(
                    doctor: doctor,
                  ),
                  const Divider(),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_specialty'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.speciality ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_address'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.address ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  height10,
                  TextWidget(
                    text: 'my_doctor_view.practice_contact'.tr(),
                    fontSize: 18,
                  ),
                  TextWidget(
                    text: doctor.phone ?? '',
                    fontSize: 18,
                    textColor: gray,
                  ),
                  TextWidget(
                    text: doctor.email ?? '',
                    fontSize: 18,
                    textColor: gray,
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
