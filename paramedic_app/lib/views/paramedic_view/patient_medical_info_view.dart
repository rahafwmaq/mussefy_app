// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:paramedic_app/database/supa_get_delete/supa_get_delete.dart';
import 'package:paramedic_app/models/medications_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';
import 'package:paramedic_app/views/paramedic_view/wedgets/medecal.dart';

class PatientMedicalInformationView extends StatefulWidget {
  final String patientId;

  const PatientMedicalInformationView({Key? key, required this.patientId})
      : super(key: key);

  @override
  _PatientMedicalInformationViewState createState() =>
      _PatientMedicalInformationViewState();
}

class _PatientMedicalInformationViewState
    extends State<PatientMedicalInformationView> {
  Future<List<Medication>>? medicationsFuture;

  @override
  void initState() {
    super.initState();
    medicationsFuture =
        SupaGetAndDelete().getMedicationsByPatientId(widget.patientId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
      ),
      body: FutureBuilder<List<Medication>>(
        future: medicationsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            final medications = snapshot.data!;
            return ListView.builder(
              itemCount: medications.length,
              itemBuilder: (context, index) {
                final medication = medications[index];
                return SizedBox(
                  height: context.getHeight(),
                  width: context.getWidth(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Column(
                      children: [
                        ContatinerW(
                          height: 100,
                          width: context.getWidth(divide: 1.15),
                          borderColor: noColor,
                          borderWidth: 0,
                          borderRadius: 20,
                          containerColor: white,
                          blurRadius: 20,
                          shadowColor: const Color.fromARGB(34, 0, 0, 0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextWidget(
                                      text:
                                          '${'my_medication.my_medication_name'.tr()} ${medication.medicationName}',
                                    ),
                                    TextWidget(
                                      text:
                                          '${'my_medication.my_medication_units'.tr()}${medication.dose}',
                                    ),
                                    TextWidget(
                                      text:
                                          '${'my_medication.my_medication_time'.tr()} ${medication.medicationTime}',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(
                child: Text('No medications found for this patient.'));
          }
        },
      ),
    );
  }
}
