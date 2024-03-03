import 'package:flutter/material.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_bloc.dart';
import 'package:paramedic_app/bloc/paramedic_bloc/bloc/patent_bloc/patient_state.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';
import 'package:paramedic_app/view_layout/color.dart';

// ignore_for_file: must_be_immutable

class PatientMedicationView extends StatelessWidget {
  PatientMedicationView({super.key, this.patient});
  final Patient? patient;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
