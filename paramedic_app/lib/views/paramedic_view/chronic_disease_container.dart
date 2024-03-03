import 'package:flutter/material.dart';
import 'package:paramedic_app/models/chronic_disease_model.dart';
import 'package:paramedic_app/models/patient_model.dart';
import 'package:paramedic_app/utilities/gloable_widgets/row_two_text_widget.dart';
import 'package:paramedic_app/utilities/gloable_widgets/text_widget.dart';
import 'package:paramedic_app/utilities/helpers/screen_size.dart';

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
                        title: '• ',
                        titleFontSize: 17,
                        patientDataFontSize: 16,
                        patientData: chronicDisease![index].disease.toString()),
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
