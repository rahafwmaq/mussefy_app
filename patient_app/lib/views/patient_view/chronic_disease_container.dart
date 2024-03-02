import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/chronic_disease_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';

class ChronicDiseaseContainer extends StatelessWidget {
  const ChronicDiseaseContainer({super.key, this.chronicDisease, this.patient});

  final List<ChronicDisease>? chronicDisease;
  final Patient? patient;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: ListView.builder(
        itemCount: chronicDisease!.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if (chronicDisease!.isEmpty) {
            return const Center(child: TextWidget(text: 'No Chronic Disease'));
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RowTwoTextWidget(
                        title: '•',
                        titleFontSize: 17,
                        patientDataFontSize: 16,
                        patientData: chronicDisease![index].disease.toString()),
                    InkWell(
                        onTap: () {
                          context.read<PatientBloc>().add(
                              DeleteChronicDiseaseEvent(
                                  chronicDisease![index].id!,
                                  patient!.id!,
                                  patient!));
                        },
                        child: const TextWidget(
                          text: 'x',
                          textColor: red,
                          fontSize: 18,
                        ))
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
