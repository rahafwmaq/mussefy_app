import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_event.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/patient_body_structure_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_doctor_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_emergency_contact_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_laboratory_report_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medical_info_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medication_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_surgery_report_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_xray_report_view.dart';

class PatientViewForParamedic extends StatelessWidget {
  const PatientViewForParamedic(
      {super.key, required this.patient, required this.idText});

  final Patient patient;
  final String idText;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
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
                text: 'paramedic_patient_screen.body_structure'.tr(),
              ),
              TextWidget(
                text: 'my_doctor_view.title_screen'.tr(),
              ),
              TextWidget(
                text: 'my_medication.title_screen'.tr(),
              ),
              TextWidget(
                text: 'surgical_record.title_screen'.tr(),
              ),
              TextWidget(
                text: 'laboratory_result.title_screen'.tr(),
              ),
              TextWidget(
                text: 'x-rays_reports.title_screen'.tr(),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const PatientMedicalInformationView(),
            PatientBodyStructureView(
              patientId: idText,
            ),
            PatientDoctorView(
              patient: patient,
            ),
            PatientMedicationView(),
            const PatientSurgeryReportView(),
            const PatientLaboratoryReportView(),
            const PatientXrayReportView()
          ],
        ),
      ),
    );
  }
}
