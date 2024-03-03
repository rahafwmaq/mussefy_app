import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_event.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/back.dart';
import 'package:paramedic_app/views/paramedic_view/front.dart';
import 'package:paramedic_app/views/paramedic_view/key_body_digram.dart';
import 'package:paramedic_app/views/paramedic_view/patient_doctor_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_emergency_contact_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medical_info_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medication_view.dart';

class PatientViewForParamedic extends StatelessWidget {
  const PatientViewForParamedic(
      {super.key, required this.patient, required this.idText});

  final Patient patient;
  final String idText;

  @override
  Widget build(BuildContext context) {
    // context
    //     .read<PatientBloc>()
    //     .add(GetdataEvent(patient.id!, patient, 'My Medication'));
    // context
    //     .read<PatientBloc>()
    //     .add(GetdataEvent(patient.id!, patient, 'My Doctor'));
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: TextWidget(text: 'paramedic_patient_screen.title'.tr()),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              context.popView();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 35,
            ),
          ),
          actions: [
            BlocListener<PatientBloc, PatientBlocSatet>(
              listener: (context, state) {
                if (state is BringContactListState) {
                  context.pushView(
                      view: PatientEmergencyContactView(
                    patient: patient,
                    contactList: state.contacts,
                  ));
                }
              },
              child: IconButton(
                  onPressed: () {
                    context
                        .read<PatientBloc>()
                        .add(GetEmergencyContactEvent(patient: patient));
                  },
                  icon: const Icon(Icons.emergency_outlined)),
            )
          ],
          bottom: TabBar(
            isScrollable: true,
            labelColor: red,
            dividerColor: lightGrey,
            indicatorColor: red,
            tabs: [
              TextWidget(
                text: 'medical_inforamtion.title_screen'.tr(),
              ),
              TextWidget(
                text: 'paramedic_patient_screen.front_body'.tr(),
              ),
              TextWidget(
                text: 'paramedic_patient_screen.back_body'.tr(),
              ),
              TextWidget(
                text: 'my_medication.title_screen'.tr(),
              ),
              TextWidget(
                text: 'my_doctor_view.title_screen'.tr(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const PatientMedicalInformationView(),
            SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const FrontBodyDiagram(
                    patientId: "1abe2dce-529f-49dd-8b1d-c3f7af31233d",
                  ),
                  KeyBodyDigram(
                    positionTop: 12,
                    positionLeft: 20,
                    keyName: 'paramedic_patient_screen.injury'.tr(),
                    color: redTransit,
                  ),
                  KeyBodyDigram(
                    positionTop: 50,
                    positionLeft: 20,
                    keyName: 'paramedic_patient_screen.disability'.tr(),
                    color: blackTransit,
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.getHeight(),
              width: context.getWidth(),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  BackBodyDigram(
                    patientId: patient.id!,
                  ),
                  KeyBodyDigram(
                    positionTop: 12,
                    positionLeft: 20,
                    keyName: 'paramedic_patient_screen.injury'.tr(),
                    color: redTransit,
                  ),
                  KeyBodyDigram(
                    positionTop: 50,
                    positionLeft: 20,
                    keyName: 'paramedic_patient_screen.disability'.tr(),
                    color: blackTransit,
                  )
                ],
              ),
            ),
            PatientMedicationView(patient: patient),
            PatientDoctorView(
              patient: patient,
            ),
          ],
        ),
      ),
    );
  }
}
