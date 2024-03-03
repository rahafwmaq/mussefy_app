import 'package:flutter/material.dart';
import 'package:paramedic_app/models/allergies_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';

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
                          title: '• ',
                          titleFontSize: 17,
                          patientDataFontSize: 16,
                          patientData:
                              allergies![index].allergiesName.toString()),
                    ],
                  ),
                ],
              );
            }
          }),
    );
  }
}
