import 'package:flutter/material.dart';
import 'package:paramedic_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/container_widget.dart';
import 'package:paramedic_app/utilities/helpers/navigator.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/sizebox.dart';
import 'package:paramedic_app/views/paramedic_view/patient_body_structure_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_card.dart';
import 'package:paramedic_app/views/paramedic_view/patient_doctor_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_emergency_contact_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_laboratory_report_view.dart';
import 'package:paramedic_app/views/paramedic_view/patient_medical_report_view.dart';
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
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientEmergencyContactView());
                  },
                  iconPathImage: 'assets/images/emergency_contact.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Emergency Contact',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientBodyStructureView());
                  },
                  iconPathImage: 'assets/images/body_structure.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Body Structure',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientDoctorView());
                  },
                  iconPathImage: 'assets/images/doctor.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Doctor',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientMedicalReportView());
                  },
                  iconPathImage: 'assets/images/medical.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Medical Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientMedicationView());
                  },
                  iconPathImage: 'assets/images/medication.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Medication',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientSurgeryReportView());
                  },
                  iconPathImage: 'assets/images/surgery.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Surgery Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientXrayReportView());
                  },
                  iconPathImage: 'assets/images/X-Rays.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s X-Rays Reports',
                ),
                height20,
                ContainerWidget(
                  onTap: () {
                    context.pushView(view: const PatientLaboratoryReportView());
                  },
                  iconPathImage: 'assets/images/laboratory.png',
                  heightContainer: 8,
                  widthContainer: 1.1,
                  containerTitle: 'Patient\'s Laboratory Reports',
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
