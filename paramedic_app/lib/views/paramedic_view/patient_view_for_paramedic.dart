import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/container_widget.dart';
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
  const PatientViewForParamedic({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar:
            customAppBar(context: context, title: 'Patient\'s Medical History'),
        body: SizedBox(
          width: context.getWidth(),
          child: SafeArea(
              child: SingleChildScrollView(
            child: Column(
              children: [
                height20,
                const PatientCard(),
                height40,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/emergency_contact.png',
                  firstTitle: 'Emergency Contact',
                  fisrtOnTap: () {
                    context.pushView(view: const PatientEmergencyContactView());
                  },
                  secondImagePath: 'assets/images/body_structure.png',
                  secondTitle: 'Body Structure',
                  secondOnTap: () {
                    context.pushView(view: const PatientBodyStructureView());
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/doctor.png',
                  firstTitle: 'Patient\'s Doctor',
                  fisrtOnTap: () {
                    context.pushView(view: const PatientDoctorView());
                  },
                  secondImagePath: 'assets/images/medical.png',
                  secondTitle: 'Medical Information',
                  secondOnTap: () {
                    context.pushView(
                        view: const PatientMedicalInformationView());
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/medication.png',
                  firstTitle: 'Medication',
                  fisrtOnTap: () {
                    context.pushView(view: const PatientMedicationView());
                  },
                  secondImagePath: 'assets/images/surgery.png',
                  secondTitle: 'Surgery Reports',
                  secondOnTap: () {
                    context.pushView(view: const PatientSurgeryReportView());
                  },
                ),
                height20,
                RowTwoContainerWidget(
                  firstImagePath: 'assets/images/X-Rays.png',
                  firstTitle: 'X-Rays Reports',
                  fisrtOnTap: () {
                    context.pushView(view: const PatientXrayReportView());
                  },
                  secondImagePath: 'assets/images/laboratory.png',
                  secondTitle: 'Laboratory Reports',
                  secondOnTap: () {
                    context.pushView(view: const PatientLaboratoryReportView());
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
