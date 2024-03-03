import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_event.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_container_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/patient_body_structure_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_card.dart';
import 'package:paramedic_app/views/paramedic_view/patient_doctor_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_emergency_contact_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_laboratory_report_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medical_info_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medication_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_surgery_report_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_xray_report_view.dart';

class PatientViewForParamedic extends StatelessWidget {
  const PatientViewForParamedic({
    super.key,
    required this.idText,
    required this.patient,
  });
  final String idText;
  final Patient patient;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            context: context, title: 'paramedic_patient_screen.title'.tr()),
        body: SizedBox(
          width: context.getWidth(),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                height20,
                PatientCard(
                  patient: patient,
                ),
                height40,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/emergency_contact.png',
                  firstTitle: 'paramedic_patient_screen.emergency_contact'.tr(),
                  fisrtOnTap: () {
                    context.pushView(view: const PatientEmergencyContactView());
                  },
                  secondImagePath: 'assets/images/body_structure.png',
                  secondTitle: 'paramedic_patient_screen.body_structure'.tr(),
                  secondOnTap: () {
                    context.pushView(
                        view: PatientBodyStructureView(patientId: idText));
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/doctor.png',
                  firstTitle: 'paramedic_patient_screen.doctor'.tr(),
                  fisrtOnTap: () {
                    context
                        .read<PatientBloc>()
                        .add(GetdataEvent(patient.id!, patient, 'My Doctor'));
                    context.pushView(
                        view: PatientDoctorView(
                      patient: patient,
                    ));
                  },
                  secondImagePath: 'assets/images/medical.png',
                  secondTitle:
                      'paramedic_patient_screen.medical_inforamtion'.tr(),
                  secondOnTap: () {
                    context.read<PatientBloc>().add(GetdataEvent(
                        patient.id!, patient, 'Medical Information'));
                    context.pushView(view: PatientMedicalInformationView());
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/medication.png',
                  firstTitle: 'paramedic_patient_screen.medication'.tr(),
                  fisrtOnTap: () {
                    context.read<PatientBloc>().add(
                        GetdataEvent(patient.id!, patient, 'My Medication'));
                    context.pushView(view: PatientMedicationView());
                  },
                  secondImagePath: 'assets/images/surgery.png',
                  secondTitle: 'paramedic_patient_screen.surgery'.tr(),
                  secondOnTap: () {
                    context.read<PatientBloc>().add(
                        GetdataEvent(patient.id!, patient, 'Surgical Record'));
                    context.pushView(view: PatientSurgeryReportView());
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/X-Rays.png',
                  firstTitle: 'paramedic_patient_screen.xray'.tr(),
                  fisrtOnTap: () {
                    context.read<PatientBloc>().add(
                        GetdataEvent(patient.id!, patient, 'XRays Report'));
                    context.pushView(view: PatientXrayReportView());
                  },
                  secondImagePath: 'assets/images/laboratory.png',
                  secondTitle: 'paramedic_patient_screen.laboratory'.tr(),
                  secondOnTap: () {
                    context.read<PatientBloc>().add(GetdataEvent(
                        patient.id!, patient, 'Laboratory Result'));
                    context.pushView(view: PatientLaboratoryReportView());
                  },
                ),
                height40
              ],
            ),
          )),
        ),
      ),
    );
  }
}
