import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/models/MedicalInformation_model.dart';
import 'package:paramedic_app/models/MobilityProblem_model.dart';
import 'package:paramedic_app/models/doctor_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/back.dart';
import 'package:paramedic_app/views/paramedic_view/front.dart';
import 'package:paramedic_app/views/paramedic_view/key_body_digram.dart';

class PatientBodyStructureView extends StatefulWidget {
  const PatientBodyStructureView({super.key, required this.patientId});
  final String patientId;

  @override
  State<PatientBodyStructureView> createState() =>
      _PatientBodyStructureViewState();
}

class _PatientBodyStructureViewState extends State<PatientBodyStructureView> {
  Patient? currentPatient;
  Doctor? currentDoctor;
  MedicalInformation? currentMedications;
  List<MobilityProblem> currentMobilityProblem = [];

  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadPatientAndMobilityData();
  }

  Future<void> loadPatientAndMobilityData() async {
    try {
      var patient = await SupaGetAndDelete()
          .getPatientById(widget.patientId); // Replace with actual patient ID
      MobilityProblem? mobilty;
      MedicalInformation? medication;
      if (patient != null) {
        // Load doctor data
        currentMobilityProblem =
            await SupaGetAndDelete().getMobilityProblems(patient.id!);
        // print(patient.medical_information_id!);
      }
      // Call setState to update the UI
      setState(() {
        currentPatient = patient;

        currentMedications = medication;
        if (currentMobilityProblem.isNotEmpty) {
          mobilty = currentMobilityProblem[0];
          isLoading = false;
        }
      });
    } catch (error) {
      setState(() => isLoading = false);
      // Handle any errors here, such as showing a dialog or a snackbar
      print('Error loading data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(
          body: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 255, 255, 255),
                    Color.fromARGB(255, 255, 255, 255)
                  ],
                ),
              ),
              child: Center(
                  child: CircularProgressIndicator(
                color: red,
              ))));
    }
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: Container(),
          title: const TextWidget(text: ''),
          centerTitle: true,
          bottom: TabBar(
              labelColor: red,
              dividerColor: lightGrey,
              indicatorColor: red,
              tabs: [
                TextWidget(
                  text: 'paramedic_patient_screen.front_body'.tr(),
                ),
                TextWidget(
                  text: 'paramedic_patient_screen.back_body'.tr(),
                )
              ]),
        ),
        body: TabBarView(
          children: [
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
                    patientId: widget.patientId,
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
          ],
        ),
      ),
    );
  }
}
