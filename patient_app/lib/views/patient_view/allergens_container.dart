import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_bloc.dart';
import 'package:mussefy_app/bloc/patient_bloc/patient_event.dart';
import 'package:mussefy_app/models/allergies_model.dart';
import 'package:mussefy_app/models/patient_model.dart';

import 'package:mussefy_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:mussefy_app/utilities/gloable_widgets/text_widget.dart';
import 'package:mussefy_app/utilities/helpers/screen_size.dart';
import 'package:mussefy_app/view_layout/color.dart';

class AllergensContainer extends StatelessWidget {
  const AllergensContainer({super.key, this.allergies, this.patient});
  final Patient? patient;

  final List<Allergies>? allergies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.getWidth(),
      child: ListView.builder(
          itemCount: allergies!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (allergies!.isEmpty) {
              return const Center(child: TextWidget(text: 'No Allergies'));
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
                          patientData:
                              allergies![index].allergiesName.toString()),
                      InkWell(
                          onTap: () {
                            context.read<PatientBloc>().add(
                                DeleteAllergiesEvent(patient!.id!, patient!,
                                    allergies![index].id!));
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
          }),
    );
  }
}
