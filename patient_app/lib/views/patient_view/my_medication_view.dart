// ignore_for_file: must_be_immutable

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_state.dart';
import 'package:mussefy_app/models/medications_model.dart';
import 'package:mussefy_app/models/patient.dart';
import 'package:mussefy_app/utilities/gloable_widgets/app_bar_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/delete_dialoge.dart';
import 'package:mussefy_app/utilities/helpers/navigator.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';
import 'package:mussefy_app/views/patient_view/add_new_medication.dart';

class MyMedicationView extends StatelessWidget {
  MyMedicationView({super.key, this.patient});
  final Patient? patient;

  TextEditingController medicationUnitController = TextEditingController();
  TextEditingController medicationNameController = TextEditingController();
  TextEditingController medicationTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: customAppBar(
            context: context,
            title: 'my_medication.title_screen'.tr(),
            centerTitle: true,
            widget: AddNewMedication(
              medicationUnitController: medicationUnitController,
              medicationNameController: medicationNameController,
              medicationTimeController: medicationTimeController,
              nameLabelText: 'my_medication.name_label_text'.tr(),
              unitLabelText: 'my_medication.unit_label_text'.tr(),
              timeLabelText: 'my_medication.time_label_text'.tr(),
              titleAddInfo: 'my_medication.title_add_info'.tr(),
              onPressed: () {
                context.popView();
                if (medicationNameController.text.isNotEmpty &&
                    medicationUnitController.text.isNotEmpty &&
                    medicationTimeController.text.isNotEmpty) {
                  final Medication medication = Medication(
                      medicationName: medicationNameController.text,
                      medicationTime: medicationTimeController.text,
                      dose: medicationUnitController.text,
                      patientId: patient!.id);

                  context.read<PatientBloc>().add(AddPatientMedicationEvent(
                      medication, patient!.id.toString(), patient!));
                } else {
                  return null;
                }

                medicationNameController.clear();
                medicationUnitController.clear();
                medicationTimeController.clear();
              },
            )),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: SizedBox(
            height: context.getHeight(),
            width: context.getWidth(),
            child: BlocBuilder<PatientBloc, PatientBlocSatet>(
                builder: (context, state) {
              if (state is SucssessPatientMedicationState) {
                if (state.medication.isEmpty) {
                  return Center(
                      child: TextWidget(
                    text: 'x-rays_reports.suggestion'.tr(),
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                  ));
                } else if (state.medication.isNotEmpty) {
                  print("list");
                  return ListView.builder(
                    itemCount: state.medication.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: context.getWidth(divide: 1.80),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextWidget(
                                            text:
                                                '${'my_medication.my_medication_name'.tr()} ${state.medication[index].medicationName ?? ''}'),
                                        TextWidget(
                                          text:
                                              '${'my_medication.my_medication_units'.tr()}  ${state.medication[index].dose ?? ''}',
                                        ),
                                        TextWidget(
                                          text:
                                              '${'my_medication.my_medication_time'.tr()}  ${state.medication[index].medicationTime ?? ''}',
                                        )
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      deleteAlert(
                                        context: context,
                                        onPressed: () {
                                          context.read<PatientBloc>().add(
                                              DeletePatientMedicationEvent(
                                                  state.medication[index].id
                                                      .toString(),
                                                  patient!.id!));
                                          Navigator.pop(context);
                                        },
                                        content: state
                                            .medication[index].medicationName!,
                                      );
                                    },
                                    child: const TextWidget(
                                      text: 'x',
                                      fontSize: 25,
                                      textColor: red,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Divider()
                          ],
                        ),
                      );
                    },
                  );
                }
              } else if (state is ErrorPatientaState) {}
              return const Center(
                child: CircularProgressIndicator(
                  color: red,
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
